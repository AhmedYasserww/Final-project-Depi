import 'package:flutter/material.dart';
import 'package:kids_education_learning/core/utils/app_images.dart';
import 'package:kids_education_learning/core/utils/app_style.dart';

import '../utils/app_color.dart';

class CustomChatListView extends StatelessWidget {
  CustomChatListView({super.key});

  final List<Map<String, dynamic>> chats = [
    {
      'name': 'Sarah Eastwood',
      'message': 'Hi Sarah, I have scheduled our next...',
      'time': '1hr',
      'image': AppImages.profilePic,
    },
    {
      'name': 'Noah Dawson',
      'message': 'Hi Sarah, I have scheduled our next lesson',
      'time': '',
      'image': AppImages.profilePic,
    },
    {
      'name': 'Olivia Hayes',
      'message': 'Hi Sarah, I have scheduled our next lesson',
      'time': '',
      'image': AppImages.profilePic,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: chats.length,
      itemBuilder: (context, index) {
        final chat = chats[index];

        return ChatItem(
          name: chat['name'],
          message: chat['message'],
          image: chat['image'],
        );
      },
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
      title: Text(name, style: AppStyle.styleChatListView),
      subtitle: Text(
        message,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(color: AppColors.subtitleListTile),
      ),
    );
  }
}
