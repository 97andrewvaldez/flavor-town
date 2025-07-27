-- Flavor Town Seed Data
-- Sample data for development

-- Insert sample regions (Wisconsin)
INSERT INTO regions (city, state, zip, latitude, longitude) VALUES
('Madison', 'WI', '53703', 43.0731, -89.4012),
('Madison', 'WI', '53705', 43.0731, -89.4012),
('Madison', 'WI', '53711', 43.0731, -89.4012),
('Milwaukee', 'WI', '53202', 43.0389, -87.9065),
('Milwaukee', 'WI', '53211', 43.0389, -87.9065),
('Green Bay', 'WI', '54301', 44.5133, -88.0133),
('Appleton', 'WI', '54911', 44.2619, -88.4154),
('Eau Claire', 'WI', '54701', 44.8113, -91.4985)
ON CONFLICT DO NOTHING;

-- Insert sample restaurants
INSERT INTO restaurants (name, description, phone, url, flavor_of_day_url, region_id, is_active) VALUES
('Chocolate Shoppe Ice Cream', 'Artisanal ice cream shop with unique flavors', '(608) 255-5454', 'https://chocolateshoppeicecream.com', 'https://chocolateshoppeicecream.com/flavors', 1, true),
('Michael''s Frozen Custard', 'Classic frozen custard and ice cream', '(608) 255-1234', 'https://michaelscustard.com', 'https://michaelscustard.com/daily-flavors', 1, true),
('Gilles Frozen Custard', 'Milwaukee''s favorite frozen custard', '(414) 453-4875', 'https://gillescustard.com', 'https://gillescustard.com/flavors-of-the-day', 4, true),
('Kopp''s Frozen Custard', 'Premium frozen custard since 1959', '(414) 282-4312', 'https://kopps.com', 'https://kopps.com/daily-flavors', 4, true),
('Zesty''s Frozen Custard', 'Green Bay''s local favorite', '(920) 432-1234', 'https://zestyscustard.com', 'https://zestyscustard.com/todays-flavors', 6, true),
('Appleton Ice Cream Co', 'Handcrafted ice cream in Appleton', '(920) 555-1234', 'https://appletonicecream.com', 'https://appletonicecream.com/daily', 7, true),
('Eau Claire Creamery', 'Local ice cream and frozen treats', '(715) 234-5678', 'https://eauclairecreamery.com', 'https://eauclairecreamery.com/flavors', 8, true)
ON CONFLICT DO NOTHING;

-- Insert sample flavors
INSERT INTO flavors (name, description, restaurant_id, category, is_seasonal) VALUES
('Vanilla Bean', 'Classic vanilla with real vanilla beans', 1, 'Vanilla', false),
('Chocolate Fudge', 'Rich chocolate with fudge swirls', 1, 'Chocolate', false),
('Strawberry', 'Fresh strawberry ice cream', 1, 'Fruit', false),
('Mint Chocolate Chip', 'Mint ice cream with chocolate chips', 1, 'Mint', false),
('Cookie Dough', 'Vanilla ice cream with cookie dough pieces', 1, 'Cookie', false),
('Butter Pecan', 'Buttery ice cream with pecans', 2, 'Nut', false),
('Chocolate Chip', 'Vanilla ice cream with chocolate chips', 2, 'Chocolate', false),
('Strawberry Cheesecake', 'Strawberry ice cream with cheesecake pieces', 2, 'Cheesecake', false),
('Caramel Swirl', 'Vanilla ice cream with caramel swirl', 3, 'Caramel', false),
('Chocolate Brownie', 'Chocolate ice cream with brownie pieces', 3, 'Chocolate', false),
('Pumpkin Spice', 'Seasonal pumpkin spice ice cream', 4, 'Seasonal', true),
('Peppermint', 'Holiday peppermint ice cream', 4, 'Holiday', true),
('Blue Moon', 'Midwest favorite blue ice cream', 5, 'Novelty', false),
('Superman', 'Colorful Midwest favorite', 5, 'Novelty', false),
('Butter Brickle', 'Buttery ice cream with toffee pieces', 6, 'Toffee', false),
('Chocolate Almond', 'Chocolate ice cream with almonds', 6, 'Chocolate', false),
('Maple Walnut', 'Maple ice cream with walnuts', 7, 'Maple', false),
('Coffee', 'Coffee flavored ice cream', 7, 'Coffee', false)
ON CONFLICT DO NOTHING;

-- Insert sample daily flavors (for today)
INSERT INTO flavors_of_the_day (date, flavor_id, restaurant_id, is_available) VALUES
(CURRENT_DATE, 1, 1, true),
(CURRENT_DATE, 2, 1, true),
(CURRENT_DATE, 6, 2, true),
(CURRENT_DATE, 7, 2, true),
(CURRENT_DATE, 9, 3, true),
(CURRENT_DATE, 10, 3, true),
(CURRENT_DATE, 11, 4, true),
(CURRENT_DATE, 13, 5, true),
(CURRENT_DATE, 14, 5, true),
(CURRENT_DATE, 15, 6, true),
(CURRENT_DATE, 17, 7, true),
(CURRENT_DATE, 18, 7, true)
ON CONFLICT DO NOTHING; 