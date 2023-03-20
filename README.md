Large scale table:

Improve read: 
Indexes for rows

Improve write:
Batched table insertions
Queued table insertions

Improve both:
Redis caching layer
partitioning data across multiple database servers

--

from https://dev.to/nsmet/chat-backend-with-supabase-socketio-55nn:

CREATE TABLE users (
id UUID PRIMARY KEY default uuid_generate_v4(),
username VARCHAR(255) NOT NULL,
created_at TIMESTAMP NOT NULL
);

CREATE TABLE conversations (
id UUID PRIMARY KEY default uuid_generate_v4(),
name VARCHAR(255) NOT NULL,
owner_user_id UUID REFERENCES users(id) NOT NULL,
created_at TIMESTAMP NOT NULL
);

CREATE TABLE user_conversation (
id UUID PRIMARY KEY default uuid_generate_v4(),
user_id UUID REFERENCES users(id),
conversation_id UUID REFERENCES conversations(id)
);

CREATE TABLE messages (
id UUID PRIMARY KEY default uuid_generate_v4(),
conversation_id UUID REFERENCES conversations(id),
user_id UUID REFERENCES users(id),
message TEXT NOT NULL,
created_at TIMESTAMP NOT NULL
);

export interface User {
id: string;
username: string;
created_at: string;
}

export interface Conversation {
id: string;
name: string;
user_owner_id: string;
created_at: string;
}
ex(<auto>, meeting, big boss, 2023)

export interface Message {
id: string;
user_id: string;
message: string;
created_at: string;
}

CREATE TABLE messages (
id UUID PRIMARY KEY default uuid_generate_v4(),
conversation_id UUID REFERENCES conversations(id),
user_id UUID REFERENCES users(id),
message TEXT NOT NULL,
created_at TIMESTAMP NOT NULL
);

//participants in a convo
export interface UserConversation {
user_id: string;
conversation_id: string;
}
ex: (ali, 'meeting), (baba, meeting), (cici, presentation)

createUser(username: string)
val searchUsers(user_id: string, q: string)

list<>getAllConvos(user_id: string)
{
await supabase
//reeturns all convverstion_idd tht matches user_idd.
//
thisconvoid = .from('user_conversation')
.select('conversation_id')
.eq('user_id', req.query.user_id)

.from('conversations')

//searh as owner of a cnversation
.select(user_owner == user_id)
OR
//search as participant of a convo
('id = thisconvoid')
}

createConversation
{
/// create 'conversation' object and upsert it

}

/// gets a message based on its convo id.
/// remember, convo means 'room'
getConversationMessage
{
    from ('message') select by 'conversation_id'
}

//
addMessageToConversation(conversation_id: string}, {user_id: string, message: string)

export const addMessageToConversation = async function (req: TypedRequestQueryWithBodyAndParams<{conversation_id: string}, {user_id: string, message: string}>, res: Response) {

