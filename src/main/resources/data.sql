-- =============================================================================
-- Zone seed data — 250 rows covering US + international cities
-- =============================================================================

-- ---- NEW YORK CITY ----------------------------------------------------------
INSERT INTO zone_region (name, region_type, center_lat, center_lon, radius_km, speed_limit_kmh) VALUES ('Downtown Manhattan',       'URBAN',    40.7128, -74.0060,  2.0, 30.0);
INSERT INTO zone_region (name, region_type, center_lat, center_lon, radius_km, speed_limit_kmh) VALUES ('Midtown Manhattan',         'URBAN',    40.7549, -73.9840,  2.0, 30.0);
INSERT INTO zone_region (name, region_type, center_lat, center_lon, radius_km, speed_limit_kmh) VALUES ('Upper East Side',           'URBAN',    40.7736, -73.9566,  1.5, 30.0);
INSERT INTO zone_region (name, region_type, center_lat, center_lon, radius_km, speed_limit_kmh) VALUES ('Upper West Side',           'URBAN',    40.7870, -73.9754,  1.5, 30.0);
INSERT INTO zone_region (name, region_type, center_lat, center_lon, radius_km, speed_limit_kmh) VALUES ('Harlem',                    'URBAN',    40.8116, -73.9465,  2.0, 30.0);
INSERT INTO zone_region (name, region_type, center_lat, center_lon, radius_km, speed_limit_kmh) VALUES ('Brooklyn Downtown',         'URBAN',    40.6928, -73.9903,  2.5, 40.0);
INSERT INTO zone_region (name, region_type, center_lat, center_lon, radius_km, speed_limit_kmh) VALUES ('Brooklyn Williamsburg',     'URBAN',    40.7081, -73.9571,  2.0, 40.0);
INSERT INTO zone_region (name, region_type, center_lat, center_lon, radius_km, speed_limit_kmh) VALUES ('JFK Airport Corridor',      'HIGHWAY',  40.6413, -73.7781,  5.0, 90.0);
INSERT INTO zone_region (name, region_type, center_lat, center_lon, radius_km, speed_limit_kmh) VALUES ('LaGuardia Airport Zone',    'HIGHWAY',  40.7769, -73.8740,  4.0, 80.0);
INSERT INTO zone_region (name, region_type, center_lat, center_lon, radius_km, speed_limit_kmh) VALUES ('Queens Suburban Belt',      'SUBURBAN', 40.7282, -73.7949,  4.0, 50.0);
INSERT INTO zone_region (name, region_type, center_lat, center_lon, radius_km, speed_limit_kmh) VALUES ('Bronx Urban Core',          'URBAN',    40.8448, -73.8648,  3.0, 40.0);
INSERT INTO zone_region (name, region_type, center_lat, center_lon, radius_km, speed_limit_kmh) VALUES ('Staten Island Suburban',    'SUBURBAN', 40.5795, -74.1502,  5.0, 55.0);
INSERT INTO zone_region (name, region_type, center_lat, center_lon, radius_km, speed_limit_kmh) VALUES ('Long Island City',          'URBAN',    40.7447, -73.9485,  2.0, 40.0);
INSERT INTO zone_region (name, region_type, center_lat, center_lon, radius_km, speed_limit_kmh) VALUES ('Flushing Queens',           'URBAN',    40.7675, -73.8330,  2.5, 40.0);
INSERT INTO zone_region (name, region_type, center_lat, center_lon, radius_km, speed_limit_kmh) VALUES ('Newark NJ Urban',           'URBAN',    40.7357, -74.1724,  3.0, 40.0);

-- ---- LOS ANGELES ------------------------------------------------------------
INSERT INTO zone_region (name, region_type, center_lat, center_lon, radius_km, speed_limit_kmh) VALUES ('Downtown Los Angeles',      'URBAN',    34.0522, -118.2437, 3.0, 40.0);
INSERT INTO zone_region (name, region_type, center_lat, center_lon, radius_km, speed_limit_kmh) VALUES ('Hollywood',                 'URBAN',    34.0928, -118.3287, 2.0, 40.0);
INSERT INTO zone_region (name, region_type, center_lat, center_lon, radius_km, speed_limit_kmh) VALUES ('LAX Corridor',              'HIGHWAY',  33.9425, -118.4081, 5.0, 90.0);
INSERT INTO zone_region (name, region_type, center_lat, center_lon, radius_km, speed_limit_kmh) VALUES ('Santa Monica',              'SUBURBAN', 34.0195, -118.4912, 3.0, 50.0);
INSERT INTO zone_region (name, region_type, center_lat, center_lon, radius_km, speed_limit_kmh) VALUES ('Pasadena',                  'SUBURBAN', 34.1478, -118.1445, 3.5, 55.0);
INSERT INTO zone_region (name, region_type, center_lat, center_lon, radius_km, speed_limit_kmh) VALUES ('Beverly Hills',             'URBAN',    34.0736, -118.4004, 2.0, 40.0);
INSERT INTO zone_region (name, region_type, center_lat, center_lon, radius_km, speed_limit_kmh) VALUES ('Culver City',               'SUBURBAN', 34.0211, -118.3965, 2.5, 50.0);
INSERT INTO zone_region (name, region_type, center_lat, center_lon, radius_km, speed_limit_kmh) VALUES ('Long Beach',                'URBAN',    33.7701, -118.1937, 3.0, 40.0);
INSERT INTO zone_region (name, region_type, center_lat, center_lon, radius_km, speed_limit_kmh) VALUES ('Burbank',                   'SUBURBAN', 34.1808, -118.3090, 3.0, 55.0);
INSERT INTO zone_region (name, region_type, center_lat, center_lon, radius_km, speed_limit_kmh) VALUES ('Glendale',                  'SUBURBAN', 34.1425, -118.2551, 3.0, 50.0);
INSERT INTO zone_region (name, region_type, center_lat, center_lon, radius_km, speed_limit_kmh) VALUES ('Compton',                   'URBAN',    33.8958, -118.2201, 2.5, 40.0);
INSERT INTO zone_region (name, region_type, center_lat, center_lon, radius_km, speed_limit_kmh) VALUES ('Torrance',                  'SUBURBAN', 33.8358, -118.3406, 3.5, 55.0);
INSERT INTO zone_region (name, region_type, center_lat, center_lon, radius_km, speed_limit_kmh) VALUES ('I-405 Freeway Corridor',    'HIGHWAY',  33.9600, -118.4100, 8.0, 100.0);

