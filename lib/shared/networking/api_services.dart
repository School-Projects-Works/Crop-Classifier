import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:greanleaf/shared/networking/end_boint.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../bloc_observer.dart.dart';
import '../../firebase_options.dart';
import '../helper/helper_const.dart';
import 'local_services.dart';

class ApiServices {
  static Dio? _dio;

  static init() async{
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    await LocalServices.init();
    Bloc.observer = MyBlocObserver();
    //ApiServices.init();
    fetchDataFromLocalStorage();
    // _dio = Dio(
    //   BaseOptions(
    //     baseUrl: baseUrl,
    //     receiveDataWhenStatusError: true,
    //   ),
    // );
  }

  static Future<Map<String, dynamic>> postData(
      {required String endpoint,
      required Object? data,
      String? token,
      Options? options}) async {
    CollectionReference collection = FirebaseFirestore.instance.collection(endpoint);
    await collection.add(data);
    return data as Map<String, dynamic>;

    // _dio?.options.headers = {
    //   'Authorization': 'Bearer $token',
    //   'Content-Type': 'application/json',
    // };
    // var response = await _dio!.post(endpoint, data: data, options: options);
    // return response.data;
  }

  static Future<Map<String, dynamic>> postFormData({
    required String endpoint,
    required Map<String,dynamic> formData,
    String? token,
  }) async {
    CollectionReference collection = FirebaseFirestore.instance.collection(endpoint);
    await collection.add(formData);
    return formData;
    // _dio?.options.headers = {
    //   'Authorization': 'Bearer $token',
    //   'Content-Type': 'multipart/form-data',
    // };
    // var response = await _dio!.post(
    //   endpoint,
    //   data: formData,
    // );
    // return response.data;
  }

  static Future<Map<String, dynamic>> getData({
    required String endpoint,
    Map<String, String>? data,
    String? token,
    Map<String, dynamic>? queryParameters,
  }) async {
    CollectionReference collection = FirebaseFirestore.instance.collection(endpoint);
    var data = await collection.get();
    return data.docs.first.data() as Map<String, dynamic>;

    // _dio!.options.headers = {
    //   'Content-Type': 'application/json',
    //   'Accept': 'application/json',
    //   'Authorization': 'Bearer $token',
    // };
    //
    // var response = await _dio!.get(
    //   endpoint,
    //   queryParameters: queryParameters,
    //   data: data,
    // );
    // return response.data;
  }
}
