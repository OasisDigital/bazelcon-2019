package main

import (
	"context"
	"fmt"
	"log"
	"net/http"
	"strings"

	"github.com/mattn/go-slim"

	pb "proto/grocery/api"

	"google.golang.org/grpc"
)

var (
	serverAddr = "localhost:8500"
	client     pb.GroceryListClient
)

func main() {
	conn, err := grpc.Dial(serverAddr, grpc.WithInsecure())
	if err != nil {
		log.Fatalf("fail to dial: %v", err)
	}
	client = pb.NewGroceryListClient(conn)
	http.HandleFunc("/", HelloServer)
	http.ListenAndServe(":8080", nil)
}

const pageTemplate string = `doctype 5
html lang="en"
  head
    meta charset="UTF-8"
    title
  body
    h1 = result.GetOccasion()
    ul
    - for entry in result.GetEntry()
      li #{entry.Qty} #{entry.Description}
`

// HelloServer : our entry point.
func HelloServer(w http.ResponseWriter, r *http.Request) {
	// Fetch the data
	result, err := client.GetList(context.Background(), &pb.Empty{})
	if err != nil {
		log.Fatalf("Could not retrieve data: %v", err)
		return
	}
	// Prepare a template
	compiledTemplate, err := slim.Parse(strings.NewReader(pageTemplate))
	if err != nil {
		fmt.Fprintf(w, "Failed! %v", err)
		return
	}

	log.Printf("data: %v", result)

	// Use the template to format the data
	err = compiledTemplate.Execute(w, map[string]interface{}{"result": result})
	if err != nil {
		log.Fatalf("Template execution failed: %v", err)
	}
}

// http://localhost:8080/
