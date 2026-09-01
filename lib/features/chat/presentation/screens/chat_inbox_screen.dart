import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trading/share/widgets/custom_container/custom_container.dart';
import 'package:trading/share/widgets/custom_image/custom_image.dart';
import 'package:trading/utils/app_assets/app_assets.dart';
import 'package:trading/utils/app_colors/app_colors.dart';
import 'package:trading/utils/app_text/app_strings.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../models/chat_model.dart';
import '../widgets/message_double.dart';

class ChatInboxScreen extends StatefulWidget {
  const ChatInboxScreen({super.key});

  @override
  State<ChatInboxScreen> createState() => _ChatInboxScreenState();
}

class _ChatInboxScreenState extends State<ChatInboxScreen> {
  final TextEditingController _messageController = TextEditingController();

  // temporary local messages (API later)
  final List<ChatMessage> _messages = [
    ChatMessage(text: "Hello 👋", isMe: false),
    ChatMessage(text: "Hi, how can I help you?", isMe: true),
    ChatMessage(
      text:
          "Hello rrrrrrrrrrrrrrrrrrrrrdfsdfdsafsdfdsafsdaffffffffffffffffffffffffffffffffffffffffffewrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr 👋",
      isMe: false,
    ),
    ChatMessage(text: "Hi, how can I help you?", isMe: true),
    ChatMessage(text: "Hello 👋", isMe: false),
    ChatMessage(text: "Hi, how can I help you?", isMe: true),
    ChatMessage(
      text:
      "Hello rrrrrrrrrrrrrrrrrrrrrdfsdfdsafsdfdsafsdaffffffffffffffffffffffffffffffffffffffffffewrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr 👋",
      isMe: false,
    ),
    ChatMessage(text: "Hi, how can I help you?", isMe: true),
    ChatMessage(text: "Hello 👋", isMe: false),
    ChatMessage(text: "Hi, how can I help you?", isMe: true),
    ChatMessage(
      text:
      "Hello rrrrrrrrrrrrrrrrrrrrrdfsdfdsafsdfdsafsdaffffffffffffffffffffffffffffffffffffffffffewrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr 👋",
      isMe: false,
    ),
    ChatMessage(text: "Hi, how can I help you?", isMe: true),




  ];

  void _sendMessage() {
    if (_messageController.text.trim().isEmpty) return;

    setState(() {
      _messages.add(
        ChatMessage(text: _messageController.text.trim(), isMe: true),
      );
    });

    _messageController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          Get.back();
        //  context.pop();
        }, icon: Icon(Icons.arrow_back_ios)),
        title: Text("User Name",
          style:   GoogleFonts.poppins(
              fontSize: 14,
              color: AppColors.primary,
              fontWeight: FontWeight.w600
          ),
        ),
        actions: [
          //CustomProfileAvatar()
        ],

      ),

      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            SizedBox(height: 8.h,),

             TextField(
               decoration: InputDecoration(
                 hintText: AppText.search
               ),
             ),
            /// 🔹 Message list
            Expanded(
              child: ListView.builder(
                //padding: EdgeInsets.all(16.w),
                itemCount: _messages.length,
                itemBuilder: (context, index) {
                  return MessageBubble(message: _messages[index]);
                },
              ),
            ),

            /// 🔹 Input box
            SafeArea(
              child: CustomContainer(
                borderColor: AppColors.outlineBorder,
                radius: 12.r,
               horizontal: 4,
                vertical: 8,

                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _messageController,
                        decoration: InputDecoration(
                          fillColor: AppColors.redAccent,
                          filled: true,
                          hintText: "Type a message...",
                          border: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: _sendMessage,
                      icon: CustomImage(imageSrc: AppAssets.sendMessageSocial),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
