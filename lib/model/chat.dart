class Chat{
  String id;
  String userId;
  String message;

  Chat({required this.id, required this.userId, required this.message});

  factory Chat.fromJson(String id, Map<String,dynamic> json){
    return Chat(
        id: id,
        userId: json['userId'],
        message: json['message']
    );
  }

  Map<String,dynamic> toJson(){
    return{
      'userId' : userId,
      'message' : message
    };
  }

}