-- ---- CHICAGO ----------------------------------------------------------------
INSERT INTO zone_region (name, region_type, center_lat, center_lon, radius_km, speed_limit_kmh) VALUES ('Downtown Chicago Loop',     'URBAN',    41.8781, -87.6298,  2.0, 40.0);
INSERT INTO zone_region (name, region_type, center_lat, center_lon, radius_km, speed_limit_kmh) VALUES ('Lincoln Park',              'URBAN',    41.9214, -87.6513,  1.5, 40.0);
INSERT INTO zone_region (name, region_type, center_lat, center_lon, radius_km, speed_limit_kmh) VALUES ('O''Hare Access Road',        'HIGHWAY',  41.9742, -87.9073,  6.0, 80.0);
INSERT INTO zone_region (name, region_type, center_lat, center_lon, radius_km, speed_limit_kmh) VALUES ('Evanston',                  'SUBURBAN', 42.0451, -87.6877,  3.0, 50.0);
INSERT INTO zone_region (name, region_type, center_lat, center_lon, radius_km, speed_limit_kmh) VALUES ('Chicago Southside',         'URBAN',    41.7943, -87.5907,  3.0, 40.0);
INSERT INTO zone_region (name, region_type, center_lat, center_lon, radius_km, speed_limit_kmh) VALUES ('Wicker Park',               'URBAN',    41.9087, -87.6776,  1.5, 40.0);
INSERT INTO zone_region (name, region_type, center_lat, center_lon, radius_km, speed_limit_kmh) VALUES ('Hyde Park',                 'URBAN',    41.7943, -87.5907,  2.0, 40.0);
INSERT INTO zone_region (name, region_type, center_lat, center_lon, radius_km, speed_limit_kmh) VALUES ('Midway Airport Zone',       'HIGHWAY',  41.7868, -87.7522,  4.0, 80.0);
INSERT INTO zone_region (name, region_type, center_lat, center_lon, radius_km, speed_limit_kmh) VALUES ('Naperville Suburban',       'SUBURBAN', 41.7508, -88.1535,  5.0, 60.0);
INSERT INTO zone_region (name, region_type, center_lat, center_lon, radius_km, speed_limit_kmh) VALUES ('Aurora Suburban IL',        'SUBURBAN', 41.7606, -88.3201,  4.5, 55.0);

-- ---- HOUSTON ----------------------------------------------------------------
INSERT INTO zone_region (name, region_type, center_lat, center_lon, radius_km, speed_limit_kmh) VALUES ('Downtown Houston',          'URBAN',    29.7604, -95.3698,  2.5, 40.0);
INSERT INTO zone_region (name, region_type, center_lat, center_lon, radius_km, speed_limit_kmh) VALUES ('Houston Medical Center',    'URBAN',    29.7100, -95.3986,  2.0, 40.0);
INSERT INTO zone_region (name, region_type, center_lat, center_lon, radius_km, speed_limit_kmh) VALUES ('IAH Airport Zone',          'HIGHWAY',  29.9902, -95.3368,  6.0, 90.0);
INSERT INTO zone_region (name, region_type, center_lat, center_lon, radius_km, speed_limit_kmh) VALUES ('Sugar Land Suburban',       'SUBURBAN', 29.6196, -95.6349,  4.0, 55.0);
INSERT INTO zone_region (name, region_type, center_lat, center_lon, radius_km, speed_limit_kmh) VALUES ('Woodlands Suburban',        'SUBURBAN', 30.1658, -95.4613,  5.0, 60.0);
INSERT INTO zone_region (name, region_type, center_lat, center_lon, radius_km, speed_limit_kmh) VALUES ('Katy Suburban',             'SUBURBAN', 29.7858, -95.8245,  5.0, 60.0);
INSERT INTO zone_region (name, region_type, center_lat, center_lon, radius_km, speed_limit_kmh) VALUES ('Pearland Suburban',         'SUBURBAN', 29.5635, -95.2860,  4.0, 55.0);
INSERT INTO zone_region (name, region_type, center_lat, center_lon, radius_km, speed_limit_kmh) VALUES ('Galleria District',         'URBAN',    29.7370, -95.4613,  2.0, 40.0);

-- ---- PHOENIX ----------------------------------------------------------------
INSERT INTO zone_region (name, region_type, center_lat, center_lon, radius_km, speed_limit_kmh) VALUES ('Downtown Phoenix',          'URBAN',    33.4484, -112.0740, 2.5, 40.0);
INSERT INTO zone_region (name, region_type, center_lat, center_lon, radius_km, speed_limit_kmh) VALUES ('Scottsdale',                'SUBURBAN', 33.4942, -111.9261, 4.0, 55.0);
INSERT INTO zone_region (name, region_type, center_lat, center_lon, radius_km, speed_limit_kmh) VALUES ('Tempe',                     'SUBURBAN', 33.4255, -111.9400, 3.0, 50.0);
INSERT INTO zone_region (name, region_type, center_lat, center_lon, radius_km, speed_limit_kmh) VALUES ('PHX Sky Harbor Zone',       'HIGHWAY',  33.4373, -112.0078, 4.0, 80.0);
INSERT INTO zone_region (name, region_type, center_lat, center_lon, radius_km, speed_limit_kmh) VALUES ('Mesa',                      'SUBURBAN', 33.4152, -111.8315, 5.0, 55.0);
INSERT INTO zone_region (name, region_type, center_lat, center_lon, radius_km, speed_limit_kmh) VALUES ('Gilbert',                   'SUBURBAN', 33.3528, -111.7890, 4.5, 55.0);
INSERT INTO zone_region (name, region_type, center_lat, center_lon, radius_km, speed_limit_kmh) VALUES ('Chandler',                  'SUBURBAN', 33.3062, -111.8413, 4.0, 55.0);
INSERT INTO zone_region (name, region_type, center_lat, center_lon, radius_km, speed_limit_kmh) VALUES ('Glendale AZ',               'SUBURBAN', 33.5387, -112.1860, 4.5, 55.0);

