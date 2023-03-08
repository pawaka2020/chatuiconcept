class ChatRoom{
//id of room, automatically generated by Supabase.
  final int? id;
//type of room, can be either 'pm' or 'group'
  final String type;
//name of room, default value '', only fill if type == 'group'
  final String name;
//data for room image, stored in Storage of Supabase, but I want it to be default null, only fill if type == 'group'
  final List<int>? imageData;
//list of all the id of Users in the room, references to id in User.
  final List<int> memberIds;
//id of owner, but left null, only filled if type == 'group'
  final int? ownerId;
//id of the last message, references to id in Message, but can be left null for new room
  final int? lastMessageId;
//time last active, automatically generatedby Supabase, entered when room newly created or when new message is posted.
  final DateTime? lastActive;
  ChatRoom({
    this.id,
    required this.type,
    this.name = '',
    this.imageData,
    required this.memberIds,
    this.ownerId,
    this.lastMessageId,
    this.lastActive
  });
}