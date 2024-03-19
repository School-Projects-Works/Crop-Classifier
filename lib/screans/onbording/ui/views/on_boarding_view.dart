import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:greanleaf/screans/onbording/logic/onbording_cubit.dart';
import 'package:greanleaf/screans/onbording/ui/widgets/onbording_view_body.dart';

class OnBordingView extends StatelessWidget {
  const OnBordingView({super.key});
  static const String routeName = 'OnBording';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<OnboardingCubit, OnboardingState>(
        builder: (context, state) {
          return OnboardingViewBody(
            cubit: BlocProvider.of<OnboardingCubit>(context),
          );
        },
      ),
    );
  }
}