-- ---- SAN FRANCISCO ----------------------------------------------------------
INSERT INTO zone_region (name, region_type, center_lat, center_lon, radius_km, speed_limit_kmh) VALUES ('Downtown San Francisco',    'URBAN',    37.7749, -122.4194, 2.0, 30.0);
INSERT INTO zone_region (name, region_type, center_lat, center_lon, radius_km, speed_limit_kmh) VALUES ('SFO Airport Corridor',      'HIGHWAY',  37.6213, -122.3790, 5.0, 90.0);
INSERT INTO zone_region (name, region_type, center_lat, center_lon, radius_km, speed_limit_kmh) VALUES ('Oakland',                   'URBAN',    37.8044, -122.2712, 3.0, 40.0);
INSERT INTO zone_region (name, region_type, center_lat, center_lon, radius_km, speed_limit_kmh) VALUES ('Palo Alto',                 'SUBURBAN', 37.4419, -122.1430, 3.5, 50.0);
INSERT INTO zone_region (name, region_type, center_lat, center_lon, radius_km, speed_limit_kmh) VALUES ('San Jose Downtown',         'URBAN',    37.3382, -121.8863, 3.0, 40.0);
INSERT INTO zone_region (name, region_type, center_lat, center_lon, radius_km, speed_limit_kmh) VALUES ('Fremont',                   'SUBURBAN', 37.5485, -121.9886, 4.0, 55.0);
INSERT INTO zone_region (name, region_type, center_lat, center_lon, radius_km, speed_limit_kmh) VALUES ('Berkeley',                  'URBAN',    37.8716, -122.2727, 2.5, 40.0);
INSERT INTO zone_region (name, region_type, center_lat, center_lon, radius_km, speed_limit_kmh) VALUES ('Sunnyvale',                 'SUBURBAN', 37.3688, -122.0363, 3.5, 50.0);
INSERT INTO zone_region (name, region_type, center_lat, center_lon, radius_km, speed_limit_kmh) VALUES ('Santa Clara',               'SUBURBAN', 37.3541, -121.9552, 3.5, 50.0);
INSERT INTO zone_region (name, region_type, center_lat, center_lon, radius_km, speed_limit_kmh) VALUES ('Hayward',                   'SUBURBAN', 37.6688, -122.0808, 4.0, 55.0);

-- ---- SEATTLE ----------------------------------------------------------------
INSERT INTO zone_region (name, region_type, center_lat, center_lon, radius_km, speed_limit_kmh) VALUES ('Downtown Seattle',          'URBAN',    47.6062, -122.3321, 2.0, 30.0);
INSERT INTO zone_region (name, region_type, center_lat, center_lon, radius_km, speed_limit_kmh) VALUES ('Bellevue',                  'SUBURBAN', 47.6101, -122.2015, 3.5, 55.0);
INSERT INTO zone_region (name, region_type, center_lat, center_lon, radius_km, speed_limit_kmh) VALUES ('SEA-TAC Airport Zone',      'HIGHWAY',  47.4502, -122.3088, 5.0, 80.0);
INSERT INTO zone_region (name, region_type, center_lat, center_lon, radius_km, speed_limit_kmh) VALUES ('Tacoma',                    'URBAN',    47.2529, -122.4443, 3.0, 40.0);
INSERT INTO zone_region (name, region_type, center_lat, center_lon, radius_km, speed_limit_kmh) VALUES ('Redmond',                   'SUBURBAN', 47.6740, -122.1215, 3.5, 55.0);
INSERT INTO zone_region (name, region_type, center_lat, center_lon, radius_km, speed_limit_kmh) VALUES ('Kirkland',                  'SUBURBAN', 47.6815, -122.2087, 3.0, 50.0);
INSERT INTO zone_region (name, region_type, center_lat, center_lon, radius_km, speed_limit_kmh) VALUES ('Renton',                    'SUBURBAN', 47.4829, -122.2171, 3.0, 50.0);
INSERT INTO zone_region (name, region_type, center_lat, center_lon, radius_km, speed_limit_kmh) VALUES ('Everett',                   'SUBURBAN', 47.9790, -122.2021, 4.0, 55.0);

-- ---- MIAMI ------------------------------------------------------------------
INSERT INTO zone_region (name, region_type, center_lat, center_lon, radius_km, speed_limit_kmh) VALUES ('Downtown Miami',            'URBAN',    25.7617, -80.1918,  2.0, 40.0);
INSERT INTO zone_region (name, region_type, center_lat, center_lon, radius_km, speed_limit_kmh) VALUES ('Miami Beach',               'URBAN',    25.7907, -80.1300,  2.5, 40.0);
INSERT INTO zone_region (name, region_type, center_lat, center_lon, radius_km, speed_limit_kmh) VALUES ('MIA Airport Corridor',      'HIGHWAY',  25.7959, -80.2870,  5.0, 80.0);
INSERT INTO zone_region (name, region_type, center_lat, center_lon, radius_km, speed_limit_kmh) VALUES ('Coral Gables',              'SUBURBAN', 25.7215, -80.2684,  3.0, 50.0);
INSERT INTO zone_region (name, region_type, center_lat, center_lon, radius_km, speed_limit_kmh) VALUES ('Brickell',                  'URBAN',    25.7489, -80.1963,  1.5, 40.0);
INSERT INTO zone_region (name, region_type, center_lat, center_lon, radius_km, speed_limit_kmh) VALUES ('Hialeah',                   'URBAN',    25.8576, -80.2781,  3.0, 40.0);
INSERT INTO zone_region (name, region_type, center_lat, center_lon, radius_km, speed_limit_kmh) VALUES ('Fort Lauderdale',           'URBAN',    26.1224, -80.1373,  3.0, 40.0);
INSERT INTO zone_region (name, region_type, center_lat, center_lon, radius_km, speed_limit_kmh) VALUES ('Doral',                     'SUBURBAN', 25.8196, -80.3558,  3.5, 55.0);

-- ---- DENVER -----------------------------------------------------------------
INSERT INTO zone_region (name, region_type, center_lat, center_lon, radius_km, speed_limit_kmh) VALUES ('Downtown Denver',           'URBAN',    39.7392, -104.9903, 2.0, 40.0);
INSERT INTO zone_region (name, region_type, center_lat, center_lon, radius_km, speed_limit_kmh) VALUES ('Aurora Suburban CO',        'SUBURBAN', 39.7294, -104.8319, 4.0, 55.0);
INSERT INTO zone_region (name, region_type, center_lat, center_lon, radius_km, speed_limit_kmh) VALUES ('DEN Airport Highway',       'HIGHWAY',  39.8561, -104.6737, 6.0, 90.0);
INSERT INTO zone_region (name, region_type, center_lat, center_lon, radius_km, speed_limit_kmh) VALUES ('Boulder',                   'URBAN',    40.0150, -105.2705, 3.0, 40.0);
INSERT INTO zone_region (name, region_type, center_lat, center_lon, radius_km, speed_limit_kmh) VALUES ('Lakewood',                  'SUBURBAN', 39.7047, -105.0814, 3.5, 55.0);
INSERT INTO zone_region (name, region_type, center_lat, center_lon, radius_km, speed_limit_kmh) VALUES ('Arvada',                    'SUBURBAN', 39.8028, -105.0875, 3.5, 55.0);
INSERT INTO zone_region (name, region_type, center_lat, center_lon, radius_km, speed_limit_kmh) VALUES ('Centennial',                'SUBURBAN', 39.5807, -104.8772, 4.0, 55.0);

