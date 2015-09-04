package main

import (
	"flag"
	"net/http"
)

var (
	LISTEN_ADDR string
)

func init() {
	flag.StringVar(&LISTEN_ADDR, "l", ":8080", "Listen address")
}

func main() {
	flag.Parse()
	panic(http.ListenAndServe(LISTEN_ADDR, http.FileServer(http.Dir("./public"))))
}
