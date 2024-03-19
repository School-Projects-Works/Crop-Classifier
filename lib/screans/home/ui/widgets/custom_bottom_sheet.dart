// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greanleaf/shared/helper/naviagtion_extentaions.dart';
import 'package:greanleaf/shared/utils/app_colors.dart';
import 'package:greanleaf/shared/utils/app_styles.dart';
import 'package:greanleaf/shared/widgets/app_bottom.dart';
import 'package:greanleaf/screans/home/logic/cubit/home_cubit.dart';

import 'package:image_picker/image_picker.dart';

class CustomBottomSheet extends StatelessWidget {
  const CustomBottomSheet({
    super.key,
    required this.cubit,
  });

  final HomeCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 200.h,
      decoration: BoxDecoration(
          color: ColorManger.whiteColor,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(32),
            topRight: Radius.circular(32),
          )),
      child: Column(
        children: [
          SizedBox(height: 10.h),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
              child: CustomBottom(
                textBottomStyle: AppStyle.font16blackmedium,
                onPressed: () async {
                  await cubit.uploadImageFromGalleryModel(
                    picker: ImagePicker(),
                  );
                  context.pop();
                  await cubit.classifyImage(image: cubit.image!);
                },
                bottomtext: 'Select From Gallery',
                backgroundColor: ColorManger.primaryColor,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
              child: CustomBottom(
                backgroundColor: ColorManger.primaryColor,
                textBottomStyle: AppStyle.font16blackmedium,
                onPressed: () async {
                  await cubit.uploadImageFromCameraModel(
                    picker: ImagePicker(),
                  );
                  context.pop();
                  await cubit.classifyImage(image: cubit.image!);
                },
                bottomtext: 'Select From Camera',
              ),
            ),
          ),
          SizedBox(height: 30.h)
        ],
      ),
    );
  }
}
