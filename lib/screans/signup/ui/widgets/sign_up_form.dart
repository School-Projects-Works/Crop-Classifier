import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greanleaf/shared/helper/validators_helper.dart';
import 'package:greanleaf/shared/utils/app_styles.dart';
import 'package:greanleaf/shared/widgets/app_text_formfield.dart';
import 'package:greanleaf/screans/signup/logic/sign_up_cubit.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  bool ispassword = true;

  @override
  Widget build(BuildContext context) {
    var signUpCubit = BlocProvider.of<SignUpCubit>(context);
    return Form(
      key: signUpCubit.formKey,
      autovalidateMode: context.read<SignUpCubit>().autovalidateMode,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'name',
            style: AppStyle.font16blacksemibold,
          ),
          SizedBox(
            height: 5.h,
          ),
          CustomTextFormFiled(
            obscureText: false,
            hintText: 'Full Name',
            keyboardType: TextInputType.emailAddress,
            controller: signUpCubit.nameController,
            validator: (text) {
              return MyValidatorsHelper.displayNamevalidator(text);
            },
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(
            'Email address',
            style: AppStyle.font16blacksemibold,
          ),
          SizedBox(
            height: 5.h,
          ),
          CustomTextFormFiled(
            obscureText: false,
            hintText: 'Email address',
            keyboardType: TextInputType.emailAddress,
            controller: signUpCubit.emailController,
            validator: (text) {
              return MyValidatorsHelper.emailValidator(text);
            },
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(
            'Password',
            style: AppStyle.font16blacksemibold,
          ),
          SizedBox(
            height: 5.h,
          ),
          CustomTextFormFiled(
            obscureText: ispassword,
            suffixIcon: InkWell(
              splashColor: Colors.transparent,
              onTap: () {
                setState(() {
                  ispassword = !ispassword;
                });
              },
              child: ispassword
                  ? const Icon(Icons.visibility_off)
                  : const Icon(Icons.visibility),
            ),
            hintText: 'Min 6 characters',
            keyboardType: TextInputType.visiblePassword,
            controller: signUpCubit.passwordController,
            validator: (text) {
              return MyValidatorsHelper.passwordValidator(text);
            },
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(
            'City',
            style: AppStyle.font16blacksemibold,
          ),
          SizedBox(
            height: 5.h,
          ),
          CustomTextFormFiled(
            obscureText: false,
            hintText: 'city',
            keyboardType: TextInputType.emailAddress,
            controller: signUpCubit.cityController,
            validator: (text) {
              return MyValidatorsHelper.cityValidator(text);
            },
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(
            'phone',
            style: AppStyle.font16blacksemibold,
          ),
          SizedBox(
            height: 5.h,
          ),
          CustomTextFormFiled(
            obscureText: false,
            hintText: 'phone Number',
            keyboardType: TextInputType.emailAddress,
            controller: signUpCubit.phoneController,
            validator: (text) {
              return MyValidatorsHelper.phoneValidator(text);
            },
          ),
        ],
      ),
    );
  }
}
