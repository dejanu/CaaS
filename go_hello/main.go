package main

import (
	"fmt"
	"log"
	"net/http"
)

func main() {
	// /
	http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
		fmt.Fprintf(w, "<p><hr><center>Hello <b>GOPHER</b> 👾 </center></p>")
	})

	// /hi
	http.HandleFunc("/hi", func(w http.ResponseWriter, r *http.Request) {
		http.ServeFile(w, r, "./static/gopher_dance.gif") // serve static file
		log.Printf("%s %s %s\n", r.RemoteAddr, r.Method, r.URL)
	})

	log.Println("Server started at localhost:8888")
	log.Fatal(http.ListenAndServe(":8888", nil))
}
