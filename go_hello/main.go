package main

import (
	"fmt"
	"net/http"
	"log"
)

func main() {

	http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
		fmt.Fprintf(w, "<p><hr><center>GO <b>LION</b>🦁</center></p>")

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
