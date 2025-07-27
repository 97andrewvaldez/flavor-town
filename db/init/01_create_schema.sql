-- Flavor Town Database Schema
-- Initial setup script

-- Create regions table
CREATE TABLE IF NOT EXISTS regions (
    id SERIAL PRIMARY KEY,
    city VARCHAR(100) NOT NULL,
    state VARCHAR(2) NOT NULL,
    zip VARCHAR(10) NOT NULL,
    latitude DECIMAL(10, 8),
    longitude DECIMAL(11, 8),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create restaurants table
CREATE TABLE IF NOT EXISTS restaurants (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    phone VARCHAR(20),
    url VARCHAR(500),
    flavor_of_day_url VARCHAR(500) NOT NULL,
    region_id INTEGER REFERENCES regions(id),
    date_added TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    is_active BOOLEAN DEFAULT TRUE,
    last_scraped TIMESTAMP,
    error_count INTEGER DEFAULT 0,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create flavors table
CREATE TABLE IF NOT EXISTS flavors (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    restaurant_id INTEGER REFERENCES restaurants(id),
    category VARCHAR(100),
    is_seasonal BOOLEAN DEFAULT FALSE,
    allergens TEXT[], -- Array of allergen strings
    date_added TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create flavors_of_the_day table
CREATE TABLE IF NOT EXISTS flavors_of_the_day (
    id SERIAL PRIMARY KEY,
    date DATE NOT NULL,
    flavor_id INTEGER REFERENCES flavors(id),
    restaurant_id INTEGER REFERENCES restaurants(id),
    scraped_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    is_available BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create scraping_logs table
CREATE TABLE IF NOT EXISTS scraping_logs (
    id SERIAL PRIMARY KEY,
    restaurant_id INTEGER REFERENCES restaurants(id),
    status VARCHAR(20) NOT NULL, -- 'success', 'error', 'partial'
    error_message TEXT,
    flavors_found INTEGER DEFAULT 0,
    scraped_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create indexes for performance
CREATE INDEX IF NOT EXISTS idx_restaurants_region_id ON restaurants(region_id);
CREATE INDEX IF NOT EXISTS idx_flavors_restaurant_id ON flavors(restaurant_id);
CREATE INDEX IF NOT EXISTS idx_flavors_of_the_day_date ON flavors_of_the_day(date);
CREATE INDEX IF NOT EXISTS idx_flavors_of_the_day_restaurant ON flavors_of_the_day(restaurant_id);
CREATE INDEX IF NOT EXISTS idx_flavors_of_the_day_flavor ON flavors_of_the_day(flavor_id);
CREATE INDEX IF NOT EXISTS idx_scraping_logs_restaurant ON scraping_logs(restaurant_id);
CREATE INDEX IF NOT EXISTS idx_scraping_logs_status ON scraping_logs(status);

-- Create updated_at trigger function
CREATE OR REPLACE FUNCTION update_updated_at_column()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at = CURRENT_TIMESTAMP;
    RETURN NEW;
END;
$$ language 'plpgsql';

-- Create triggers for updated_at
CREATE TRIGGER update_regions_updated_at BEFORE UPDATE ON regions FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();
CREATE TRIGGER update_restaurants_updated_at BEFORE UPDATE ON restaurants FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();
CREATE TRIGGER update_flavors_updated_at BEFORE UPDATE ON flavors FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();
CREATE TRIGGER update_flavors_of_the_day_updated_at BEFORE UPDATE ON flavors_of_the_day FOR EACH ROW EXECUTE FUNCTION update_updated_at_column(); 