import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Chats extends StatefulWidget {
  const Chats({super.key});

  @override
  State<Chats> createState() => _ChatsState();
}

class _ChatsState extends State<Chats> {
  @override
  // List<Map<String, String>> chats = [
  //   {
  //     'username': 'John',
  //     'message': 'Hello there!',
  //     'time': '10:00 AM',
  //     'avatarUrl': 'https://example.com/avatar1.jpg',
  //   },
  //   // Add more chat data entries
  // ];

  late String username;
  late String imageUrl;
  late String time;
  late String text;

  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('chats').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.red,
            ),
          );
        }
        final messages = snapshot.data?.docs;
        List<Widget> chatWidgets = [];
        for (var message in messages!) {
          imageUrl = message['imageUrl'];
          username = message['username'];
          text = message['message'];
          time = message['time'];

          final chatWidget = ChatListItem(
            avatarUrl: imageUrl,
            username: username,
            message: text,
            time: time.toString(),
          );

          chatWidgets.add(chatWidget);
        }
        return Material(
          color: const Color(0xFF6A1321),
          child: Column(
            children: chatWidgets,
          ),
        );
      },
    );
  }
}

class ChatListItem extends StatelessWidget {
  final String username;
  final String message;
  final String time;
  final String avatarUrl;

  const ChatListItem(
      {super.key,
      required this.username,
      required this.message,
      required this.time,
      required this.avatarUrl});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.red[900],
        backgroundImage: NetworkImage(avatarUrl),
      ),
      title: Text(
        username,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 19.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(
        message,
        style: const TextStyle(
          color: Colors.white70,
          overflow: TextOverflow.ellipsis,
        ),
      ),
      trailing: Text(
        time,
        style: const TextStyle(
          color: Colors.white70,
        ),
      ),
    );
  }
}