-- ---- BOSTON -----------------------------------------------------------------
INSERT INTO zone_region (name, region_type, center_lat, center_lon, radius_km, speed_limit_kmh) VALUES ('Downtown Boston',           'URBAN',    42.3601, -71.0589,  2.0, 30.0);
INSERT INTO zone_region (name, region_type, center_lat, center_lon, radius_km, speed_limit_kmh) VALUES ('Cambridge',                 'URBAN',    42.3736, -71.1097,  2.5, 40.0);
INSERT INTO zone_region (name, region_type, center_lat, center_lon, radius_km, speed_limit_kmh) VALUES ('BOS Logan Airport Zone',    'HIGHWAY',  42.3656, -71.0096,  4.0, 80.0);
INSERT INTO zone_region (name, region_type, center_lat, center_lon, radius_km, speed_limit_kmh) VALUES ('Somerville',                'URBAN',    42.3876, -71.0995,  2.0, 40.0);
INSERT INTO zone_region (name, region_type, center_lat, center_lon, radius_km, speed_limit_kmh) VALUES ('Brookline',                 'SUBURBAN', 42.3317, -71.1211,  2.5, 50.0);
INSERT INTO zone_region (name, region_type, center_lat, center_lon, radius_km, speed_limit_kmh) VALUES ('Worcester',                 'URBAN',    42.2626, -71.8023,  3.0, 40.0);
INSERT INTO zone_region (name, region_type, center_lat, center_lon, radius_km, speed_limit_kmh) VALUES ('Providence RI',             'URBAN',    41.8240, -71.4128,  3.0, 40.0);

-- ---- ATLANTA ----------------------------------------------------------------
INSERT INTO zone_region (name, region_type, center_lat, center_lon, radius_km, speed_limit_kmh) VALUES ('Downtown Atlanta',          'URBAN',    33.7490, -84.3880,  2.5, 40.0);
INSERT INTO zone_region (name, region_type, center_lat, center_lon, radius_km, speed_limit_kmh) VALUES ('ATL Hartsfield Zone',       'HIGHWAY',  33.6407, -84.4277,  6.0, 90.0);
INSERT INTO zone_region (name, region_type, center_lat, center_lon, radius_km, speed_limit_kmh) VALUES ('Decatur',                   'SUBURBAN', 33.7748, -84.2963,  3.0, 50.0);
INSERT INTO zone_region (name, region_type, center_lat, center_lon, radius_km, speed_limit_kmh) VALUES ('Buckhead',                  'URBAN',    33.8484, -84.3788,  2.0, 40.0);
INSERT INTO zone_region (name, region_type, center_lat, center_lon, radius_km, speed_limit_kmh) VALUES ('Sandy Springs',             'SUBURBAN', 33.9304, -84.3733,  3.5, 55.0);
INSERT INTO zone_region (name, region_type, center_lat, center_lon, radius_km, speed_limit_kmh) VALUES ('Alpharetta',                'SUBURBAN', 34.0754, -84.2941,  4.0, 55.0);
INSERT INTO zone_region (name, region_type, center_lat, center_lon, radius_km, speed_limit_kmh) VALUES ('Marietta',                  'SUBURBAN', 33.9526, -84.5499,  3.5, 50.0);

-- ---- DALLAS -----------------------------------------------------------------
INSERT INTO zone_region (name, region_type, center_lat, center_lon, radius_km, speed_limit_kmh) VALUES ('Downtown Dallas',           'URBAN',    32.7767, -96.7970,  2.5, 40.0);
INSERT INTO zone_region (name, region_type, center_lat, center_lon, radius_km, speed_limit_kmh) VALUES ('DFW Airport Corridor',      'HIGHWAY',  32.8998, -97.0403,  8.0, 90.0);
INSERT INTO zone_region (name, region_type, center_lat, center_lon, radius_km, speed_limit_kmh) VALUES ('Plano',                     'SUBURBAN', 33.0198, -96.6989,  4.0, 55.0);
INSERT INTO zone_region (name, region_type, center_lat, center_lon, radius_km, speed_limit_kmh) VALUES ('Irving',                    'SUBURBAN', 32.8140, -96.9489,  3.5, 55.0);
INSERT INTO zone_region (name, region_type, center_lat, center_lon, radius_km, speed_limit_kmh) VALUES ('Frisco',                    'SUBURBAN', 33.1507, -96.8236,  4.5, 55.0);
INSERT INTO zone_region (name, region_type, center_lat, center_lon, radius_km, speed_limit_kmh) VALUES ('Arlington TX',              'SUBURBAN', 32.7357, -97.1081,  4.0, 55.0);
INSERT INTO zone_region (name, region_type, center_lat, center_lon, radius_km, speed_limit_kmh) VALUES ('Fort Worth Downtown',       'URBAN',    32.7555, -97.3308,  2.5, 40.0);
INSERT INTO zone_region (name, region_type, center_lat, center_lon, radius_km, speed_limit_kmh) VALUES ('McKinney',                  'SUBURBAN', 33.1972, -96.6397,  4.0, 55.0);
INSERT INTO zone_region (name, region_type, center_lat, center_lon, radius_km, speed_limit_kmh) VALUES ('Garland',                   'SUBURBAN', 32.9126, -96.6389,  3.5, 55.0);

-- ---- PORTLAND ---------------------------------------------------------------
INSERT INTO zone_region (name, region_type, center_lat, center_lon, radius_km, speed_limit_kmh) VALUES ('Downtown Portland',         'URBAN',    45.5051, -122.6750, 2.0, 30.0);
INSERT INTO zone_region (name, region_type, center_lat, center_lon, radius_km, speed_limit_kmh) VALUES ('Beaverton',                 'SUBURBAN', 45.4871, -122.8037, 4.0, 55.0);
INSERT INTO zone_region (name, region_type, center_lat, center_lon, radius_km, speed_limit_kmh) VALUES ('PDX Airport Zone',          'HIGHWAY',  45.5898, -122.5951, 5.0, 80.0);
INSERT INTO zone_region (name, region_type, center_lat, center_lon, radius_km, speed_limit_kmh) VALUES ('Hillsboro',                 'SUBURBAN', 45.5229, -122.9898, 4.0, 55.0);
INSERT INTO zone_region (name, region_type, center_lat, center_lon, radius_km, speed_limit_kmh) VALUES ('Lake Oswego',               'SUBURBAN', 45.4207, -122.7007, 3.0, 50.0);

