package main

import (
	"fmt"
	"log"
	"net/http"
)

func main() {
	// / endpoint
	http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
		// fmt.Fprintf(w, "<p><hr><center>GO <b>LION</b>🦁</center></p>")
		http.ServeFile(w, r, "./static/gopher_dance.gif") // serve static file
		log.Printf("%s %s %s\n", r.RemoteAddr, r.Method, r.URL)
	})

	// /hi endpoint
	http.HandleFunc("/hi", func(w http.ResponseWriter, r *http.Request) {
		fmt.Fprintf(w, "Hellooo woooorld")
	})

	//localhost:8888
	log.Println("Server started at localhost:8888")
	log.Fatal(http.ListenAndServe(":8888", nil))
}
