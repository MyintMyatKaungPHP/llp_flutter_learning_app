import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import '../model/chat.dart';
import 'package:http/http.dart' as http;

class APIService{
  final String dbUrl = "https://fir-test-5690d-default-rtdb.asia-southeast1.firebasedatabase.app";

  Stream<List<Chat>> fetchChats() async* {
    while (true) {
      try {
        final response = await http.get(Uri.parse('$dbUrl/chat.json'));
        if (response.statusCode == 200) {
          final jsonResponse = json.decode(response.body);
          List<Chat> chat_list = [];
          jsonResponse.forEach((key,json){
            chat_list.add(Chat.fromJson(key, json));
          });
          yield chat_list;
        } else {
          throw Exception('Failed to load chats');
        }
      } catch (e) {
        print(e);
        yield []; // Yield an empty list in case of error
      }
      await Future.delayed(Duration(seconds: 1)); // Poll every 5 seconds
    }
  }

// Create
  Future<void> addChat(Chat chat) async {
    final response = await http.post(Uri.parse('$dbUrl/chat.json'),
        body: jsonEncode(chat.toJson())
    );
    print(response.body);
  }

}

class StreamBuilderDemo extends StatefulWidget {
  const StreamBuilderDemo({super.key});

  @override
  State<StreamBuilderDemo> createState() => _StreamBuilderDemoState();
}

class _StreamBuilderDemoState extends State<StreamBuilderDemo> {

  final chatController = TextEditingController();

  APIService apiService = APIService();
  final myID = 'mmk@gmail.com';

  // List<Chat> chat_list = [
  //   Chat(id: '0', userId: '1111', message: 'Hello'),
  //   Chat(id: '1', userId: '2222', message: 'Hi'),
  //   Chat(id: '2', userId: '3333', message: 'Hey...'),
  // ];

  Color getRandomColor() {
    final Random random = Random();
    return Color.fromARGB(
      255, // Alpha channel (opacity) set to fully opaque
      random.nextInt(256), // Red component: 0 to 255
      random.nextInt(256), // Green component: 0 to 255
      random.nextInt(256), // Blue component: 0 to 255
    );
  }


  Widget buildChat(Chat chat) {
    bool isMe = chat.userId == myID;

    final List<Widget> chatRow = [
      Flexible(
        child: Text(
          chat.message,
          style: TextStyle(color: Colors.black),
          softWrap: true,
        ),
      ),
      const SizedBox(width: 10),
      CircleAvatar(
        backgroundColor: isMe ? Colors.green : Colors.purple,
        foregroundColor: Colors.white,
        child: Text(chat.userId.toUpperCase()[0]),
      ),
    ];

    return Align(
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Card(
        surfaceTintColor: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisSize: MainAxisSize.min, // Allows the row to shrink to its content
            children: isMe ? chatRow : chatRow.reversed.toList(),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(


      body: StreamBuilder(
        stream: apiService.fetchChats(),
        builder: (context, snapshot) {
          List<Chat> chat_list = snapshot.data?.reversed.toList() ?? [];
          return ListView.builder(
            reverse: true,
            itemCount: chat_list.length,
              itemBuilder: (context,index){
                return buildChat(chat_list[index]);
              }
          );
        }
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: TextFormField(
                  controller: chatController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.only(left: 15),
                    hintText: 'Type here....',
                    hintStyle: TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.normal
                    )
                  ),
                ),
              ),
              IconButton(
                  onPressed: (){
                    if(chatController.text.isNotEmpty){
                      apiService.addChat(
                        Chat(id: '1', userId: 'mmk@gmail.com', message: chatController.text.trim())
                      );
                      chatController.clear();
                    }
                  },
                  icon: Icon(Icons.send)
              )
            ],
          ),
          SizedBox(height: 30,)
        ],
      ),
    );
  }
}
