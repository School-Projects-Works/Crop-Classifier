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
import 'package:greanleaf/shared/widgets/app_bottom.dart';
import 'package:greanleaf/shared/widgets/shows_toust_color.dart';
import 'package:greanleaf/screans/login/models/user_model.dart';
import 'package:greanleaf/screans/signup/logic/sign_up_cubit.dart';
import 'package:greanleaf/screans/signup/ui/widgets/sign_up_form.dart';

import '../../../../shared/utils/app_styles.dart';

class SignUpViewBody extends StatefulWidget {
  const SignUpViewBody({super.key});

  @override
  State<SignUpViewBody> createState() => _SignUpViewBodyState();
}

class _SignUpViewBodyState extends State<SignUpViewBody> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpCubit, SignUpState>(
      listener: (context, state) {
        if (state is SignUpLoading) {
          showDialog(
            context: context,
            builder: (_) => Center(
              child: CircularProgressIndicator(
                color: ColorManger.whiteColor,
              ),
            ),
          );
        }
        if (state is SignUpSuccess) {
          if (state.registerModel.status == true) {
            Navigator.of(context).pop();
            showTouster(
              massage: state.registerModel.message!,
              state: ToustState.SUCCESS,
            );
            saveUserData(state.registerModel.data!);

            LocalServices.saveData(
              key: 'token',
              value: state.registerModel.data!.token,
            ).then(
              (value) {
                context.navigateAndRemoveUntil(
                  newRoute: Routes.homeViewsRoute,
                );
              },
            );
          }
        }
        if (state is SignUpError) {
          Navigator.of(context).pop(); // close the dialog if login fails
          showTouster(
            massage: state.errorMessage,
            state: ToustState.ERROR,
          );
        }
      },
      builder: (context, state) {
        var signUpCubite = BlocProvider.of<SignUpCubit>(context);
        return Padding(
          padding:
              EdgeInsets.symmetric(horizontal: 18.w, vertical: 30.h).copyWith(
            bottom: 0,
          ),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SafeArea(
                    child: Image.asset(
                      ImagesAssetsManager.greenLeafLogo,
                      width: 50.w,
                      height: 40.h,
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
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
                    height: 20.h,
                  ),
                  FadeInRight(
                    child: const SignUpForm(),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  CustomBottom(
                    bottomtext: 'Login',
                    textBottomStyle: AppStyle.font16Whitesemibold,
                    onPressed: () {
                      if (signUpCubite.formKey.currentState!.validate() ==
                          true) {
                        signUp(context);
                      } else {
                        signUpCubite.autovalidateMode = AutovalidateMode.always;
                        setState(() {});
                      }
                    },
                    backgroundColor: ColorManger.primaryColor,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    'I have account ?',
                    style: AppStyle.font16Greyregular,
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  GestureDetector(
                    onTap: () {
                      context.navigateAndReplacement(
                          newRoute: Routes.loginViewsRoute);
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

  void signUp(BuildContext context) {
    BlocProvider.of<SignUpCubit>(context).userSignUp(
      email: context.read<SignUpCubit>().emailController.text,
      password: context.read<SignUpCubit>().passwordController.text,
      city: context.read<SignUpCubit>().cityController.text,
      fullName: context.read<SignUpCubit>().nameController.text,
      phoneNumber: context.read<SignUpCubit>().passwordController.text,
    );
  }

  void saveUserData(Data data) {
    UserModel userModel = UserModel(data: data);
    String userJson = jsonEncode(userModel.toJson());
    LocalServices.saveData(key: 'userData', value: userJson);
  }
}
