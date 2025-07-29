# Local Development Guide for Mac 🍎

This guide helps you run Flavor Town locally on Mac without Docker. Perfect for myself when I want to code on my ancient laptop.

## 📋 Prerequisites

### Required Software
- **Node.js 18+** - [Download here](https://nodejs.org/)
- **Go 1.21+** - [Download here](https://golang.org/dl/)
- **Python 3.11+** - [Download here](https://www.python.org/downloads/)
- **PostgreSQL 14+** - [Download here](https://www.postgresql.org/download/macosx/)


## 🗄️ Database Setup

### 1. Install PostgreSQL
```bash
# Using Homebrew (recommended)
brew install postgresql@14
brew services start postgresql@14

# Or download from postgresql.org
```

### 2. Create Database and User
```bash
# Connect to PostgreSQL
psql postgres

# Create user and database
CREATE USER flavortown WITH PASSWORD 'flavortown';
CREATE DATABASE flavortown OWNER flavortown;
GRANT ALL PRIVILEGES ON DATABASE flavortown TO flavortown;
\q
```

### 3. Initialize Database Schema
```bash
# Run schema creation
psql -h localhost -U flavortown -d flavortown -f db/init/01_create_schema.sql

# Seed with initial data
psql -h localhost -U flavortown -d flavortown -f db/init/02_seed_data.sql
```

## 🚀 Quick Start with Makefile

The easiest way to get started is using the provided Makefile:

```bash
# Install all dependencies
make install

# Setup database and environment files
make setup

# Start all services
make start
```

## 🔧 Manual Setup

If you prefer to set up services manually, follow these steps:

### 1. Install Dependencies

**Frontend (React):**
```bash
cd ui
npm install
```

**API (Golang):**
```bash
cd api
go mod tidy
```

**Python Services:**
```bash
cd bot
python -m venv venv
source venv/bin/activate
pip install -r requirements.txt
```

### 2. Create Environment Files

**Frontend (.env in ui/):**
```bash
echo "VITE_API_URL=http://localhost:8080" > ui/.env
echo "VITE_ENV=development" >> ui/.env
```

**API (.env in api/):**
```bash
echo "DATABASE_URL=postgresql://flavortown:flavortown@localhost:5432/flavortown?sslmode=disable" > api/.env
echo "ENV=development" >> api/.env
echo "PORT=8080" >> api/.env
```

**Python Services (.env in bot/):**
```bash
echo "DATABASE_URL=postgresql://flavortown:flavortown@localhost:5432/flavortown?sslmode=disable" > bot/.env
echo "ENV=development" >> bot/.env
```

### 3. Start Services

**Start API (Terminal 1):**
```bash
cd api
go run main.go
```

**Start Frontend (Terminal 2):**
```bash
cd ui
npm run dev
```

**Start Python Services (Optional - Terminal 3 & 4):**
```bash
# Scraper
cd bot
source venv/bin/activate
python scraper/main.py

# Data Processor
cd bot
source venv/bin/activate
python processor/main.py
```

## 🌐 Access Your Application

Once all services are running:
- **Frontend:** http://localhost:3000
- **API:** http://localhost:8080
- **Database:** localhost:5432

## 🛠️ Development Commands

### Using Makefile
```bash
# Check service status
make status

# Run tests
make test

# Stop all services
make stop

# Reset database
make db-reset

# Clean up
make clean
```

### Manual Commands
```bash
# Frontend development
cd ui && npm run dev

# API development
cd api && go run main.go

# Python scraper
cd bot && source venv/bin/activate && python scraper/main.py

# Python processor
cd bot && source venv/bin/activate && python processor/main.py
```

## 🔍 Troubleshooting

### Common Issues

**1. PostgreSQL Connection Issues**
```bash
# Check if PostgreSQL is running
brew services list | grep postgresql

# Start PostgreSQL if not running
brew services start postgresql@14

# Test connection
psql -h localhost -U flavortown -d flavortown
```

**2. Port Already in Use**
```bash
# Find process using port
lsof -i :3000  # Frontend
lsof -i :8080  # API
lsof -i :5432  # Database

# Kill process
kill -9 <PID>
```

**3. Python Virtual Environment Issues**
```bash
# Recreate virtual environment
cd bot
rm -rf venv
python -m venv venv
source venv/bin/activate
pip install -r requirements.txt
```

**4. Node.js Dependencies Issues**
```bash
# Clear npm cache and reinstall
cd ui
rm -rf node_modules package-lock.json
npm install
```

### Service Status Check
```bash
# Check if services are running
make status
```

## 📊 Monitoring

### Check Service Health
- **Frontend:** http://localhost:3000
- **API Health:** http://localhost:8080/health
- **Database:** `psql -h localhost -U flavortown -d flavortown -c "SELECT version();"`

### View Logs
```bash
# API logs
cd api && go run main.go

# Frontend logs
cd ui && npm run dev

# Python service logs
cd bot && source venv/bin/activate && python scraper/main.py
```

## 🧪 Testing

### Run All Tests
```bash
make test
```

### Individual Service Tests
```bash
# Frontend tests
cd ui && npm test

# API tests
cd api && go test ./...

# Python tests
cd bot && source venv/bin/activate && python -m pytest
```

## 🔄 Development Workflow

### Typical Development Session
1. **Start services:** `make start`
2. **Make changes** to your code
3. **Test changes** with `make test`
4. **Reset database** if needed: `make db-reset`
5. **Stop services:** `make stop`

### Hot Reloading
- **Frontend:** Changes auto-reload at http://localhost:3000
- **API:** Restart with `go run main.go` for changes
- **Python:** Restart services for changes

## 📝 Environment Variables

### Frontend (.env in ui/)
```
VITE_API_URL=http://localhost:8080
VITE_ENV=development
```

### API (.env in api/)
```
DATABASE_URL=postgresql://flavortown:flavortown@localhost:5432/flavortown?sslmode=disable
ENV=development
PORT=8080
```

### Python Services (.env in bot/)
```
DATABASE_URL=postgresql://flavortown:flavortown@localhost:5432/flavortown?sslmode=disable
ENV=development
```

## 🎯 Next Steps

Once you have the local development environment running:

1. **Explore the codebase** - Check out the architecture in `docs/architecture.md`
2. **Run the scraper** - Collect real ice cream data
3. **Customize themes** - Modify the UI in `ui/src/theme/`
4. **Add features** - Extend the API in `api/`
5. **Deploy** - Follow the deployment guide in `docs/`

---

**Happy coding! 🍦✨** 