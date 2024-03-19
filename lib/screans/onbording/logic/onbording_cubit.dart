// Import necessary packages and files
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:greanleaf/shared/helper/naviagtion_extentaions.dart';
import 'package:greanleaf/shared/networking/local_services.dart';
import 'package:greanleaf/shared/routing/routes.dart';
import 'package:greanleaf/shared/utils/app_image_assets.dart';
import 'package:greanleaf/screans/onbording/models/on_bording_model.dart';

// Import the onboarding state file
part 'onbording_state.dart';

// Create a Cubit to manage the onboarding state
class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit() : super(OnboardingInitial());

  // Variable to track if the last onboarding page is reached
  bool isLastBoarding = false;

  // Method to get list of onboarding pages
  List<OnboardingModel> onboardingPages() {
    return <OnboardingModel>[
      OnboardingModel(
        title: 'Welcome to\nGreenleaf',
        imagePath: ImagesAssetsManager.onboardingImage1,
        subtitle:
            'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old.',
      ),
      OnboardingModel(
        title: 'Take a photo\nof a plant',
        imagePath: ImagesAssetsManager.onboardingImage2,
        subtitle:
            'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old.',
      ),
      OnboardingModel(
        title: 'And voila\nthere it is',
        imagePath: ImagesAssetsManager.onboardingImage3,
        subtitle:
            'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old.',
      ),
    ];
  }

  // Method to handle change of page index in page view
  void onChangePageIndex(index) {
    if (index == onboardingPages().length - 1) {
      isLastBoarding =
          true; // Set isLastBoarding to true if last page is reached
    } else {
      isLastBoarding = false; // Set isLastBoarding to false otherwise
    }
    emit(PageViewIndexChangedState());
  }

  // Method to navigate between onboarding pages
  void navigateBetweenPages({
    required BuildContext context,
    required PageController pageController,
  }) {
    if (isLastBoarding) {
      navigateToAuth(
          context:
              context); // Navigate to authentication page if last onboarding page is reached
    } else {
      pageController.nextPage(
        duration: const Duration(seconds: 1),
        curve: Curves.fastLinearToSlowEaseIn,
      ); // Move to the next page in the page view
    }
    emit(NavigateBetweenPages());
  }
}

// Function to navigate to authentication page
void navigateToAuth({required BuildContext context}) {
  LocalServices.saveData(
    key: 'onbording',
    value: true,
  ).then(
    (value) {
      if (value) {
        context.navigateTo(
          routeName: Routes.loginViewsRoute,
        ); // Navigate to login page
      }
    },
  );
}
