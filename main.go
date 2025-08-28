package main

import (
	"encoding/json"
	"log"
	"net/http"
	"os"
)

type Response struct {
	Message string `json:"message"`
	Status  string `json:"status"`
}

func main() {
	port := os.Getenv("PORT")
	if port == "" {
		port = "8080"
	}

	http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
		response := Response{
			Message: "Welcome to Go Backend API!",
			Status:  "success",
		}
		w.Header().Set("Content-Type", "application/json")
		json.NewEncoder(w).Encode(response)
	})

	http.HandleFunc("/api/health", func(w http.ResponseWriter, r *http.Request) {
		response := Response{
			Message: "API is healthy",
			Status:  "success",
		}
		w.Header().Set("Content-Type", "application/json")
		json.NewEncoder(w).Encode(response)
	})

	http.HandleFunc("/api/users", func(w http.ResponseWriter, r *http.Request) {
		if r.Method == "GET" {
			users := []map[string]interface{}{
				{"id": 1, "name": "John Doe", "email": "john@example.com"},
				{"id": 2, "name": "Jane Smith", "email": "jane@example.com"},
			}
			w.Header().Set("Content-Type", "application/json")
			json.NewEncoder(w).Encode(users)
		} else {
			http.Error(w, "Method not allowed", http.StatusMethodNotAllowed)
		}
	})

	log.Printf("Server starting on port %s", port)
	log.Fatal(http.ListenAndServe(":"+port, nil))
}