-- ---- SAN ANTONIO ------------------------------------------------------------
INSERT INTO zone_region (name, region_type, center_lat, center_lon, radius_km, speed_limit_kmh) VALUES ('Downtown San Antonio',      'URBAN',    29.4241, -98.4936,  2.5, 40.0);
INSERT INTO zone_region (name, region_type, center_lat, center_lon, radius_km, speed_limit_kmh) VALUES ('SAT Airport Zone',          'HIGHWAY',  29.5337, -98.4698,  5.0, 80.0);
INSERT INTO zone_region (name, region_type, center_lat, center_lon, radius_km, speed_limit_kmh) VALUES ('San Antonio North',         'SUBURBAN', 29.5858, -98.4936,  5.0, 60.0);
INSERT INTO zone_region (name, region_type, center_lat, center_lon, radius_km, speed_limit_kmh) VALUES ('Leon Valley',               'SUBURBAN', 29.4949, -98.6122,  3.5, 55.0);

-- ---- LAS VEGAS --------------------------------------------------------------
INSERT INTO zone_region (name, region_type, center_lat, center_lon, radius_km, speed_limit_kmh) VALUES ('Las Vegas Strip',           'URBAN',    36.1147, -115.1728, 2.0, 40.0);
INSERT INTO zone_region (name, region_type, center_lat, center_lon, radius_km, speed_limit_kmh) VALUES ('Downtown Las Vegas',        'URBAN',    36.1699, -115.1398, 2.5, 40.0);
INSERT INTO zone_region (name, region_type, center_lat, center_lon, radius_km, speed_limit_kmh) VALUES ('LAS Airport Zone',          'HIGHWAY',  36.0840, -115.1537, 4.0, 80.0);
INSERT INTO zone_region (name, region_type, center_lat, center_lon, radius_km, speed_limit_kmh) VALUES ('Henderson',                 'SUBURBAN', 36.0395, -114.9817, 4.0, 55.0);
INSERT INTO zone_region (name, region_type, center_lat, center_lon, radius_km, speed_limit_kmh) VALUES ('Summerlin',                 'SUBURBAN', 36.1466, -115.3245, 4.0, 55.0);
INSERT INTO zone_region (name, region_type, center_lat, center_lon, radius_km, speed_limit_kmh) VALUES ('North Las Vegas',           'URBAN',    36.1989, -115.1175, 3.0, 40.0);

-- ---- MINNEAPOLIS ------------------------------------------------------------
INSERT INTO zone_region (name, region_type, center_lat, center_lon, radius_km, speed_limit_kmh) VALUES ('Downtown Minneapolis',      'URBAN',    44.9778, -93.2650,  2.0, 40.0);
INSERT INTO zone_region (name, region_type, center_lat, center_lon, radius_km, speed_limit_kmh) VALUES ('Saint Paul',                'URBAN',    44.9537, -93.0900,  2.5, 40.0);
INSERT INTO zone_region (name, region_type, center_lat, center_lon, radius_km, speed_limit_kmh) VALUES ('MSP Airport Zone',          'HIGHWAY',  44.8848, -93.2223,  5.0, 80.0);
INSERT INTO zone_region (name, region_type, center_lat, center_lon, radius_km, speed_limit_kmh) VALUES ('Bloomington',               'SUBURBAN', 44.8408, -93.3477,  4.0, 55.0);
INSERT INTO zone_region (name, region_type, center_lat, center_lon, radius_km, speed_limit_kmh) VALUES ('Plymouth MN',               'SUBURBAN', 45.0103, -93.4555,  4.0, 55.0);

-- ---- DETROIT ----------------------------------------------------------------
INSERT INTO zone_region (name, region_type, center_lat, center_lon, radius_km, speed_limit_kmh) VALUES ('Downtown Detroit',          'URBAN',    42.3314, -83.0458,  2.5, 40.0);
INSERT INTO zone_region (name, region_type, center_lat, center_lon, radius_km, speed_limit_kmh) VALUES ('DTW Airport Zone',          'HIGHWAY',  42.2162, -83.3554,  6.0, 90.0);
INSERT INTO zone_region (name, region_type, center_lat, center_lon, radius_km, speed_limit_kmh) VALUES ('Ann Arbor',                 'URBAN',    42.2808, -83.7430,  3.0, 40.0);
INSERT INTO zone_region (name, region_type, center_lat, center_lon, radius_km, speed_limit_kmh) VALUES ('Troy MI',                   'SUBURBAN', 42.6064, -83.1498,  3.5, 55.0);
INSERT INTO zone_region (name, region_type, center_lat, center_lon, radius_km, speed_limit_kmh) VALUES ('Dearborn',                  'URBAN',    42.3223, -83.1763,  2.5, 40.0);

-- ---- WASHINGTON DC ----------------------------------------------------------
INSERT INTO zone_region (name, region_type, center_lat, center_lon, radius_km, speed_limit_kmh) VALUES ('Downtown DC',               'URBAN',    38.9072, -77.0369,  2.0, 30.0);
INSERT INTO zone_region (name, region_type, center_lat, center_lon, radius_km, speed_limit_kmh) VALUES ('Dulles Airport Zone',       'HIGHWAY',  38.9531, -77.4565,  6.0, 90.0);
INSERT INTO zone_region (name, region_type, center_lat, center_lon, radius_km, speed_limit_kmh) VALUES ('Reagan National Zone',      'HIGHWAY',  38.8512, -77.0402,  4.0, 80.0);
INSERT INTO zone_region (name, region_type, center_lat, center_lon, radius_km, speed_limit_kmh) VALUES ('Arlington VA',              'URBAN',    38.8799, -77.1067,  2.5, 40.0);
INSERT INTO zone_region (name, region_type, center_lat, center_lon, radius_km, speed_limit_kmh) VALUES ('Bethesda MD',               'SUBURBAN', 38.9807, -77.1003,  2.5, 50.0);
INSERT INTO zone_region (name, region_type, center_lat, center_lon, radius_km, speed_limit_kmh) VALUES ('Alexandria VA',             'URBAN',    38.8048, -77.0469,  2.5, 40.0);
INSERT INTO zone_region (name, region_type, center_lat, center_lon, radius_km, speed_limit_kmh) VALUES ('Silver Spring MD',          'SUBURBAN', 38.9912, -77.0261,  2.5, 50.0);
INSERT INTO zone_region (name, region_type, center_lat, center_lon, radius_km, speed_limit_kmh) VALUES ('Tysons Corner',             'URBAN',    38.9188, -77.2285,  2.0, 40.0);

