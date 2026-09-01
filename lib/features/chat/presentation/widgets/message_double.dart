import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trading/helper/responsive_helper/responsive_helper.dart';
import 'package:trading/utils/extension/base_extension.dart';
import '../../models/chat_model.dart';

class MessageBubble extends StatelessWidget {
  final ChatMessage message;

  const MessageBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: message.isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: message.isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(bottom:ResponsiveHelper.height(4),),
            padding: ResponsiveHelper.symmetric(
              horizontal: 14.w,
              vertical: 10.h,
            ),
            constraints: BoxConstraints(maxWidth: ResponsiveHelper.width(280),),
            decoration: BoxDecoration(
              // Sender hole Red, Receiver hole Off-white/Grey
              color: message.isMe ? Color(0xFFD9534F) : Color(0xFFF8F9FA),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(ResponsiveHelper.borderRadius(16),),
                topRight: Radius.circular(ResponsiveHelper.borderRadius(16),),
                // Sender er jonno bottom-right 0, Receiver er jonno bottom-left 0
                bottomRight: Radius.circular(message.isMe ? ResponsiveHelper.borderRadius(16) : 0),
                bottomLeft: Radius.circular(message.isMe ? 0 :ResponsiveHelper.borderRadius(16),),
              ),
              border: message.isMe
                  ? null
                  : Border.all(color: Colors.grey.shade200),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  child: Text(
                                message.text,
                    maxLines: 100,
                    overflow:TextOverflow.ellipsis ,

                    style: context.bodySmall.copyWith(
                      color: message.isMe ? Colors.white : Colors.black87,
                    ),
                  ),
                ),

                if (!message.isMe)
                  Padding(
                    padding: EdgeInsets.only(top: ResponsiveHelper.height(4)),
                    child: Icon(Icons.done, color: Colors.red, size: ResponsiveHelper.fontSize(16),),
                  ),
              ],
            ),
          ),
          // "1 day ago" text ta bubble er baire thakle evabe add kora jay
          if (message.isMe)
            Padding(
              padding: EdgeInsets.only(
                  bottom: ResponsiveHelper.height(16),
                  right: ResponsiveHelper.width(4),
              ),
              child: Text(
                "1 day ago",
                style: TextStyle(fontSize: ResponsiveHelper.fontSize(10),
                    color: Colors.grey),
              ),
            ),
        ],
      ),
    );
  }
}
