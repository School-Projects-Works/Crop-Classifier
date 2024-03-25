import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greanleaf/shared/helper/naviagtion_extentaions.dart';
import 'package:greanleaf/shared/networking/local_services.dart';
import 'package:greanleaf/shared/routing/routes.dart';
import 'package:greanleaf/shared/utils/app_colors.dart';
import 'package:greanleaf/shared/utils/app_image_assets.dart';
import 'package:greanleaf/shared/utils/app_styles.dart';
import 'package:greanleaf/screans/onbording/logic/onbording_cubit.dart';

class OnboardingViewBody extends StatefulWidget {
  const OnboardingViewBody({
    super.key,
    required this.cubit,
  });
  final OnboardingCubit cubit;

  @override
  State<OnboardingViewBody> createState() => _OnboardingViewBodyState();
}

class _OnboardingViewBodyState extends State<OnboardingViewBody> {
  late PageController pageController;

  @override
  void initState() {
    pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: pageController,
      onPageChanged: (index) {
        widget.cubit.onChangePageIndex(index);
      },
      itemCount: widget.cubit.onboardingPages().length,
      itemBuilder: (context, index) {
        var height = MediaQuery.of(context).size.height;
        var widgth = MediaQuery.of(context).size.width;
        return Stack(
          children: [
            Positioned(
              left: 0,
              right: 0,
              child: Container(
                width: double.maxFinite,
                height: height * 0.7,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      widget.cubit.onboardingPages()[index].imagePath!,
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Positioned(
              height: height * 0.16,
              right: 10,
              child: TextButton.icon(
                onPressed: () {
                  LocalServices.saveData(key: 'onbording', value: true)
                      .then((value) {
                    if (value) {
                      context.navigateTo(routeName: Routes.loginViewsRoute);
                    }
                  });
                },
                icon: Text(
                  'Skip',
                  style: AppStyle.font16blacksemibold,
                ),
                label: const Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.black,
                  size: 15,
                ),
              ),
            ),
            Positioned(
              top: height * 0.6,
              child: Container(
                height: height * 1,
                width: widgth * 1,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(74),
                    topRight: Radius.circular(74),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.4),
                      spreadRadius: 20,
                      blurRadius: 25,
                      offset: const Offset(0, 0),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 40.h,
                        ),
                        FadeInLeft(
                          child: Text(
                            widget.cubit.onboardingPages()[index].title,
                            textAlign: TextAlign.center,
                            style: AppStyle.font32blacksemibold,
                          ),
                        ),
                        SizedBox(
                          height: 25.h,
                        ),
                        FadeInLeft(
                          child: Text(
                            widget.cubit.onboardingPages()[index].subtitle,
                            textAlign: TextAlign.center,
                            style: AppStyle.font14Greyregular,
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        FadeInRight(
                          child: Container(
                            height: 80.h,
                            width: 80.w,
                            decoration: BoxDecoration(
                              color: ColorManger.primaryColor,
                              shape: BoxShape.circle,
                            ),
                            child: GestureDetector(
                              onTap: () {
                                widget.cubit.navigateBetweenPages(
                                  context: context,
                                  pageController: pageController,
                                );
                              },
                              child: index ==
                                      widget.cubit.onboardingPages().length - 1
                                  ? Center(
                                      child: Text(
                                        'start',
                                        style: AppStyle.font14Whitesemibold,
                                      ),
                                    )
                                  : Center(
                                      child: Image.asset(
                                        ImagesAssetsManager.arrowRightIcon,
                                        width: 40.w,
                                        height: 40.h,
                                      ),
                                    ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 25.h,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
