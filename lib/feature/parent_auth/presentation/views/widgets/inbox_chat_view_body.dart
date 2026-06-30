import 'package:flutter/material.dart';
import 'package:kids_education_learning/core/widgets/custom_chat_message.dart';
import 'package:kids_education_learning/core/widgets/custom_search_bar.dart';
import 'package:kids_education_learning/core/widgets/custom_subtitle_text_in_screen.dart';
import 'package:kids_education_learning/core/widgets/custom_title_text_in_screen.dart';

class InboxChatViewBody extends StatelessWidget {
  const InboxChatViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTitleText(text: "Inbox", fontSize: 32),
              SizedBox(height: 8),
              CustomSubtitleText(
                text:
                    "Connect with the teachers you've scheduled lessons with.",
                fontSize: 16,
              ),
              SizedBox(height: 24),
              CustomSearchBar(),
              SizedBox(height: 24),
              Expanded(child: CustomChatListView()),
            ],
          ),
        ),
      ),
    );
  }
}
