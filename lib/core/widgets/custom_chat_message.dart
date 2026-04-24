import 'package:flutter/material.dart';

class ChatsScreen extends StatelessWidget {
  ChatsScreen({super.key});

  final List<Map<String, dynamic>> chats = [
    {
      'name': 'Sarah Eastwood',
      'message': 'Hi Sarah, I have scheduled our next...',
      'time': '1hr',
      'image': 'assets/images/prof pic.png',
    },
    {
      'name': 'Noah Dawson',
      'message': 'Hi Sarah, I have scheduled our next lesson',
      'time': '',
      'image': 'assets/images/prof pic.png',
    },
    {
      'name': 'Olivia Hayes',
      'message': 'Hi Sarah, I have scheduled our next lesson',
      'time': '',
      'image': 'assets/images/prof pic.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(chats.length, (index) {
        final chat = chats[index];

        return ChatItem(
          name: chat['name']!,
          message: chat['message']!,
          image: chat['image']!,
        );
      }),
    );
  }
}

class ChatItem extends StatelessWidget {
  final String name;
  final String message;
  final String image;

  const ChatItem({
    super.key,
    required this.name,
    required this.message,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        print("Open Chat");
      },
      leading: CircleAvatar(radius: 28, backgroundImage: AssetImage(image)),
      title: Text(
        name,
        style: const TextStyle(color:Color(0xFF000846),fontWeight: FontWeight.w500, fontSize: 16),
      ),
      subtitle: Text(
        message,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(color: Color(0xFF707070)),
      ),
    );
  }
}
