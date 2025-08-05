# Flavor Town 🍦

A fun web application that aggregates ice cream flavors of the day from various Wisconsin & Colorado ice cream shops. 

## 🎯 Project Overview

**Flavor Town** serves as a web application for Ice Cream enthusiasts to find different flavors of the day in regards to their location

### Key Features
- **Time-Based Views:** Smooth month/week/daily views
- **Location-Based Discovery:** Find ice cream shops near you
- **Beautiful UI/UX:** Three themes (Light/Dark/Fun) with smooth animations
- **Microservices Architecture:** Four loosely coupled services
- **Automated Data Collection:** Python web scraping with daily updates

## 🏗️ Architecture

```
Python Services → Database ← Golang API ← React Frontend
     (Write)         (Read/Write)    (Read Only)    (UI)
```

### Services
- **React Frontend:** Vite + Chakra UI with theme system
- **Golang API:** REST API (read-only)
- **Python Scraper:** Automated data collection (write-only)
- **Python Data Processor:** Data transformation and analytics (write-only)

## 🚀 Quick Start

### Prerequisites
- Docker and Docker Compose (for containerized development)
  or
- Node.js 18+ (for local development)
- Go 1.21+ (for local development)
- Python 3.11+ (for local development)
- PostgreSQL 14+ (for local development)

### Development Options

#### Option 1: Docker Development (Recommended)
```bash

# Start all services
docker-compose up
```

#### Option 2: Local Development (without Docker)
For developers who can't use Docker or prefer native development:

```bash
# Quick start with Makefile
make install
make setup
make start
```

**📖 Full Local Development Guide:** [docs/local-development.md](docs/local-development.md)

### Access Your Application
- **Frontend:** http://localhost:3000
- **API:** http://localhost:8080
- **Database:** localhost:5432

### Individual Service Development

**Using Makefile (Recommended):**
```bash
# Start individual services
make start-api    # API only
make start-ui     # Frontend only
make scraper      # Python scraper
make processor    # Python data processor
```

**Manual Commands:**

**Frontend (React):**
```bash
cd ui
npm install
npm run dev
```

**API (Golang):**
```bash
cd api
go mod tidy
go run main.go
```

**Scraper (Python):**
```bash
cd bot
pip install -r requirements.txt
python scraper/main.py
```

**Data Processor (Python):**
```bash
cd bot
python processor/main.py
```

## 📁 Project Structure

```
flavor-town/
├── ui/                 # React Frontend
├── api/                # Golang API Service
├── bot/                # Python Services (Scraper + Processor)
├── db/                 # Database migrations and seeds
├── docs/               # Project documentation
├── docker-compose.yml  # Local development setup
└── README.md
```

## 🎨 Design System

### Themes
- **Light Mode:** Clean, bright interface with soft ice cream colors
- **Dark Mode:** Elegant dark interface with contrasting highlights
- **Fun Theme:** Vibrant "Neon Ice Cream" theme with bold effects

### Animations
- **Smooth Transitions:** Animations between views
- **Card Animations:** Tilt effects and hover states
- **Loading Animations:** Ice cream themed loading states
- **Theme Switching:** Smooth color transitions

## 🛠️ Development Tools

### Makefile Commands
The project includes a comprehensive Makefile for local development:

```bash
# Setup and installation
make install      # Install all dependencies
make setup        # Setup database and environment files

# Start services
make start        # Start all services
make start-api    # Start API only
make start-ui     # Start frontend only
make scraper      # Start Python scraper
make processor    # Start Python data processor

# Development utilities
make status       # Check service status
make test         # Run all tests
make stop         # Stop all services
make clean        # Clean up temporary files
make logs         # Show service logs

# Database helpers
make db-reset     # Reset database
make db-seed      # Seed database with data
```

**📖 Full Makefile Documentation:** See [docs/local-development.md](docs/local-development.md) for detailed usage.

## 🚀 Deployment

### Production Options - TBD
- **GCP:** Cloud Run + Cloud SQL + Memorystore
- **Render:** Full-stack platform with managed services
- **Vercel + Railway:** Hybrid approach

## 🤝 Contributing

This is a portfolio project showcasing modern development practices. The codebase emphasizes:
- Clean, maintainable code
- Comprehensive documentation
- Modern architectural patterns
- Beautiful user experiences

## 📄 License

This project is for portfolio demonstration purposes.

---

**Built with ❤️ and lots of 🍦** 
