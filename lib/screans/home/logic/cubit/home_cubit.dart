import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:greanleaf/shared/error/servier_failure.dart';
import 'package:greanleaf/shared/networking/local_services.dart';
import 'package:greanleaf/shared/networking/api_services.dart';
import 'package:greanleaf/shared/networking/end_boint.dart';
import 'package:greanleaf/screans/home/models/classfiction_model.dart';
import 'package:greanleaf/screans/home/models/user_data_model.dart';

import 'package:image_picker/image_picker.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  static HomeCubit getObject(context) => BlocProvider.of<HomeCubit>(context);
  User? userData;
  String? fullName;

  Future<void> getUserData() async {
    emit(GetUserDataLoading());
    try {
      // Check if full name exists in shared preferences
      fullName = await LocalServices.getData(key: 'name');

      if (fullName != null) {
        // If full name exists in shared preferences, emit success state with userData and full name
        userData = User(data: Dataa(fullName: fullName));
        fullName = userData!.data!.fullName;
        emit(GetUserDataSuccess(userData: userData!));
      } else {
        // If full name doesn't exist in shared preferences, retrieve it from API response
        String token = await LocalServices.getData(key: 'token');

        var response = await ApiServices.getData(
          token: token,
          endpoint: userDataendPoint,
        );
        userData = User.fromJson(response);

        // Save full name to shared preferences to local storage
        await LocalServices.saveData(
          key: 'name',
          value: userData!.data!.fullName,
        );
        fullName = userData!.data!.fullName;
        emit(GetUserDataSuccess(userData: userData!));
      }
    } catch (e) {
      if (e is DioException) {
        log(e.error.toString());
        emit(GetUserDataError(
          error: ServerFailure.fromDioException(e).errMessage.toString(),
        ));
      } else {
        log(e.toString());
        emit(GetUserDataError(
          error: ServerFailure(e.toString()).errMessage.toString(),
        ));
      }
    }
  }

  ClassfictionModel? classfictionModel;

  Future<void> classifyImage({required XFile image}) async {
    emit(UploadAndGetResponseToModelLoadingState());
    String token = await LocalServices.getData(key: 'token');

    try {
      final formData = FormData.fromMap({
        'file': await MultipartFile.fromFile(
          image.path,
          filename: image.path.split('/').last,
        ),
      });

      final headers = {
        "Authorization": "Bearer $token",
        "Content-Type": "multipart/form-data",
      };

      final response = await ApiServices.postData(
        endpoint: classifyendPoint,
        data: formData,
        options: Options(
          headers: headers,
        ),
      );

      classfictionModel = ClassfictionModel.fromJson(response);
      emit(UploadAndGetResponseToModelSucsesState(
          classfictionModel: classfictionModel!));
    } catch (e) {
      String errorMessage = 'Unknown error occurred'; // Default message
      if (e is DioException) {
        log(e.error.toString());
        errorMessage = ServerFailure.fromDioException(e).errMessage.toString();
      } else {
        log(e.toString());
        errorMessage = e.toString();
      }
      emit(UploadAndGetResponseToModelErrorState(errorMessage: errorMessage));
    }
  }
  //----------------------------------------------------------------

  XFile? image;

  Future<void> uploadImageFromGalleryModel(
      {required ImagePicker picker}) async {
    try {
      XFile? pickedFile = await picker.pickImage(source: ImageSource.gallery);

      if (pickedFile != null) {
        image = pickedFile;
        emit(UploadImageFromGallerySuccessState(image: image!));
      } else {
        emit(const UploadImageErrorState(errorMessage: "No image picked"));
      }
    } catch (e) {
      emit(UploadImageErrorState(errorMessage: e.toString()));
    }
  }

  Future<void> uploadImageFromCameraModel({required ImagePicker picker}) async {
    try {
      XFile? pickedFile = await picker.pickImage(source: ImageSource.gallery);

      if (pickedFile != null) {
        image = pickedFile;
        emit(UploadImageFromCameraSucsessState(image: image!));
      } else {
        emit(const UploadImageErrorState(errorMessage: "No image picked"));
      }
    } catch (e) {
      emit(UploadImageErrorState(errorMessage: e.toString()));
    }
  }
}
