import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:greanleaf/shared/networking/local_services.dart';

String? usertoken;
bool? onBording;

String? fullname;
String geminiBASEURL = 'https://generativelanguage.googleapis.com/v1beta';

Future<Map<String, dynamic>> fetchDataFromLocalStorage() async {
  onBording = await LocalServices.getData(key: 'onbording');
  usertoken = await LocalServices.getData(key: 'token');
  fullname = await LocalServices.getData(key: 'name');
  log('UserToken : $usertoken');
  log('onBording : $onBording');
  log('name : $fullname');

  return {'onBording': onBording, 'token': usertoken};
}

void showCustomSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
    ),
  );
}
