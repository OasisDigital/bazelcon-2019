package main

import (
	"fmt"
	"net/http"
	"strings"

	"github.com/mattn/go-slim"
)

func main() {
	http.HandleFunc("/", HelloServer)
	http.ListenAndServe(":8080", nil)
}

const pageTemplate string = `doctype 5
html lang="en"
  head
    meta charset="UTF-8"
    title
  body
    ul
    - for x in groceries
      li = x
`

// HelloServer : our entry point.
func HelloServer(w http.ResponseWriter, r *http.Request) {
	compiledTemplate, err := slim.Parse(strings.NewReader(pageTemplate))
	if err != nil {
		fmt.Fprintf(w, "Failed! %v", err)
		return
	}
	err = compiledTemplate.Execute(w, map[string]interface{}{
		"groceries": []string{"apples", "bananas", "basil"},
	})
}

// http://localhost:8080/world