-- ---- INTERNATIONAL: LONDON --------------------------------------------------
INSERT INTO zone_region (name, region_type, center_lat, center_lon, radius_km, speed_limit_kmh) VALUES ('Central London',            'URBAN',    51.5074, -0.1278,   3.0, 30.0);
INSERT INTO zone_region (name, region_type, center_lat, center_lon, radius_km, speed_limit_kmh) VALUES ('Heathrow Airport Zone',     'HIGHWAY',  51.4700, -0.4543,   6.0, 80.0);
INSERT INTO zone_region (name, region_type, center_lat, center_lon, radius_km, speed_limit_kmh) VALUES ('Canary Wharf',              'URBAN',    51.5054, -0.0235,   2.0, 30.0);
INSERT INTO zone_region (name, region_type, center_lat, center_lon, radius_km, speed_limit_kmh) VALUES ('Croydon',                   'SUBURBAN', 51.3762, -0.0982,   3.5, 50.0);
INSERT INTO zone_region (name, region_type, center_lat, center_lon, radius_km, speed_limit_kmh) VALUES ('Gatwick Airport Zone',      'HIGHWAY',  51.1537, -0.1821,   5.0, 80.0);
INSERT INTO zone_region (name, region_type, center_lat, center_lon, radius_km, speed_limit_kmh) VALUES ('Stratford London',          'URBAN',    51.5416, -0.0026,   2.0, 30.0);
INSERT INTO zone_region (name, region_type, center_lat, center_lon, radius_km, speed_limit_kmh) VALUES ('Wembley',                   'SUBURBAN', 51.5560, -0.2796,   2.5, 50.0);

-- ---- INTERNATIONAL: PARIS ---------------------------------------------------
INSERT INTO zone_region (name, region_type, center_lat, center_lon, radius_km, speed_limit_kmh) VALUES ('Central Paris',             'URBAN',    48.8566,  2.3522,   3.0, 30.0);
INSERT INTO zone_region (name, region_type, center_lat, center_lon, radius_km, speed_limit_kmh) VALUES ('CDG Airport Zone',          'HIGHWAY',  49.0097,  2.5479,   6.0, 80.0);
INSERT INTO zone_region (name, region_type, center_lat, center_lon, radius_km, speed_limit_kmh) VALUES ('La Defense',                'URBAN',    48.8923,  2.2377,   2.0, 40.0);
INSERT INTO zone_region (name, region_type, center_lat, center_lon, radius_km, speed_limit_kmh) VALUES ('Versailles',                'SUBURBAN', 48.8014,  2.1301,   3.0, 50.0);
INSERT INTO zone_region (name, region_type, center_lat, center_lon, radius_km, speed_limit_kmh) VALUES ('Orly Airport Zone',         'HIGHWAY',  48.7262,  2.3652,   5.0, 80.0);

-- ---- INTERNATIONAL: TOKYO ---------------------------------------------------
INSERT INTO zone_region (name, region_type, center_lat, center_lon, radius_km, speed_limit_kmh) VALUES ('Shinjuku',                  'URBAN',    35.6938, 139.7034,  2.0, 30.0);
INSERT INTO zone_region (name, region_type, center_lat, center_lon, radius_km, speed_limit_kmh) VALUES ('Shibuya',                   'URBAN',    35.6580, 139.7016,  2.0, 30.0);
INSERT INTO zone_region (name, region_type, center_lat, center_lon, radius_km, speed_limit_kmh) VALUES ('Narita Airport Zone',       'HIGHWAY',  35.7720, 140.3929,  6.0, 80.0);
INSERT INTO zone_region (name, region_type, center_lat, center_lon, radius_km, speed_limit_kmh) VALUES ('Haneda Airport Zone',       'HIGHWAY',  35.5494, 139.7798,  5.0, 80.0);
INSERT INTO zone_region (name, region_type, center_lat, center_lon, radius_km, speed_limit_kmh) VALUES ('Akihabara',                 'URBAN',    35.7022, 139.7741,  1.5, 30.0);
INSERT INTO zone_region (name, region_type, center_lat, center_lon, radius_km, speed_limit_kmh) VALUES ('Yokohama',                  'URBAN',    35.4437, 139.6380,  3.0, 40.0);

-- ---- INTERNATIONAL: SINGAPORE -----------------------------------------------
INSERT INTO zone_region (name, region_type, center_lat, center_lon, radius_km, speed_limit_kmh) VALUES ('Orchard Road',              'URBAN',     1.3048, 103.8318,  2.0, 40.0);
INSERT INTO zone_region (name, region_type, center_lat, center_lon, radius_km, speed_limit_kmh) VALUES ('Marina Bay',                'URBAN',     1.2789, 103.8536,  2.0, 40.0);
INSERT INTO zone_region (name, region_type, center_lat, center_lon, radius_km, speed_limit_kmh) VALUES ('Changi Airport Zone',       'HIGHWAY',   1.3644, 103.9915,  5.0, 90.0);
INSERT INTO zone_region (name, region_type, center_lat, center_lon, radius_km, speed_limit_kmh) VALUES ('Jurong West',               'SUBURBAN',  1.3404, 103.7090,  4.0, 60.0);
INSERT INTO zone_region (name, region_type, center_lat, center_lon, radius_km, speed_limit_kmh) VALUES ('Tampines',                  'SUBURBAN',  1.3496, 103.9568,  3.5, 60.0);

-- ---- INTERNATIONAL: SYDNEY --------------------------------------------------
INSERT INTO zone_region (name, region_type, center_lat, center_lon, radius_km, speed_limit_kmh) VALUES ('Sydney CBD',                'URBAN',   -33.8688, 151.2093,  2.0, 40.0);
INSERT INTO zone_region (name, region_type, center_lat, center_lon, radius_km, speed_limit_kmh) VALUES ('Sydney Airport Zone',       'HIGHWAY', -33.9399, 151.1753,  5.0, 80.0);
INSERT INTO zone_region (name, region_type, center_lat, center_lon, radius_km, speed_limit_kmh) VALUES ('Parramatta',                'SUBURBAN',-33.8148, 151.0017,  3.5, 50.0);
INSERT INTO zone_region (name, region_type, center_lat, center_lon, radius_km, speed_limit_kmh) VALUES ('Bondi Beach',               'SUBURBAN',-33.8915, 151.2767,  2.0, 50.0);
INSERT INTO zone_region (name, region_type, center_lat, center_lon, radius_km, speed_limit_kmh) VALUES ('Chatswood',                 'SUBURBAN',-33.7969, 151.1821,  2.5, 50.0);

