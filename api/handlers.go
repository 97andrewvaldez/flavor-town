package main

import (
	"net/http"

	"github.com/gin-gonic/gin"
)

// TestHandler godoc
// @Summary Test endpoint
// @Description A simple test endpoint to verify the API is working
// @Tags test
// @Accept json
// @Produce json
// @Success 200 {object} map[string]interface{}
// @Router /api/v1/test [get]
func TestHandler(c *gin.Context) {
	c.JSON(http.StatusOK, gin.H{
		"message": "Flavor Town API is running! 🍦",
		"status":  "success",
		"version": "1.0.0",
	})
}

// HealthHandler godoc
// @Summary Health check
// @Description Check if the API is healthy
// @Tags health
// @Accept json
// @Produce json
// @Success 200 {object} map[string]interface{}
// @Router /api/v1/health [get]
func HealthHandler(c *gin.Context) {
	c.JSON(http.StatusOK, gin.H{
		"status":  "healthy",
		"service": "flavor-town-api",
	})
} 