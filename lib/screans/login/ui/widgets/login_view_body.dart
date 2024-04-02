import 'dart:convert';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greanleaf/shared/helper/naviagtion_extentaions.dart';
import 'package:greanleaf/shared/networking/local_services.dart';
import 'package:greanleaf/shared/routing/routes.dart';
import 'package:greanleaf/shared/utils/app_colors.dart';
import 'package:greanleaf/shared/utils/app_image_assets.dart';
import 'package:greanleaf/shared/utils/app_styles.dart';
import 'package:greanleaf/shared/widgets/app_bottom.dart';
import 'package:greanleaf/shared/widgets/shows_toust_color.dart';
import 'package:greanleaf/screans/login/logic/login_cubit.dart';
import 'package:greanleaf/screans/login/models/user_model.dart';
import 'package:greanleaf/screans/login/ui/widgets/login_form.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginLoading) {
          showDialog(
            context: context,
            builder: (_) => Center(
              child: CircularProgressIndicator(
                color: ColorManger.whiteColor,
              ),
            ),
          );
        }
        if (state is LoginSuccess) {
          if (state.loginModel.status == true) {
            Navigator.of(context).pop();
            showTouster(
              massage: state.loginModel.message!,
              state: ToustState.SUCCESS,
            );
            saveUserData(state.loginModel.data!);

            LocalServices.saveData(
              key: 'token',
              value: state.loginModel.data!.token,
            ).then(
              (value) {
                context.navigateAndRemoveUntil(
                  newRoute: Routes.homeViewsRoute,
                );
              },
            );
          }
        }
        if (state is LoginError) {
          Navigator.of(context).pop(); // close the dialog if login fails
          showTouster(
            massage: state.error,
            state: ToustState.ERROR,
          );
        }
      },
      builder: (context, state) {
        var loginCubite = BlocProvider.of<LoginCubit>(context);
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 40.h),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 20.h,
                  ),
                  SafeArea(
                    child: Image.asset(
                      ImagesAssetsManager.greenLeafLogo,
                      width: 50.w,
                      height: 40.h,
                    ),
                  ),
                  SizedBox(
                    height: 50.h,
                  ),
                  Text(
                    'Log In To Your Account',
                    style: AppStyle.font20blacksemibold,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    'We ‘re happy to see you back again',
                    style: AppStyle.font16Greyregular,
                  ),
                  SizedBox(
                    height: 60.h,
                  ),
                  FadeInRight(
                    child: const LoginForm(),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'Forgot your password?',
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .copyWith(color: ColorManger.primaryColor),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 60.h,
                  ),
                  CustomBottom(
                    bottomtext: 'Login',
                    textBottomStyle: AppStyle.font16Whitesemibold,
                    onPressed: () {
                      if (loginCubite.formKey.currentState!.validate() ==
                          true) {
                        loginUser(context);
                      } else {
                        loginCubite.autovalidateMode = AutovalidateMode.always;
                        setState(() {});
                      }
                    },
                    backgroundColor: ColorManger.primaryColor,
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  Text(
                    'Don’t have account?',
                    style: AppStyle.font16Greyregular,
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  GestureDetector(
                    onTap: () {
                      context.navigateTo(routeName: Routes.signUpViewsRoute);
                    },
                    child: Text(
                      'Sign Up',
                      style: AppStyle.font14Primarysemibold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void loginUser(BuildContext context) {
    BlocProvider.of<LoginCubit>(context).userSignIn(
      email: context.read<LoginCubit>().emailController.text,
      password: context.read<LoginCubit>().passwordController.text,
    );
  }

  void saveUserData(Data data) {
    UserModel userModel = UserModel(data: data);
    String userJson = jsonEncode(userModel.toJson());
    LocalServices.saveData(key: 'userData', value: userJson);
  }
}
