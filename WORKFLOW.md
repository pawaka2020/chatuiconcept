TBF: To be filled later. Have its workflow defined later.
TODO: To be coded later.

FRONTEND:
0. main
0.1 Initialize Supabase connection with the correct URL and anonkey.
0.2 There are two pairs of URL and anonkey: one for self-host Supabase for release and
the other for cloud Supabase for early dev.
0.3 Once Supabase has been initialized, proceed with MyApp

1. MyApp.
1.1 Set the template for the light theme and dark theme of this app.
1.2 User is directed to WelcomeScreen from MyApp. 

2. WelcomeScreen
2.1 This is just a welcome page with some art, text and a 'skip' button that leads to SigningScreen.
2.2 (TODO) Supabase Auth allows already logged in users to skip this screen.

3. SigningScreen
3.1 Shows app logo art, 'Sign in' and 'Sign up' buttons.
3.2 (TODO) Supabase Auth again allows already logged in users to skip this screen.
3.3 'Sign up' leads to SignUpScreen.
3.4 'Sign in' leads to SignInScreen.
3.5 For now 'Sign in' leads to ChatScreen.

4. SignUpScreen (TODO)
4.1 Only username, email and password, but later can add field to upload avatar(WIP)
4.2 Leads to ChatScreen after successful signup, but stays in event of failure (ie failure of sending email verification)
4.3 On Cloud hosted Supabase I was able to disable email verification but not on self hosted.
4.4 After Supabath Auth adds user, a user is also simultaneously added in 'chat_users_auth'

6. SignInScreen
5.1 Signs in with already registered users. 

7. ChatScreen
6.1 Shows a main UI (ChatBody) of last messages sent to the user.
6.2 (TODO) Floating action button to enable user to initiate a new conversation.
6.3 (TODO) Phone icon to enable user to call friends. Only friends, not un-added contacts.
6.4 (TODO) profile icon to display profile for user on a drawer (name, photo, phone, settings ,etc).
6.5 ChatBody comprises of green top bar (topBody) and listview (bottomBody).
6.6 bottomBody loads 'Chat' object from 'chats' table to display data on listview.
6.7 (TODO) 'chat' table is independent and only for testing UI. 
I will create a true table derived from 'messages' to replace 'chat'
6.8 Use clicks any item on list of bottomBody to go to MessageScreen

8. MessageScreen
7.1 Contains green bar on top (messageAppBar) and conversation UI (messageBody) 
7.2 messageAppBar displays user image, name, time active, 
7.3 (TODO) logic for phone call button on messageAppBar
7.4 (TODO) logic for video call button on messageAppBar
7.5 messageBody contains conversation (chatLogs) loading 'Message' object from 'messages' table
7.6 messageBody also has text input field at bottom (chatInputField)
7.7 (TODO) enable adding to 'messages' table after tapping chatInputField

BACKEND:
1. Friend Request:
1.1 A user can send a friend request (FR) to another.
1.2 An FR can be pending (default), accepted or rejected.
1.3 All pending FRs will be automatically deleted from Supabase's 'friend requests' table within 10 days.
1.4 If an FR is accepted, the request sender is added to receiver's friend's list.
1.5 If an FR is reject nothing happens.
1.6 All accepted and rejected FRs are immediately deleted from 'friend requests' table at the same time.
1.7 An FR cannot be made more than once while the previous one is still pending.
1.8 An SQL function running on a cron job will handle auto deletion of pending FRs.
1.9 Signals for deleting accepted and rejected FRs will come from Flutter app.

2. (TBF) ChatUserAuth

3. (TBF) ChatMessageAuth

4. (TBF) CHAT

DATABASE:
1. Supabase:
1.1 https://supabase.com/
1.2 Provides almost the same functionality as Firebase, but also offers 100% free self-host option.
1.3 Cloud database is used first instead of self-host during development.
1.4 PostgreSQL-based with ability to also write SQL functions inside and execute cron jobs.
1.5 Either we use Supabase Storage to keep files, or we use XML
1.6 We may use other db types like MongoDB for release version.
1.7 Supabase self-host has problems with Supabase Auth registration and login.
1.8 It is recommended to use cloud host first for development then use another db for production release.

3. XML
2.1: Offline persistence.
2.2: Files from Supabase saved here as well.

REPOSITORY (TBF):

ETC:
1. DB Architecture:
1.1 for now singular but after launch move to master-slave.

2. App architecture(TBF):

3. (TODO) UI adjustment on web version
3.1 ui works on phones but needs adjusting to work on PC browsers.



---
change redirect url https://app.supabase.com/project/awvkifeyofjyyenvkruh/auth/url-configuration