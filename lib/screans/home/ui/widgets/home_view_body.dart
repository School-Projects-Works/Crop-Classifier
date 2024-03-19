import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greanleaf/shared/utils/app_colors.dart';
import 'package:greanleaf/shared/utils/app_image_assets.dart';
import 'package:greanleaf/shared/utils/app_styles.dart';
import 'package:greanleaf/shared/widgets/primary_header_continer.dart';
import 'package:greanleaf/shared/widgets/shows_toust_color.dart';
import 'package:greanleaf/screans/home/logic/cubit/home_cubit.dart';
import 'package:greanleaf/screans/home/ui/widgets/classfiction_response_body.dart';
import 'package:greanleaf/screans/home/ui/widgets/custom_bottom_sheet.dart';
import 'package:greanleaf/screans/home/ui/widgets/empty_uploaded_image.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  @override
  void initState() {
    BlocProvider.of<HomeCubit>(context).getUserData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (BuildContext context, HomeState state) {
        if (state is UploadAndGetResponseToModelLoadingState) {
          showDialog(
            context: context,
            builder: (_) => Center(
              child: CircularProgressIndicator(
                color: ColorManger.whiteColor,
              ),
            ),
          );
        } else if (state is UploadAndGetResponseToModelSucsesState) {
          if (state.classfictionModel.status == true) {
            Navigator.of(context)
                .pop(); // close the dialog if successfully logged in
            showTouster(
              massage: state.classfictionModel.message!,
              state: ToustState.SUCCESS,
            );
          }
        }
        if (state is UploadAndGetResponseToModelErrorState) {
          Navigator.of(context).pop(); // close the dialog if login fails
          showTouster(
            massage: state.errorMessage,
            state: ToustState.ERROR,
          );
        }
      },
      builder: (context, state) {
        HomeCubit cubit = HomeCubit.getObject(context);

        return SingleChildScrollView(
          child: Column(
            children: [
              PrimaryHeaderContiner(
                height: MediaQuery.of(context).size.height * 0.16,
                child: SafeArea(
                  child: Padding(
                    padding:
                        EdgeInsets.only(left: 16.w, right: 16.w, top: 16.h),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 10.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Good afternoon,${cubit.fullName ?? 'User'}',
                                  style: AppStyle.font18Whitesemibold,
                                ),
                                SizedBox(
                                  height: 5.h,
                                ),
                                Text(
                                  'Let’s take care of the plants together',
                                  style: AppStyle.font14Whiteregular,
                                ),
                              ],
                            ),
                            InkWell(
                              onTap: () {
                                showModalBottomSheet(
                                  backgroundColor: Colors.transparent,
                                  isScrollControlled: true,
                                  context: context,
                                  builder: (context) {
                                    return CustomBottomSheet(cubit: cubit);
                                  },
                                );
                              },
                              child: Image.asset(
                                'assets/images/menu-03.png',
                                height: 30.h,
                                width: 27.w,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: Column(
                  children: [
                    Image.asset(
                      ImagesAssetsManager.greenLeafLogo,
                      height: 80.h,
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      'Smart Soil',
                      style: AppStyle.font20blacksemibold,
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      'Snap a leaf, know your plant, get expert care advice. GreenLeaf identifies plants, diagnoses issues, and provides personalized care instructions based on weather. Become a confident plant parent and nurture a thriving green haven!',
                      style: AppStyle.font14Greymedium,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 66,
                    ),
                    cubit.classfictionModel != null
                        ? ClassfictionResponseBody(
                            classfictionModel: cubit.classfictionModel!,
                          )
                        : const EmptyUploadedImage()
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