-- ---- INTERNATIONAL: DUBAI ---------------------------------------------------
INSERT INTO zone_region (name, region_type, center_lat, center_lon, radius_km, speed_limit_kmh) VALUES ('Downtown Dubai',            'URBAN',    25.1972,  55.2744,  2.0, 60.0);
INSERT INTO zone_region (name, region_type, center_lat, center_lon, radius_km, speed_limit_kmh) VALUES ('Dubai Airport Zone',        'HIGHWAY',  25.2532,  55.3657,  5.0, 100.0);
INSERT INTO zone_region (name, region_type, center_lat, center_lon, radius_km, speed_limit_kmh) VALUES ('Dubai Marina',              'URBAN',    25.0800,  55.1400,  2.0, 60.0);
INSERT INTO zone_region (name, region_type, center_lat, center_lon, radius_km, speed_limit_kmh) VALUES ('Deira',                     'URBAN',    25.2697,  55.3095,  2.5, 60.0);
INSERT INTO zone_region (name, region_type, center_lat, center_lon, radius_km, speed_limit_kmh) VALUES ('Sheikh Zayed Road',         'HIGHWAY',  25.1500,  55.2200,  8.0, 120.0);
INSERT INTO zone_region (name, region_type, center_lat, center_lon, radius_km, speed_limit_kmh) VALUES ('Business Bay',              'URBAN',    25.1864,  55.2545,  2.0, 60.0);

-- ---- INTERNATIONAL: SAO PAULO -----------------------------------------------
INSERT INTO zone_region (name, region_type, center_lat, center_lon, radius_km, speed_limit_kmh) VALUES ('Centro Sao Paulo',          'URBAN',   -23.5505, -46.6333,  3.0, 40.0);
INSERT INTO zone_region (name, region_type, center_lat, center_lon, radius_km, speed_limit_kmh) VALUES ('Guarulhos Airport Zone',    'HIGHWAY', -23.4356, -46.4731,  6.0, 80.0);
INSERT INTO zone_region (name, region_type, center_lat, center_lon, radius_km, speed_limit_kmh) VALUES ('Paulista Avenue',           'URBAN',   -23.5611, -46.6560,  2.0, 40.0);
INSERT INTO zone_region (name, region_type, center_lat, center_lon, radius_km, speed_limit_kmh) VALUES ('Campinas',                  'URBAN',   -22.9099, -47.0626,  3.5, 50.0);
INSERT INTO zone_region (name, region_type, center_lat, center_lon, radius_km, speed_limit_kmh) VALUES ('Santo Andre',               'SUBURBAN',-23.6639, -46.5383,  3.5, 55.0);

-- ---- INTERNATIONAL: JAKARTA -------------------------------------------------
INSERT INTO zone_region (name, region_type, center_lat, center_lon, radius_km, speed_limit_kmh) VALUES ('Central Jakarta',           'URBAN',    -6.2088, 106.8456,  3.0, 40.0);
INSERT INTO zone_region (name, region_type, center_lat, center_lon, radius_km, speed_limit_kmh) VALUES ('Soekarno-Hatta Zone',       'HIGHWAY',  -6.1256, 106.6558,  6.0, 80.0);
INSERT INTO zone_region (name, region_type, center_lat, center_lon, radius_km, speed_limit_kmh) VALUES ('South Jakarta',             'URBAN',    -6.2615, 106.8106,  3.0, 40.0);
INSERT INTO zone_region (name, region_type, center_lat, center_lon, radius_km, speed_limit_kmh) VALUES ('Tangerang',                 'SUBURBAN', -6.1781, 106.6300,  4.0, 60.0);
INSERT INTO zone_region (name, region_type, center_lat, center_lon, radius_km, speed_limit_kmh) VALUES ('Bekasi',                    'SUBURBAN', -6.2349, 106.9896,  4.0, 60.0);
INSERT INTO zone_region (name, region_type, center_lat, center_lon, radius_km, speed_limit_kmh) VALUES ('Depok',                     'SUBURBAN', -6.4025, 106.7942,  3.5, 55.0);

-- ---- RURAL/HIGHWAY FILLERS --------------------------------------------------
INSERT INTO zone_region (name, region_type, center_lat, center_lon, radius_km, speed_limit_kmh) VALUES ('Interstate Rural Midwest',  'RURAL',    41.2524,  -95.9980, 50.0, 110.0);
INSERT INTO zone_region (name, region_type, center_lat, center_lon, radius_km, speed_limit_kmh) VALUES ('Interstate Rural South',    'RURAL',    32.3668,  -86.3000, 50.0, 110.0);
INSERT INTO zone_region (name, region_type, center_lat, center_lon, radius_km, speed_limit_kmh) VALUES ('Interstate Rural West',     'RURAL',    36.1699, -115.1398, 50.0, 110.0);
INSERT INTO zone_region (name, region_type, center_lat, center_lon, radius_km, speed_limit_kmh) VALUES ('Interstate Rural Northeast','RURAL',    42.8000,  -73.5000, 50.0, 100.0);
INSERT INTO zone_region (name, region_type, center_lat, center_lon, radius_km, speed_limit_kmh) VALUES ('Rural Australia Outback',   'RURAL',   -25.2744,  133.7751,150.0, 130.0);
INSERT INTO zone_region (name, region_type, center_lat, center_lon, radius_km, speed_limit_kmh) VALUES ('European Autobahn Stretch', 'HIGHWAY',  51.1657,   10.4515, 80.0, 130.0);
INSERT INTO zone_region (name, region_type, center_lat, center_lon, radius_km, speed_limit_kmh) VALUES ('Trans-Siberian Corridor',   'RURAL',    57.1530,   65.5343,150.0, 110.0);

-- =============================================================================
-- Speed profile seed — 4 representative zones x 3 vehicle types x 4 hour buckets
-- =============================================================================
INSERT INTO speed_profile (zone_id, hour_bucket, vehicle_type, avg_speed_kmh, p85_speed_kmh, p15_speed_kmh, sample_count)
  SELECT z.id, 8,  'CAR',   22.0, 28.0, 15.0, 3420 FROM zone_region z WHERE z.name = 'Downtown Manhattan';
INSERT INTO speed_profile (zone_id, hour_bucket, vehicle_type, avg_speed_kmh, p85_speed_kmh, p15_speed_kmh, sample_count)
  SELECT z.id, 17, 'CAR',   18.0, 24.0, 12.0, 4100 FROM zone_region z WHERE z.name = 'Downtown Manhattan';
INSERT INTO speed_profile (zone_id, hour_bucket, vehicle_type, avg_speed_kmh, p85_speed_kmh, p15_speed_kmh, sample_count)
  SELECT z.id, 12, 'CAR',   30.0, 36.0, 22.0, 2800 FROM zone_region z WHERE z.name = 'Downtown Manhattan';
INSERT INTO speed_profile (zone_id, hour_bucket, vehicle_type, avg_speed_kmh, p85_speed_kmh, p15_speed_kmh, sample_count)
  SELECT z.id, 2,  'CAR',   45.0, 50.0, 38.0, 980  FROM zone_region z WHERE z.name = 'Downtown Manhattan';
