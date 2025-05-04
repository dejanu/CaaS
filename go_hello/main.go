package main

import (
	"fmt"
	"log"
	"net/http"
)

const (
	port = ":8888"
)

func main() {
	// /
	http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
		fmt.Fprintf(w, "<p><hr><center>Hello <b>GOPHER with COLOUR</b> 👾 </center></p>")
		log.Printf("%s %s %s\n", r.RemoteAddr, r.Method, r.URL)
	})

	// /hi
	http.HandleFunc("/hi", func(w http.ResponseWriter, r *http.Request) {
		http.ServeFile(w, r, "./static/gopher_party.gif") // serve static file
		log.Printf("%s %s %s\n", r.RemoteAddr, r.Method, r.URL)
	})

	log.Printf("Starting server at http://localhost%s\n", port)
	if err := http.ListenAndServe(port, nil); err != nil {
		log.Fatalf("Server failed to start: %v\n", err)
	}
}
