import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trading/core/routes/app_routes.dart';
import 'package:trading/helper/responsive_helper/responsive_helper.dart';
import 'package:trading/utils/app_text/app_strings.dart';
import 'package:get/get.dart';

import '../widgets/user_chat_list_widget.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(


      body: SingleChildScrollView(
        child: Padding(
          padding: ResponsiveHelper.all(16),
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                    hintText: AppText.search
                ),
              ),
              SizedBox(height: ResponsiveHelper.height(16),),
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 100,
                itemBuilder: (context, index) {
                  return UserChatListWidget(
                    onTap: () {
                     Get.toNamed(AppRoutes.chatInboxScreen);
                    },
                    name: 'Georgiaa',
                    message: 'its urgentt do it asap',
                    time: '3:15 pm',
                    count: '4',
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
