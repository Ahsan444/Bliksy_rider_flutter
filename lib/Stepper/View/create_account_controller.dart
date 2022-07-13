import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class CreateAccountController extends GetxController {
  var firstNameController = TextEditingController();
  var emailNameController = TextEditingController();
  var phoneNumberController = TextEditingController();
  var dobController = TextEditingController();
  var addressController = TextEditingController();
  var passwordController = TextEditingController();
  var driverLicenseController = TextEditingController();
  var countryCode = '+31';
  var phoneNumber;
  final String phoneNumberPattern = 'no num';
  var isLoading = false.obs;
   Dio dio = Dio();
  static const baseUrl = 'http://192.168.0.47:8000/api/register';
  var response;

}
