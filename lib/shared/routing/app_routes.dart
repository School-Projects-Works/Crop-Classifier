import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:greanleaf/shared/helper/helper_const.dart';
import 'package:greanleaf/shared/routing/routes.dart';
import 'package:greanleaf/shared/utils/app_colors.dart';
import 'package:greanleaf/screans/home/ui/views/home_view.dart';
import 'package:greanleaf/screans/login/logic/login_cubit.dart';
import 'package:greanleaf/screans/login/ui/views/login_view.dart';
import 'package:greanleaf/screans/onbording/logic/onbording_cubit.dart';
import 'package:greanleaf/screans/onbording/ui/views/on_boarding_view.dart';
import 'package:greanleaf/screans/signup/logic/sign_up_cubit.dart';
import 'package:greanleaf/screans/signup/ui/views/sign_up_view.dart';

class AppRoutes {
  static Route<dynamic>? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.initialRoute:
        if (onBording != null) {
          if (usertoken != null) {
            return MaterialPageRoute(
              builder: (context) => BlocProvider(
                create: (context) => OnboardingCubit(),
                child: const HomeView(),
              ),
            );
          } else {
            return MaterialPageRoute(
              builder: (context) => BlocProvider(
                create: (context) => LoginCubit(),
                child: const LoginView(),
              ),
            );
          }
        } else {
          return MaterialPageRoute(
            builder: (context) => BlocProvider(
              create: (context) => OnboardingCubit(),
              child: const OnBordingView(),
            ),
          );
        }

      case Routes.loginViewsRoute:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => LoginCubit(),
            child: const LoginView(),
          ),
        );

      case Routes.signUpViewsRoute:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => SignUpCubit(),
            child: const SignUpView(),
          ),
        );

      case Routes.homeViewsRoute:
        return MaterialPageRoute(
          builder: ((context) => const HomeView()),
        );

      default:
        return _unFoundRoute();
    }
  }

  static Route<dynamic> _unFoundRoute() {
    return MaterialPageRoute(
      builder: (context) => Scaffold(
        body: Center(
          child: Text('noRouteFounded',
              style: TextStyle(
                fontSize: 28,
                color: ColorManger.blackColor,
              )),
        ),
      ),
    );
  }
}
