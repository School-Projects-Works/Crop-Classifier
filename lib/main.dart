import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greanleaf/bloc_observer.dart.dart';
import 'package:greanleaf/shared/helper/helper_const.dart';
import 'package:greanleaf/shared/networking/api_services.dart';
import 'package:greanleaf/shared/networking/local_services.dart';
import 'package:greanleaf/shared/routing/app_routes.dart';
import 'package:greanleaf/screans/home/logic/cubit/home_cubit.dart';

void main() async {
  await ApiServices.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      child: BlocProvider(
        create: (context) => HomeCubit()..getUserData(),
        child: const MaterialApp(
          debugShowCheckedModeBanner: false,
          onGenerateRoute: AppRoutes.onGenerateRoute,
        ),
      ),
    );
  }
}
