Flutter Chatroom App Workflow:

User opens the Flutter chatroom app and is directed to the login page.
On LoginPage the user enters their login credentials and the app sends a request to the Supabase backend to authenticate the user.
If the user's credentials are valid, the backend returns an access token and the user is logged in.
The user can now see a list of available chatrooms and select one to join.
When the user enters a chatroom, the app sends a request to the backend to retrieve the chat messages for that room.
The backend responds with the chat messages, which are displayed in the app.
When the user sends a message in the chatroom, the app sends a request to the backend to add the message to the database.
Other users in the chatroom receive the message in real-time through the Supabase Realtime feature.
The chatroom screen is updated with the new message.

Friend Request:
A user can send a friend request (FR) to another.
An FR can be pending (default), accepted or rejected.

All pending FRs will be automatically deleted from Supabase's 'friend requests' table within 10 days.

If an FR is accepted, the request sender is added to receiver's friend's list.
If an FR is reject nothing happens.

All accepted and rejected FRs are immediately deleted from 'friend requests' table at the same time.

An FR cannot be made more than once while the previous one is still pending.

An SQL function running on a cron job will handle auto deletion of pending FRs.

Signals for deleting accepted and rejected FRs will come from Flutter app.
