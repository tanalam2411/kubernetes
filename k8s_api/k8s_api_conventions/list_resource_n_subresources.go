package main

import (
	"bytes"
	"encoding/json"
	"errors"
	"fmt"
	"io/ioutil"
	"log"
	"net/http"
	"os/exec"
	"sort"
	"strings"
)

type ResourceDetail struct {
	Name string `json:"name"`
}

type ApiResource struct {
	Paths []string
}

func (apiRes *ApiResource) Deserialize(data []byte, key string) {
	var objMap map[string]*json.RawMessage
	err := json.Unmarshal(data, &objMap)
	if err != nil {
		log.Fatal(err)
	}

	err = json.Unmarshal(*objMap[key], &apiRes.Paths)
	if err != nil {
		log.Fatal(err)
	}
}

type Command struct {
	Name string
	Arg  []string
}

func (c Command) Execute() ([]byte, error) {
	cmd := exec.Command(c.Name, c.Arg...)
	//fmt.Println(cmd.String())
	cmdStr := cmd.String()
	out, err := cmd.Output()
	if err != nil {
		return out, errors.New(fmt.Sprintf("Failed to execute command: %s", cmdStr))
	}
	return out, nil
}

func main() {
	http.HandleFunc("/", apiResourceHandler)
	log.Print("serving at http://127.0.0.1:8000")
	log.Fatal(http.ListenAndServe("127.0.0.1:8000", nil))
}

func apiResourceHandler(w http.ResponseWriter, r *http.Request) {
	resourceDetails, sortedResources := getApiResources()

	var buf bytes.Buffer
	for _, res := range sortedResources {
		buf.WriteString(strings.Join([]string{"\n\n####", res, "\n"}, " "))
		subReses := resourceDetails[res]
		for _, subRes := range subReses {
			buf.WriteString(strings.Join([]string{"-", subRes.Name, "\n"}, " "))
		}
	}

	_ = ioutil.WriteFile("resources.md", buf.Bytes(), 0644)
	_, err := buf.WriteTo(w)
	if err != nil {
		http.Error(w, err.Error(), http.StatusInternalServerError)
		return
	}
}

func getApiResources() (map[string][]*ResourceDetail, []string) {
	cmd := Command{Name: "kubectl", Arg: []string{"get", "--raw", `/`}}
	data, err := cmd.Execute()
	if err != nil {
		panic(err)
	}

	var apiRes = new(ApiResource)
	apiRes.Deserialize(data, "paths")

	filteredPaths := filterSlice(apiRes.Paths, []string{"/api"})

	resources := make(map[string][]*ResourceDetail)

	for _, path := range filteredPaths {
		newCmd := Command{Name: "kubectl", Arg: []string{"get", "--raw", path}}
		newData, newErr := newCmd.Execute()
		if newErr != nil {
			log.Fatal(err)
		} else {
			if strings.Contains(string(newData), "resources") {
				var f interface{}
				err := json.Unmarshal(newData, &f)
				if err != nil {
					panic(err)
				}

				m := f.(map[string]interface{})
				n := m["resources"].([]interface{})

				for i := range n {
					name := n[i].(map[string]interface{})["name"].(string)
					resources[path] = append(resources[path], &ResourceDetail{name})
				}
			}
		}
	}

	return resources, filteredPaths
}

func filterSlice(inputSlice []string, filterBy []string) []string {
	var returnSlice []string
	for _, val := range inputSlice {
		for _, filterByStr := range filterBy {
			if strings.HasPrefix(val, filterByStr) {
				returnSlice = append(returnSlice, val)
			}
		}
	}

	sort.Slice(returnSlice, func(i, j int) bool {return len(returnSlice[i]) < len(returnSlice[j])})
	return returnSlice
}



/*
https://medium.com/code-zen/dynamically-creating-instances-from-key-value-pair-map-and-json-in-go-feef83ab9db2
https://www.jamessturtevant.com/posts/Using-the-Go-Delve-Debugger-from-the-command-line/
https://medium.com/@tannhauser.sphinx/bash-kubernetes-script-to-list-all-available-resources-subresources-c65a5c2c1173
*/