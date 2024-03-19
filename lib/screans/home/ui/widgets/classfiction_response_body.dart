// ignore_for_file: use_build_context_synchronously

import 'package:dio/dio.dart';
import 'package:downloads_path_provider_28/downloads_path_provider_28.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greanleaf/screans/home/logic/cubit/home_cubit.dart';
import 'package:greanleaf/screans/home/models/classfiction_model.dart';
import 'package:greanleaf/shared/networking/end_boint.dart';
import 'package:greanleaf/shared/utils/app_colors.dart';
import 'package:greanleaf/shared/utils/app_styles.dart';
import 'package:permission_handler/permission_handler.dart';

class ClassfictionResponseBody extends StatelessWidget {
  const ClassfictionResponseBody({
    super.key,
    required this.classfictionModel,
  });
  final ClassfictionModel classfictionModel;

  @override
  Widget build(BuildContext context) {
    final image = BlocProvider.of<HomeCubit>(context).image;

    return Container(
      width: double.infinity,
      height: 550.h,
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
              child: CircleAvatar(
                // Make it in chased network image
                backgroundImage: image != null
                    ? NetworkImage('$baseUrl${classfictionModel.data!.image}')
                    : null,
                backgroundColor: Colors.transparent,
                radius: 44,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 60.h,
                ),
                Text(
                  classfictionModel.data!.predictions!,
                  style: AppStyle.font16blacksemibold,
                ),
                SizedBox(
                  height: 20.h,
                ),
                Expanded(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'About this palnt:',
                            style: AppStyle.font14blackmedium,
                          ),
                          SizedBox(
                            height: 35.h,
                            child: TextButton(
                              onPressed: () async {
                                await saveAsPDF(context, classfictionModel);
                              },
                              child: Text(
                                'Save as PDF',
                                style: AppStyle.font16blacksemibold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Expanded(
                        child: Text(
                          classfictionModel.data!.description!,
                          style: AppStyle.font12Greymedium,
                        ),
                      ),
                      Divider(
                        height: 5.h,
                        thickness: 0.5,
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 5.h,
                      ),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          'Temperature:',
                          style: AppStyle.font14blackmedium,
                        ),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Expanded(
                        child: Text(
                          classfictionModel.data!.temperature!,
                          style: AppStyle.font12Greymedium,
                        ),
                      ),
                      Divider(
                        height: 5.h,
                        thickness: 0.5,
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 5.h,
                      ),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          'Sunlight:',
                          style: AppStyle.font14blackmedium,
                        ),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Expanded(
                        child: Text(
                          classfictionModel.data!.sunlight!,
                          style: AppStyle.font12Greymedium,
                        ),
                      ),
                      Divider(
                        height: 5.h,
                        thickness: 0.5,
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 5.h,
                      ),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          'Watering:',
                          style: AppStyle.font14blackmedium,
                        ),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Expanded(
                        child: Text(
                          classfictionModel.data!.watering!,
                          style: AppStyle.font12Greymedium,
                        ),
                      ),
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

  Future<void> saveAsPDF(
      BuildContext context, ClassfictionModel classfictionModel) async {
    Map<Permission, PermissionStatus> statuses =
        await [Permission.storage].request();

    if (statuses[Permission.storage]!.isGranted) {
      var dir = await DownloadsPathProvider.downloadsDirectory;
      if (dir != null) {
        String saveName =
            "${classfictionModel.data!.description!.split(' ').first}.pdf";
        String savePath = "${dir.path}/$saveName";

        try {
          await Dio().download(
              '$baseUrl${classfictionModel.data!.reportpath}', savePath);
          showCustomSnackBar(context, 'File Downloaded');
        } catch (e) {
          showCustomSnackBar(context, 'File Download Failed');
        }
      }
    } else {
      showCustomSnackBar(context, 'Permission Denied !');
    }
  }

  void showCustomSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }
}
