
CREATE TABLE chat_users (
id SERIAL PRIMARY KEY,
name TEXT NOT NULL,
status TEXT DEFAULT 'offline' NOT NULL,
imageData BYTEA,
signature TEXT DEFAULT '' NOT NULL,
lastSeen TIMESTAMP DEFAULT now(),
passwordHash TEXT NOT NULL
);

CREATE TABLE chat_rooms (
id SERIAL PRIMARY KEY,
type TEXT NOT NULL,
name TEXT DEFAULT '',
imageData BYTEA DEFAULT NULL,
memberIds INTEGER[] NOT NULL,
ownerId INTEGER DEFAULT NULL REFERENCES chat_users(id),
lastMessageId INTEGER DEFAULT NULL,
lastActive TIMESTAMP DEFAULT now()
);

CREATE TABLE chat_messages (
id SERIAL PRIMARY KEY,
sender_id INTEGER REFERENCES chat_users(id),
room_id INTEGER REFERENCES chat_rooms(id),
message_text TEXT NOT NULL,
emoji_list TEXT[],
file_list TEXT[],
time_posted TIMESTAMP DEFAULT NOW(),
deleted BOOLEAN DEFAULT FALSE,
read BOOLEAN DEFAULT TRUE
);
ALTER TABLE chat_rooms ADD FOREIGN KEY (lastMessageId) REFERENCES chat_messages(id);


-- DO $$
-- DECLARE
--   EncryptionKey TEXT := 'Apple_Sauce';
-- BEGIN
-- SET TIME ZONE 'Asia/Singapore';
--   INSERT INTO chat_users (name, passwordHash)
--   VALUES ('Alpha', pgp_sym_encrypt('235235341', EncryptionKey));
--   INSERT INTO chat_users (name, passwordHash)
--   VALUES ('Beta', pgp_sym_encrypt('Beta123', EncryptionKey));
--   INSERT INTO chat_users (name, signature, passwordHash)
--   VALUES ('Gamma', 'I am Gamma', pgp_sym_encrypt('Alpha_password', EncryptionKey));
-- END $$;

-- CREATE TABLE chat_messages (
--   id SERIAL PRIMARY KEY,
--   senderId INTEGER NOT NULL REFERENCES chat_users(id),
--   messageText TEXT NOT NULL,
--   emojiList TEXT[],
--   fileList TEXT[],
--   timePosted TIMESTAMP DEFAULT now(),
--   deleted BOOLEAN DEFAULT FALSE NOT NULL,
--   read BOOLEAN DEFAULT TRUE NOT NULL
-- );
-- SET TIME ZONE 'Asia/Singapore';
-- INSERT into chat_messages(senderId, messageText)
-- VALUES('2','I am now in Kuala Lumpur');
-- INSERT into chat_messages(senderId, messageText)
-- VALUES('10','I am unknown user');


-- CREATE TABLE chat_rooms (
--   id SERIAL PRIMARY KEY,
--   type TEXT NOT NULL,
--   name TEXT DEFAULT '' NOT NULL,
--   imageData BYTEA,
--   memberIds INTEGER[] NOT NULL,
--   lastMessageId INTEGER NOT NULL,
--   dateCreated TIMESTAMP
-- );