INSERT INTO speed_profile (zone_id, hour_bucket, vehicle_type, avg_speed_kmh, p85_speed_kmh, p15_speed_kmh, sample_count)
  SELECT z.id, 8,  'BIKE',  14.0, 18.0,  9.0, 1200 FROM zone_region z WHERE z.name = 'Downtown Manhattan';
INSERT INTO speed_profile (zone_id, hour_bucket, vehicle_type, avg_speed_kmh, p85_speed_kmh, p15_speed_kmh, sample_count)
  SELECT z.id, 17, 'BIKE',  11.0, 15.0,  7.0, 1450 FROM zone_region z WHERE z.name = 'Downtown Manhattan';
INSERT INTO speed_profile (zone_id, hour_bucket, vehicle_type, avg_speed_kmh, p85_speed_kmh, p15_speed_kmh, sample_count)
  SELECT z.id, 8,  'TRUCK', 16.0, 20.0, 10.0, 620  FROM zone_region z WHERE z.name = 'Downtown Manhattan';
INSERT INTO speed_profile (zone_id, hour_bucket, vehicle_type, avg_speed_kmh, p85_speed_kmh, p15_speed_kmh, sample_count)
  SELECT z.id, 8,  'CAR',   70.0, 85.0, 55.0, 5200 FROM zone_region z WHERE z.name = 'JFK Airport Corridor';
INSERT INTO speed_profile (zone_id, hour_bucket, vehicle_type, avg_speed_kmh, p85_speed_kmh, p15_speed_kmh, sample_count)
  SELECT z.id, 17, 'CAR',   55.0, 72.0, 38.0, 5800 FROM zone_region z WHERE z.name = 'JFK Airport Corridor';
INSERT INTO speed_profile (zone_id, hour_bucket, vehicle_type, avg_speed_kmh, p85_speed_kmh, p15_speed_kmh, sample_count)
  SELECT z.id, 2,  'CAR',   88.0, 95.0, 78.0, 1100 FROM zone_region z WHERE z.name = 'JFK Airport Corridor';
INSERT INTO speed_profile (zone_id, hour_bucket, vehicle_type, avg_speed_kmh, p85_speed_kmh, p15_speed_kmh, sample_count)
  SELECT z.id, 8,  'CAR',   28.0, 35.0, 20.0, 4300 FROM zone_region z WHERE z.name = 'Downtown Los Angeles';
INSERT INTO speed_profile (zone_id, hour_bucket, vehicle_type, avg_speed_kmh, p85_speed_kmh, p15_speed_kmh, sample_count)
  SELECT z.id, 17, 'CAR',   20.0, 28.0, 12.0, 5100 FROM zone_region z WHERE z.name = 'Downtown Los Angeles';
INSERT INTO speed_profile (zone_id, hour_bucket, vehicle_type, avg_speed_kmh, p85_speed_kmh, p15_speed_kmh, sample_count)
  SELECT z.id, 8,  'CAR',   75.0, 90.0, 60.0, 6200 FROM zone_region z WHERE z.name = 'LAX Corridor';
INSERT INTO speed_profile (zone_id, hour_bucket, vehicle_type, avg_speed_kmh, p85_speed_kmh, p15_speed_kmh, sample_count)
  SELECT z.id, 17, 'CAR',   52.0, 70.0, 35.0, 7400 FROM zone_region z WHERE z.name = 'LAX Corridor';

-- =============================================================================
-- Zone alert seed — sample active alerts on high-traffic zones
-- =============================================================================
INSERT INTO zone_alert (zone_id, description, severity, active, penalty_minutes, raised_at, expires_at)
  SELECT z.id, 'Road closure - water main repair on 5th Ave', 'HIGH', TRUE, 8.0,
         PARSEDATETIME('2026-06-20 06:00:00', 'yyyy-MM-dd HH:mm:ss'),
         PARSEDATETIME('2026-06-22 18:00:00', 'yyyy-MM-dd HH:mm:ss')
  FROM zone_region z WHERE z.name = 'Midtown Manhattan';

INSERT INTO zone_alert (zone_id, description, severity, active, penalty_minutes, raised_at, expires_at)
  SELECT z.id, 'Concert event - heavy pedestrian spillover', 'MEDIUM', TRUE, 5.0,
         PARSEDATETIME('2026-06-21 16:00:00', 'yyyy-MM-dd HH:mm:ss'),
         PARSEDATETIME('2026-06-21 23:00:00', 'yyyy-MM-dd HH:mm:ss')
  FROM zone_region z WHERE z.name = 'Downtown Los Angeles';

INSERT INTO zone_alert (zone_id, description, severity, active, penalty_minutes, raised_at, expires_at)
  SELECT z.id, 'Flooding on I-405 southbound shoulder', 'CRITICAL', TRUE, 15.0,
         PARSEDATETIME('2026-06-21 08:30:00', 'yyyy-MM-dd HH:mm:ss'),
         NULL
  FROM zone_region z WHERE z.name = 'I-405 Freeway Corridor';

INSERT INTO zone_alert (zone_id, description, severity, active, penalty_minutes, raised_at, expires_at)
  SELECT z.id, 'Terminal construction - reduced lanes', 'LOW', TRUE, 3.0,
         PARSEDATETIME('2026-05-01 00:00:00', 'yyyy-MM-dd HH:mm:ss'),
         PARSEDATETIME('2026-08-31 23:59:59', 'yyyy-MM-dd HH:mm:ss')
  FROM zone_region z WHERE z.name = 'JFK Airport Corridor';

INSERT INTO zone_alert (zone_id, description, severity, active, penalty_minutes, raised_at, expires_at)
  SELECT z.id, 'Marathon route - full closure on Lake Shore Dr', 'HIGH', TRUE, 12.0,
         PARSEDATETIME('2026-06-21 07:00:00', 'yyyy-MM-dd HH:mm:ss'),
         PARSEDATETIME('2026-06-21 14:00:00', 'yyyy-MM-dd HH:mm:ss')
  FROM zone_region z WHERE z.name = 'Downtown Chicago Loop';

INSERT INTO zone_alert (zone_id, description, severity, active, penalty_minutes, raised_at, expires_at)
  SELECT z.id, 'Minor pothole repairs - single lane closed', 'LOW', FALSE, 2.0,
         PARSEDATETIME('2026-06-18 09:00:00', 'yyyy-MM-dd HH:mm:ss'),
         PARSEDATETIME('2026-06-19 17:00:00', 'yyyy-MM-dd HH:mm:ss')
  FROM zone_region z WHERE z.name = 'Downtown Seattle';
