import 'package:flutter/material.dart';
import 'package:greanleaf/screans/home/ui/widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xffF4F6F5),
      body: HomeViewBody(),
    );
  }
}
