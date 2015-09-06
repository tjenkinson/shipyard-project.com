package main

import (
	"flag"
	"log"
	"net/http"
)

var (
	listenAddr      string
	publicDirectory string
)

func init() {
	flag.StringVar(&listenAddr, "l", ":8080", "Listen address")
	flag.StringVar(&publicDirectory, "p", "./public", "Public directory to serve")
}

func main() {
	flag.Parse()
	log.Printf("starting server: addr=%s\n", listenAddr)
	log.Fatal(http.ListenAndServe(listenAddr, http.FileServer(http.Dir(publicDirectory))))
}
