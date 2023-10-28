package main

import (
	"fmt"
	"log"
	"net/http"
)

func main() {

	http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
		fmt.Fprintf(w, "<p><hr><center>GO <b>LION</b>🦁</center></p>")
		log.Printf("%s %s %s\n", r.RemoteAddr, r.Method, r.URL)

		// // server static file
		// http.ServeFile(w, r, "./static/gopher_dance.gif")
	})

	http.HandleFunc("/hi", func(w http.ResponseWriter, r *http.Request) {
		fmt.Fprintf(w, "Hi")
	})

	log.Fatal(
		http.ListenAndServe(":8888", nil),
	)

}
