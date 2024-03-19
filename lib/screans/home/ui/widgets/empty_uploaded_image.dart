import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greanleaf/shared/utils/app_colors.dart';
import 'package:greanleaf/shared/utils/app_styles.dart';

class EmptyUploadedImage extends StatelessWidget {
  const EmptyUploadedImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 350.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32),
        color: ColorManger.whiteColor,
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            left: 0,
            right: 0,
            top: -50,
            child: CircleAvatar(
              radius: 62,
              backgroundColor: ColorManger.whiteColor,
              child: const CircleAvatar(
                backgroundImage: AssetImage(
                  'assets/images/upload (2).png',
                ),
                backgroundColor: Colors.transparent,
                radius: 44,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 70.h,
                ),
                Text(
                  'Upload your plant photo Please',
                  style: AppStyle.font16blacksemibold,
                ),
                Divider(
                  height: 35.h,
                  thickness: 1.1,
                ),
                Expanded(
                  child: Row(
                    children: [
                      SizedBox(
                        width: 10.h,
                      ),
                      Image.asset(
                        'assets/images/menu.png',
                        height: 30,
                        width: 30,
                      ),
                      SizedBox(
                        width: 10.h,
                      ),
                      Text(
                        'About this palnt',
                        style: AppStyle.font16blackmedium,
                      )
                    ],
                  ),
                ),
                Divider(
                  height: 35.h,
                  thickness: 1.1,
                ),
                Expanded(
                  child: Row(
                    children: [
                      SizedBox(
                        width: 10.h,
                      ),
                      Image.asset(
                        'assets/images/temp.png',
                        height: 30,
                        width: 30,
                      ),
                      SizedBox(
                        width: 10.h,
                      ),
                      Text(
                        'Temperature',
                        style: AppStyle.font16blackmedium,
                      )
                    ],
                  ),
                ),
                Divider(
                  height: 35.h,
                  thickness: 1.1,
                ),
                Expanded(
                  child: Row(
                    children: [
                      SizedBox(
                        width: 10.h,
                      ),
                      Image.asset(
                        'assets/images/sunlight.png',
                        height: 30,
                        width: 30,
                      ),
                      SizedBox(
                        width: 10.h,
                      ),
                      Text(
                        'Sunlight',
                        style: AppStyle.font16blackmedium,
                      )
                    ],
                  ),
                ),
                Divider(
                  height: 35.h,
                  thickness: 1.1,
                ),
                Expanded(
                  child: Row(
                    children: [
                      SizedBox(
                        width: 10.h,
                      ),
                      Image.asset(
                        'assets/images/water.png',
                        height: 30,
                        width: 30,
                      ),
                      SizedBox(
                        width: 10.h,
                      ),
                      Text(
                        'Watering',
                        style: AppStyle.font16blackmedium,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
