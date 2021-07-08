#!/bin/bash

usage="$(basename "$0") [-h] -- pod tcpdump

where:
    -h,  --help              help text
    -l,  --list              list all running sniff jobs
    -s,  --start-sniffing    start sniffing
        Options:
          -n, --namespace    target namespace
          -p, --pod          start sniffing for pod (either name or alias), if alias provided will start sniffing for all pods with the alias
          -o, --output-dir   output directory(default: ~/.ksniff), where tcpdump files will be generated(it will create folder by name tcpdump-data where pcap files will be stored
        Example:
          $ ./podTCPDump.sh --namespace=default --pod=nginx --output-dir=/tmp --start-sniffing

    -st, --stop-sniffing     stop sniffing
        Options:
          -n, --namespace    stop sniffing for all pods within provided namespace
          -o, --output-dir   output directory, where tcpdump files will be generated(is required for stopping sniff as it has all running pids)
        Example:
          $ ./podTCPDump.sh --namespace=default --output-dir=/tmp --stop-sniffing
    "

LIST=false
START_SNIFFING=false
STOP_SNIFFING=false
NAMESPACE=""
POD=""
OUTPUT_LOCATION="$HOME/.ksniff"


for arg in "$@"
do
    case $arg in
        -l|--list)
        LIST=true
        shift # Remove --list from processing
        ;;
        -s|--start-sniffing)
        START_SNIFFING=true
        shift # Remove --start-sniffing from processing
        ;;
        -st|--stop-sniffing)
        STOP_SNIFFING=true
        shift # Remove --stop-sniffing from processing
        ;;
        -n=*|--namespace=*)
        NAMESPACE="${arg#*=}"
        shift # Remove --namespace= from processing
        ;;
        -p=*|--pod=*)
        POD="${arg#*=}"
        shift # Remove --pod= from processing
        ;;
        -o=*|--output-dir=*)
        OUTPUT_LOCATION="${arg#*=}"
        shift # Remove --output-dir= from processing
        ;;
        *)
        echo "$usage" >&2
        shift # Remove generic argument from processing
        ;;
    esac
done


function start_sniffing() {
  output_dir=$OUTPUT_LOCATION/tcpdump-data/$NAMESPACE/$POD
  pid_dir=$output_dir/pids
  pcap_dir=$output_dir/pcaps
  mkdir -p $output_dir
  mkdir -p $pid_dir
  mkdir -p $pcap_dir

  if [[ ! -e $output_dir/sniffed_pods.txt ]]; then
      touch $output_dir/sniffed_pods.txt
  fi

  echo "Starting packet sniff for pods: $POD within namespace: $NAMESPACE"
  echo "The tcpdump pcap files will be stored location: $pcap_dir"

  pod_list=`oc get pods -n $NAMESPACE --field-selector=status.phase=Running | grep -i $POD | awk '{print $1}'`

  for pod in $pod_list;do
    if grep -Fxq "$pod" $output_dir/sniffed_pods.txt
    then
      echo "Sniff already running for pod: $pod"
    else
      echo "Starting Sniff for pod: $pod"
      echo $pod >> $output_dir/sniffed_pods.txt
      nohup ./kubectl-sniff $pod -p -n $NAMESPACE -o $pcap_dir/$pod.pcap > /dev/null 2>&1 &
      touch $pid_dir/$! | head -1
    fi

  done

}


function stop_sniffing() {
  echo "Stopping all packet sniff jobs within namespace: $NAMESPACE"
  output_dir=$OUTPUT_LOCATION/tcpdump-data/$NAMESPACE
  pid_list=`ls -1 $output_dir/*/pids | grep -v $OUTPUT_LOCATION`
  for pid in $pid_list;do
    echo $pid
    kill $pid
  done

  ksniff_pod_list=`oc get pods -n $NAMESPACE | grep -i ksniff | awk '{print $1}'`
  for kpod in $ksniff_pod_list;do
    read -p "Do you wish to delete this -"$kpod" pod? Yy|Nn: " yn
    case $yn in
        [Yy]* ) oc delete pod $kpod -n $NAMESPACE;;
        [Nn]* ) ;;
        * ) echo "Please answer yes or no.";;
    esac

  done

  rm -rf $output_dir/*/pids
  rm -rf $output_dir/*/sniffed_pods.txt
}


function list_sniff_jobs() {
  # shellcheck disable=SC2046
  ps -ef | grep "[kubectl]-sniff" | awk '{print $2 " " $10 " " $14}'
}

if [ $START_SNIFFING == true ];then
  start_sniffing
fi


if [ $STOP_SNIFFING == true ];then
  stop_sniffing
fi


if [ $LIST == true ];then
  list_sniff_jobs
fi
