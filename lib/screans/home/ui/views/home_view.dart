import 'package:flutter/material.dart';
import 'package:greanleaf/screans/chat/ui/views/chat_view.dart';
import 'package:greanleaf/screans/home/ui/widgets/home_view_body.dart';
import 'package:greanleaf/shared/utils/app_colors.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF4F6F5),
      body: const HomeViewBody(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return const ChatView();
          }));
        },
        backgroundColor: ColorManger.primaryColor,
        child: const Icon(
          Icons.chat,
        ),
      ),
    );
  }
}
