package main

import (
	"encoding/json"
	"errors"
	"fmt"
	"log"
	"os/exec"
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
	cmd := Command{Name: "kubectl", Arg: []string{"get", "--raw", `/`}}
	data, err := cmd.Execute()
	if err != nil {
		panic(err)
	}

	var apiRes = new(ApiResource)
	apiRes.Deserialize(data, "paths")

	filteredPaths := filterSlice(apiRes.Paths, []string{"/api"})

	for _, path := range filteredPaths {
		newCmd := Command{Name: "kubectl", Arg: []string{"get", "--raw", path}}
		newData, newErr := newCmd.Execute()
		if newErr != nil {
			log.Fatal(err)
		} else {
			if strings.Contains(string(newData), "resources") {
				fmt.Println("\n=========", path, "==========")
				var f interface{}
				err := json.Unmarshal(newData, &f)
				if err != nil {
					panic(err)
				}

				m := f.(map[string]interface{})
				n := m["resources"].([]interface{})
				resources := make([]*ResourceDetail, len(n))

				for i := range n {
					name := n[i].(map[string]interface{})["name"].(string)
					resources[i] = &ResourceDetail{name}
					fmt.Println(name)
				}
			}
		}
	}
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
	return returnSlice
}
