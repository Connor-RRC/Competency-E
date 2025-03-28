/*
Connor Brown
Student Number: 0403864
*/

-- Table creation:

DROP TABLE IF EXISTS players;
CREATE TABLE IF NOT EXISTS players (
    player_id SERIAL PRIMARY KEY,
    username VARCHAR(255) UNIQUE NOT NULL,
    player_level INT NOT NULL,
    date_created DATE
);

DROP TABLE IF EXISTS items;
CREATE TABLE IF NOT EXISTS items (
    item_id SERIAL PRIMARY KEY,
    item_name VARCHAR(255) NOT NULL,
    item_description TEXT,
    item_rarity VARCHAR(50)
);

DROP TABLE IF EXISTS inventory;
CREATE TABLE IF NOT EXISTS inventory (
    inventory_id SERIAL PRIMARY KEY,
    player_id INT REFERENCES players(player_id),
    item_id INT REFERENCES items(item_id),
    quantity INT DEFAULT 1
);

DROP TABLE IF EXISTS quests;
CREATE TABLE IF NOT EXISTS quests (
    quest_id SERIAL PRIMARY KEY,
    player_id INT REFERENCES players(player_id),
    quest_name VARCHAR(255) NOT NULL,
    quest_description TEXT,
    quest_type VARCHAR(50),
    reward VARCHAR(50),
    active BOOLEAN DEFAULT FALSE
);


-- Insert values into players table:

INSERT INTO players (username, player_level, date_created)
VALUES ('TheLegend27', 999, '1998-01-27'),
    ('LeeroyJenkins', 50, '2005-05-11'),
    ('xXyourmomXx', 1, '2021-01-01'),
    ('NoobSlayer9000', 99, '2001-08-02'),
    ('EpicGamer69', 69, '2010-04-20');

-- Insert values into items table:

INSERT INTO items (item_name, item_description, item_rarity)
VALUES ('Small health potion', 'Heals 25HP', 'Common'),
    ('Invisibility potion', 'Only works in the dark', 'Epic'),
    ('Meridias beacon', 'Another hand touches  the beacon', 'Rare'),
    ('Sunlight medallion', 'Jolly cooperation!', 'Legendary'),
    ('Rathalos plate', 'Plate from a Rathalos', 'Rare'),
    ('Golden Korok seed', 'Ya-ha-ha', 'Common'),
    ('Race piece', 'Resembles a king chess piece, represents Imanity', 'Legendary'),
    ('Dragon bones', 'Will absolutely make you overencumbered', 'Common'),
    ('Stimpack', 'Heals you somehow', 'Common'),
    ('L tetris peice', 'Take the L', 'Uncommon'),
    ('Wooden arrow', 'I used to be...', 'Common'),
    ('Suspicous looking eye', 'You feel an evil presence watching you...', 'Rare'),
    ('Leek', 'Im thinking OO-EE-OO', 'Legendary');

-- Insert values into inventory table:

INSERT INTO inventory (player_id, item_id, quantity)
VALUES (1, 4, 100),
    (1, 7, 1),
    (1, 3, 1),
    (2, 1, 10),
    (2, 5, 1),
    (2, 13, 1),
    (3, 2, 3),
    (3, 10, 1),
    (4, 8, 5),
    (4, 12, 2),
    (5, 4, 30),
    (5, 9, 50),
    (5, 11, 70);

-- Insert values into quests table:

INSERT INTO quests (player_id, quest_name, quest_description, quest_type, reward, active)
VALUES (1, 'Another hand...', 'Use Meridias beacon to cleanse her temple.', 'Optional', '100 EXP', TRUE),
    (2, 'The hunt begins', 'Hunt a Rathalos after selecting your weapon.', 'Main', '250 EXP', TRUE),
    (3, 'Must have been the wind', 'Using an invisibility potion, sneak into the Jarls longhouse.', 'Optional', '150 EXP', TRUE),
    (4, '', '', '', '', TRUE),
    (5, '', '', '', '', TRUE);

SELECT * FROM players;
SELECT * FROM items;
SELECT * FROM inventory;
SELECT * FROM quests;

