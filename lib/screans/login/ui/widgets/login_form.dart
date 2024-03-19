import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greanleaf/shared/utils/app_styles.dart';
import 'package:greanleaf/shared/widgets/app_text_formfield.dart';
import 'package:greanleaf/screans/login/logic/login_cubit.dart';

import '../../../../shared/helper/validators_helper.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool ispassword = true;

  @override
  Widget build(BuildContext context) {
    var loginCubite = BlocProvider.of<LoginCubit>(context);
    return Form(
      key: loginCubite.formKey,
      autovalidateMode: context.read<LoginCubit>().autovalidateMode,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Email',
            style: AppStyle.font16blacksemibold,
          ),
          SizedBox(
            height: 5.h,
          ),
          CustomTextFormFiled(
            obscureText: false,
            hintText: 'Email',
            keyboardType: TextInputType.emailAddress,
            controller: loginCubite.emailController,
            validator: (text) {
              return MyValidatorsHelper.emailValidator(text);
            },
          ),
          SizedBox(
            height: 20.h,
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
            hintText: 'Min 6 Cyfr',
            keyboardType: TextInputType.visiblePassword,
            controller: loginCubite.passwordController,
            validator: (text) {
              return MyValidatorsHelper.passwordValidator(text);
            },
          ),
          const SizedBox(
            height: 5,
          ),
        ],
      ),
    );
  }
}
