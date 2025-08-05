package main

import (
	"log"
	"net/http"
	"os"

	_ "flavor-town-api/docs"

	"github.com/gin-gonic/gin"
)

// @title Flavor Town API
// @version 1.0
// @description A simple API for Flavor Town ice cream application
// @host localhost:8080
// @BasePath /api/v1

func main() {
	// Set Gin mode
	gin.SetMode(gin.ReleaseMode)

	// Create router
	r := gin.Default()

	// Add CORS middleware
	r.Use(func(c *gin.Context) {
		c.Header("Access-Control-Allow-Origin", "*")
		c.Header("Access-Control-Allow-Methods", "GET, POST, PUT, DELETE, OPTIONS")
		c.Header("Access-Control-Allow-Headers", "Origin, Content-Type, Content-Length, Accept-Encoding, X-CSRF-Token, Authorization")
		
		if c.Request.Method == "OPTIONS" {
			c.AbortWithStatus(204)
			return
		}
		
		c.Next()
	})

	// Serve static files from docs directory
	r.Static("/docs", "./docs")
	
	// Redirect /docs to /docs/index.html
	r.GET("/docs", func(c *gin.Context) {
		c.Redirect(http.StatusMovedPermanently, "/docs/index.html")
	})

	// API v1 routes
	v1 := r.Group("/api/v1")
	{
		// Test route
		v1.GET("/test", TestHandler)

		// Health check
		v1.GET("/health", HealthHandler)
	}

	// Get port from environment or default to 8080
	port := os.Getenv("PORT")
	if port == "" {
		port = "8080"
	}

	log.Printf("🚀 Starting Flavor Town API server on port %s", port)
	log.Printf("📚 Swagger docs available at: http://localhost:%s/docs/index.html", port)
	log.Printf("🔗 Test endpoint: http://localhost:%s/api/v1/test", port)
	
	if err := r.Run(":" + port); err != nil {
		log.Fatal("Failed to start server:", err)
	}
} 