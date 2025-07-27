# Flavor Town 🍦

A beautiful, portfolio-worthy web application that aggregates ice cream flavors of the day from various Wisconsin ice cream shops. 

## 🎯 Project Overview

**Flavor Town** serves as a web application for Ice Cream enthusiasts to find different flavors of the day in regards to their location

### Key Features
- **Time-Based Views:** Smooth month/week/daily view transitions with animations
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
- **Golang API:** High-performance REST API (read-only)
- **Python Scraper:** Automated data collection (write-only)
- **Python Data Processor:** Data transformation and analytics (write-only)

## 🚀 Quick Start

### Prerequisites
- Docker and Docker Compose
- Node.js 18+ (for local development)
- Go 1.21+ (for local development)
- Python 3.11+ (for local development)

### Local Development

1. **Clone and setup:**
   ```bash
   git clone <your-repo>
   cd flavor-town
   ```

2. **Start all services:**
   ```bash
   docker-compose up
   ```

3. **Access the application:**
   - Frontend: http://localhost:3000
   - API: http://localhost:8080
   - Database: localhost:5432

### Individual Service Development

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

## 🛠️ Technology Stack

### Frontend
- **React 18+** with TypeScript
- **Vite** for build tooling
- **Chakra UI** with custom theme system
- **Framer Motion** for animations
- **React Router** for navigation

### Backend
- **Golang 1.21+** for API service
- **Python 3.11+** for scraping and data processing
- **PostgreSQL** for primary database
- **Redis** for caching

### Infrastructure
- **Docker** for containerization
- **Docker Compose** for local development
- **GitHub Actions** for CI/CD
- **GCP/Render** for deployment

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

## 🚀 Deployment

### Local Development
```bash
docker-compose up
```

### Production Options 
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

**Built with ❤️ and lots of 🍦 for the ice cream community** 