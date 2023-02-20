At MyApp:
//userInfoAuthProvider checks:
//if user has logged in, remove splash screen and go to welcome page.
//if user hasn't, remove splash screen and go to home page.
//if error, show error page.

-> Welcome page




///Use a class for showing only chat card info.
Call it LastMessage
final String username;
final String profileImageUrl;
final String contactId;
final DateTime timeSent;
final String lastMessage;
});

upon clicking, go to Chat page with username, profileimageurl and contactid passed to User

On chat screen, load all LastMessage classes with sentTo that matches User's id.
LastMessage(
Id senderId;
String senderName;
String senderImageUrl;
String lastMessageSnippet;
DateTime timeSent;
);

Upon clicking a chat card:
if it leads to a group chat, pass Room(Group, {Ali, Baba, Cici}, 'Fun Room')
if it's PM, pass Room(PM, {Ali, Cici})
inside that new room, load all Message classes with a common room.  
Use Stream and Streambuilder to load all Message classes with same room.
Inside ListView, add a logic that changes alignment left and right and changes color depending on
if senderId matches User's Id.

I suppose it's best to have a class named Room
Room(
enum {PM, Group} type;
List<Id> members;
String roomName, default value '', only fill if type = Group.
);
why distinguish between the two?
because video and phone calls for group is different from PM
a group can only have two people, or even just one, but we need to distinguish it from PM nonetheless.

Okay we have a Message class that goes like this:
We will have two different rooms:
a PM room, and then a group room with <name>
Message(
String messageBody;
DateTime timeSent;
String room;
Id sender;
Id sentTo (might just be sent to room)
//file File;
);

Probably messageBody will not be a String, but some medium that displays emoji, text and objects at once. 

