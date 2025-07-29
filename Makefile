# Flavor Town Local Development Makefile
# Run the app locally without Docker

.PHONY: help install setup start stop clean test status

# Default target
help:
	@echo "🍦 Flavor Town Local Development Commands"
	@echo ""
	@echo "Setup Commands:"
	@echo "  make install    - Install all dependencies"
	@echo "  make setup      - Setup database and environment"
	@echo ""
	@echo "Development Commands:"
	@echo "  make start      - Start all services (API + Frontend)"
	@echo "  make start-api  - Start only the API service"
	@echo "  make start-ui   - Start only the frontend"
	@echo "  make stop       - Stop all running services"
	@echo ""
	@echo "Utility Commands:"
	@echo "  make status     - Check status of all services"
	@echo "  make test       - Run tests for all services"
	@echo "  make clean      - Clean up temporary files"
	@echo "  make logs       - Show logs for running services"

# Install all dependencies
install:
	@echo "📦 Installing dependencies..."
	@echo "Installing Node.js dependencies..."
	cd ui && npm install
	@echo "Installing Go dependencies..."
	cd api && go mod tidy
	@echo "Installing Python dependencies..."
	cd bot && python -m venv venv
	cd bot && source venv/bin/activate && pip install -r requirements.txt
	@echo "✅ All dependencies installed!"

# Setup database and environment
setup:
	@echo "🗄️ Setting up database..."
	@echo "Please ensure PostgreSQL is running first!"
	@echo "Creating database schema..."
	psql -h localhost -U flavortown -d flavortown -f db/init/01_create_schema.sql
	@echo "Seeding database..."
	psql -h localhost -U flavortown -d flavortown -f db/init/02_seed_data.sql
	@echo "Creating environment files..."
	@echo "VITE_API_URL=http://localhost:8080" > ui/.env
	@echo "VITE_ENV=development" >> ui/.env
	@echo "DATABASE_URL=postgresql://flavortown:flavortown@localhost:5432/flavortown?sslmode=disable" > api/.env
	@echo "# REDIS_URL=redis://localhost:6379" >> api/.env
	@echo "ENV=development" >> api/.env
	@echo "PORT=8080" >> api/.env
	@echo "DATABASE_URL=postgresql://flavortown:flavortown@localhost:5432/flavortown?sslmode=disable" > bot/.env
	@echo "ENV=development" >> bot/.env
	@echo "✅ Setup complete!"

# Start all services
start:
	@echo "🚀 Starting Flavor Town services..."
	@echo "Starting API server..."
	cd api && go run main.go &
	@sleep 3
	@echo "Starting Frontend..."
	cd ui && npm run dev &
	@echo "✅ Services started!"
	@echo "🌐 Frontend: http://localhost:3000"
	@echo "🔌 API: http://localhost:8080"
	@echo "Press Ctrl+C to stop all services"
	@wait

# Start only API
start-api:
	@echo "🚀 Starting API server..."
	cd api && go run main.go

# Start only frontend
start-ui:
	@echo "🎨 Starting Frontend..."
	cd ui && npm run dev

# Stop all services
stop:
	@echo "🛑 Stopping services..."
	@pkill -f "go run main.go" || true
	@pkill -f "npm run dev" || true
	@pkill -f "vite" || true
	@echo "✅ Services stopped!"

# Check status of all services
status:
	@echo "📊 Service Status:"
	@echo "PostgreSQL: $$(pg_isready -h localhost -p 5432 > /dev/null 2>&1 && echo "✅ Running" || echo "❌ Not running")"
	@echo "Redis: $$(redis-cli ping > /dev/null 2>&1 && echo "✅ Running" || echo "⚠️  Not running (optional)")"
	@echo "API: $$(curl -s http://localhost:8080/health > /dev/null 2>&1 && echo "✅ Running" || echo "❌ Not running")"
	@echo "Frontend: $$(curl -s http://localhost:3000 > /dev/null 2>&1 && echo "✅ Running" || echo "❌ Not running")"

# Run tests
test:
	@echo "🧪 Running tests..."
	@echo "Testing Frontend..."
	cd ui && npm test
	@echo "Testing API..."
	cd api && go test ./...
	@echo "Testing Python services..."
	cd bot && source venv/bin/activate && python -m pytest

# Clean up temporary files
clean:
	@echo "🧹 Cleaning up..."
	rm -rf ui/node_modules ui/.env api/.env bot/.env bot/venv
	@echo "✅ Cleanup complete!"

# Show logs
logs:
	@echo "📋 Service Logs:"
	@echo "API logs:"
	@ps aux | grep "go run main.go" | grep -v grep || echo "API not running"
	@echo "Frontend logs:"
	@ps aux | grep "npm run dev" | grep -v grep || echo "Frontend not running"

# Development helpers
dev-api:
	@echo "🔄 Starting API in development mode..."
	cd api && go run main.go

dev-ui:
	@echo "🔄 Starting Frontend in development mode..."
	cd ui && npm run dev

# Database helpers
db-reset:
	@echo "🔄 Resetting database..."
	psql -h localhost -U flavortown -d flavortown -c "DROP SCHEMA public CASCADE; CREATE SCHEMA public;"
	psql -h localhost -U flavortown -d flavortown -f db/init/01_create_schema.sql
	psql -h localhost -U flavortown -d flavortown -f db/init/02_seed_data.sql
	@echo "✅ Database reset complete!"

db-seed:
	@echo "🌱 Seeding database..."
	psql -h localhost -U flavortown -d flavortown -f db/init/02_seed_data.sql
	@echo "✅ Database seeded!"

# Python service helpers
scraper:
	@echo "🤖 Starting scraper..."
	cd bot && source venv/bin/activate && python scraper/main.py

processor:
	@echo "⚙️ Starting data processor..."
	cd bot && source venv/bin/activate && python processor/main.py 