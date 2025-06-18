import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_world/views/styles/font_styles.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _chatController = TextEditingController();
  final List<String> _chatMessages = [];

  void _sendMessage() {
    final text = _chatController.text.trim();
    if (text.isEmpty) return;
    setState(() {
      _chatMessages.add(text);
    });
    _chatController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0).w,
          child: Column(
            children: [
              //Top bar
              Row(
                children: [
                  Container(
                    height: 55.h,
                    width: 55.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(22).r,
                      color: Theme.of(context).colorScheme.surface,
                      boxShadow: [
                        BoxShadow(offset: Offset(0, 4), blurRadius: 4.r),
                      ],
                    ),
                    child: Center(
                      child: IconButton(
                        padding: EdgeInsets.zero,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.arrow_back_ios,
                          color: Theme.of(context).colorScheme.secondary,
                          size: 24.h,
                        ),
                      ),
                    ),
                  ),
                  16.horizontalSpace,
                  Text(
                    'Customer Service',
                    style: FontStyles.mediumText(
                      Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                ],
              ),

              10.verticalSpace,

              // Chat list
              Expanded(
                child: ListView.builder(
                  itemCount: _chatMessages.length,
                  padding: const EdgeInsets.all(10).r,
                  reverse: true,
                  itemBuilder: (context, index) {
                    final chatMessage =
                        _chatMessages[_chatMessages.length - 1 - index];
                    return Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 5).h,
                        padding:
                            const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 8,
                            ).r,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12).r,
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                        child: Text(
                          chatMessage,
                          style: FontStyles.smallText(
                            Theme.of(context).colorScheme.surface,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),

              // Message input bar
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 10).r,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surface,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 14).r,
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.surface,
                          borderRadius: BorderRadius.circular(24).r,
                          border: Border.all(
                            color: Theme.of(context).colorScheme.secondary,
                            width: 1.5.w,
                          ),
                        ),
                        child: TextField(
                          controller: _chatController,
                          textCapitalization: TextCapitalization.sentences,
                          style: FontStyles.smallText(
                            Theme.of(context).colorScheme.onSurface,
                          ),
                          decoration: const InputDecoration(
                            hintText: 'Type a message...',
                            border: InputBorder.none,
                          ),
                          onSubmitted: (_) => _sendMessage(),
                        ),
                      ),
                    ),
                    8.horizontalSpace,
                    GestureDetector(
                      onTap: _sendMessage,
                      child: CircleAvatar(
                        radius: 24.r,
                        backgroundColor:
                            Theme.of(context).colorScheme.secondary,
                        child: Icon(
                          Icons.send,
                          size: 20.r,
                          color: Theme.of(context).colorScheme.surface,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
