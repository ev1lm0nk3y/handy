package main

import (
	"fmt"
	"net/http"

	"github.com/prometheus/client_golang/prometheus"
	"github.com/prometheus/client_golang/prometheus/promhttp"
)

var (
	// Track the count of URIs accessed
	urlCount = prometheus.NewCounterVec(
		prometheus.CounterOpts{
			Name: "url_count",
			Help: "Number of times a URL is accessed",
		},
		[]string{"url"},
	)
)

func init() {
	prometheus.MustRegister(urlCount)
}

func main() {
	http.HandleFunc("/", HelloServer)
	http.HandleFunc("/handy", HandyServer)
	http.Handle("/metrics", promhttp.Handler())
	http.ListenAndServe(":8080", nil)
}

// HelloServer says HI
func HelloServer(w http.ResponseWriter, r *http.Request) {
	urlCount.With(prometheus.Labels{"url": r.URL.Path}).Inc()
	fmt.Fprintf(w, "HI THERE!")
}

// HandyServer redirects you
func HandyServer(w http.ResponseWriter, r *http.Request) {
	urlCount.With(prometheus.Labels{"url": r.URL.Path}).Inc()
	http.Redirect(w, r, "https://tenor.com/view/hi-gif-9962793", 302)
}
