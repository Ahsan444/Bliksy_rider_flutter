import 'dart:io';
import 'package:bliksy/App_Modules/Otp/ViewController/otp_controller.dart';
import 'package:bliksy/App_Modules/dashboard_screen.dart';
import 'package:bliksy/Stepper/Model/driver_sign_up_model.dart';
import 'package:bliksy/Stepper/View/create_account_controller.dart';
import 'package:bliksy/Utils/Widgets/app_loader.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:dio/dio.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../App_Modules/BottomNavigation/MyOrder/ViewController/order_screen.dart';
import '../../App_Modules/Login/View/LoginScreen.dart';
import '../../App_Modules/Signup/View/text_form_field.dart';
import '../../Utils/Fonts/AppDimensions.dart';
import '../../Utils/Fonts/AppFonts.dart';
import '../../Utils/Paddings/AppBorderRadius.dart';
import '../../Utils/Paddings/AppPaddings.dart';
import '../../Utils/Themes/AppColors.dart';
import '../../Utils/Widgets/AppButton.dart';
import '../../Utils/Widgets/AppText.dart';

enum ReferenceCharacter { socialMedia, website, viaacquaitances, other }

var box = GetStorage();


class StepperScreen extends StatefulWidget {
  const StepperScreen({Key? key}) : super(key: key);

  @override
  _StepperScreenState createState() => _StepperScreenState();
}

class _StepperScreenState extends State<StepperScreen> {
  bool isSwitched = false;
  bool isChecked = false;
  int value = 0;
  bool isShow = false;
  ReferenceCharacter? _character = ReferenceCharacter.socialMedia;
  final otpController = Get.put(OtpFieldController());
  final permissionController = Get.put(OtpController());
  List list = [];

  // final ImagePicker _picker = ImagePicker();
  // XFile? image;
  final controller = Get.put(CreateAccountController());

  //TextEditingController dobController = TextEditingController();
  DriverSignUpModel driverSignModel = DriverSignUpModel();
  var userId;
  Dio dio = Dio();
  static const baseUrl = 'http://192.168.0.47:8000/api/register';
  var response;
  var otpID;
  var otpTextField;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: Get.height,
        width: Get.width,
        color: AppColors.WHITE_COLOR,
        child: Column(
          children: [
            Container(
              height: Get.height / 8,
              padding: AppPaddings.defaultPadding,
              decoration: BoxDecoration(color: AppColors.WHITE_COLOR),
              // padding: AppPaddings.defaultPadding,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                      child: CircleAvatar(
                        radius: 18,
                        backgroundColor: AppColors.BLUE_COLOR.withOpacity(0.5),
                        child: Icon(
                          Icons.chevron_left,
                          color: AppColors.BLACK_COLOR,
                        ),
                      ),
                      onTap: () {
                        if (value == 0) {
                          Get.to(() => LoginScreen());
                        } else if (value < 4) {
                          setState(() {
                            value--;
                          });
                        }
                      }
                      /*(){
                      Get.to(() => LoginScreen());
                    },*/
                      ),
                  SizedBox(
                    width: Get.width * 0.023,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: AppText(
                        text: 'createAnAccountTxt',
                        fontFamily: Weights.medium,
                        fontSize: AppDimensions.FONT_SIZE_18,
                        fontWeight: FontWeights.bold),
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Padding(
                  padding: AppPaddings.horizontal,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(bottom: 16),
                        child: AppText(
                            text: 'stepsTxt'.tr + ' ${value + 1} ',
                            fontSize: AppDimensions.FONT_SIZE_18,
                            fontWeight: FontWeights.medium),
                      ),

                      Container(
                        height: 5,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                          color: AppColors.LIGHT_BLUE_COLOR.withOpacity(0.1),
                        ),
                        child: ListView.builder(
                            itemCount: 5,
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, int index) {
                              return Container(
                                width: Get.width / 5,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(0),
                                        bottomRight: Radius.circular(0)),
                                    color: index <= value
                                        ? AppColors.LIGHT_BLUE_COLOR
                                        : Colors.transparent),
                              );
                            }),
                      ),
                      //-----------------------step ONE --------------
                      value == 0 ? valueOne() : SizedBox.shrink(),
                      //-----------------------step TWO --------------
                      value == 1 ? valueTwo(context) : SizedBox.shrink(),
                      //-----------------------step THREE -------------
                      value == 2 ? valueThree() : SizedBox.shrink(),
                      //-----------------------step FOUR --------------
                      value == 3 ? valueFour() : SizedBox.shrink(),
                      //-----------------------step FIVE --------------
                      value == 4 ? valueFive() : SizedBox.shrink(),
                      /*ElevatedButton(
                    onPressed: value < 4 ? (){
                      setState((){
                        value++;
                      });
                    }: () {

                    },
                    child: Text('continue'),
                    )*/
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Column valueOne() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        textFields(
            controller.firstNameController, 'fullNameTxt'.tr, 'fullNameTxt'.tr,
            image: 'assets/images/person_one.png', height: 1, width: 1),
        Padding(
          padding: AppPaddings.vertical,
          child: textFields(
            controller.emailNameController,
            'emailTxt'.tr,
            'emailTxt'.tr,
            image: 'assets/images/email_one.png',
          ),
        ),
        //phone field
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                AppText(
                  text: 'phoneNumb'.tr,
                  textColor: AppColors.BLACK_COLOR,
                  fontSize: AppDimensions.FONT_SIZE_14,
                ),
                SizedBox(
                  width: Get.width * 0.015,
                ),
                Column(
                  children: [
                    AppText(text: '*', textColor: AppColors.RED_COLOR),
                    SizedBox(
                      height: Get.height * 0.01,
                    ),
                  ],
                ),
              ],
            ),
            Container(
              height: Get.height * 0.062,
              width: Get.width,
              decoration: BoxDecoration(
                  border: Border.all(color: AppColors.BLACK_COLOR, width: .5),
                  borderRadius: AppBorderRadius.BORDER_RADIUS_10),
              child: Row(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                        border: Border(bottom: BorderSide.none)),
                    child: CountryCodePicker(
                      showFlag: false,
                      initialSelection: '+31',
                      onChanged: (value) {
                        controller.countryCode = value.toString();
                        debugPrint('country code: ${controller.countryCode}');
                      },
                      dialogTextStyle: const TextStyle(
                        fontSize: AppDimensions.FONT_SIZE_16,
                      ),
                      textStyle: TextStyle(
                        fontSize: AppDimensions.FONT_SIZE_15,
                        color: AppColors.LIGHT_GREY_COLOR,
                        fontFamily: Weights.bold,
                      ),
                      padding: EdgeInsets.zero,
                      showCountryOnly: false,
                      showOnlyCountryWhenClosed: false,
                      alignLeft: false,
                    ),
                  ),
                  VerticalDivider(thickness: .5, color: AppColors.BLACK_COLOR),
                  SizedBox(
                    width: Get.width * 0.01,
                  ),
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 16),
                      child: Container(
                        decoration: const BoxDecoration(
                          border: Border(
                              top: BorderSide.none, bottom: BorderSide.none),
                        ),
                        child: TextField(
                          cursorColor: AppColors.DARK_GREY_COLOR,
                          controller: controller.phoneNumberController,
                          decoration: InputDecoration(
                            hintText: 'phoneNumb'.tr,
                            hintStyle: TextStyle(
                              color: AppColors.LIGHT_GREY_COLOR,
                              fontFamily: Weights.bold,
                            ),
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                          ),
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        Padding(
          padding: AppPaddings.vertical,
          child: textFields(
            controller.dobController,
            'dob'.tr,
            '11/11/2022',
            image: "assets/images/calender_one.png",
            height: 1,
            imgHeight: 6,
            isReadOnly: true,
            onTap: () async {
              DateTime? date = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2101));
              if (date != null) {
                setState(() {
                  controller.dobController.text =
                      '${date.day}/${date.month}/${date.year}';
                  debugPrint('date is: ${controller.dobController.value.text}');
                });
              } else {
                controller.dobController.text = 'Date is not selected';
              }
            },
          ),
        ),

        textFields(
          controller.addressController,
          'city'.tr,
          'cityName'.tr,
          image: 'assets/images/loc_one.png',
          imgHeight: 6,
        ),
        Padding(
          padding: AppPaddings.vertical,
          child: textFields(
            controller.passwordController,
            'password'.tr,
            'passwordTxt'.tr,
            image: "assets/images/pass_one.png",
          ),
        ),
        //button code
        AppButton(
            buttonName: 'continueTxt'.tr,
            fontFamily: Weights.light,
            buttonColor: AppColors.BLUE_COLOR,
            textColor: AppColors.WHITE_COLOR,
            buttonWidth: Get.width,
            buttonRadius: BorderRadius.all(Radius.circular(10)),
            onTap: value < 4
                ? () async {
                    if (controller.firstNameController.text.isEmpty ||
                        controller.emailNameController.text.isEmpty ||
                        controller.passwordController.text.isEmpty ||
                        controller.addressController.text.isEmpty ||
                        controller.dobController.text.isEmpty ||
                        controller.phoneNumberController.text.isEmpty) {
                      Get.snackbar(
                        'Alert',
                        'All fields are required',
                        backgroundColor: AppColors.BLACK_COLOR,
                        colorText: AppColors.WHITE_COLOR,
                        snackPosition: SnackPosition.TOP,
                        duration: Duration(seconds: 2),
                      );
                    } else {
                     // appLoader(context, AppColors.PRIMARY_COLOR);
                      controller.phoneNumber =
                          '${controller.countryCode}${controller.phoneNumberController.text}';
                      setState(() {
                        value++;
                      });

                      //firebase phone number verification method
                   /*   await FirebaseAuth.instance.verifyPhoneNumber(
                        phoneNumber: controller.phoneNumber,
                        codeSent: (otpID, resendToken) {
                          box.write('otpID', otpID);
                          Get.back();
                          //move to next step

                        },
                        verificationCompleted:
                            (PhoneAuthCredential credential) async {
                          debugPrint('code send');
                        },
                        verificationFailed: (ex) {
                          Get.back();
                          debugPrint('login error');
                          Get.snackbar('Alert', 'Invalid number',
                              backgroundColor: AppColors.BLACK_COLOR,
                              colorText: AppColors.WHITE_COLOR);

                        },
                        codeAutoRetrievalTimeout: (verificationId) {},
                        timeout: const Duration(seconds: 60),
                      );*/
                    }
                  }
                : () {}),
      ],
    );
  }

  Column valueTwo(BuildContext context) {
    return Column(
      children: [
        Column(
          children: [
            Padding(
              padding: AppPaddings.defaultPadding,
              child: AppText(
                  text: 'enterOtpTxt'.tr + ' +31 (***) ****-***',
                  fontFamily: Weights.light,
                  fontSize: AppDimensions.FONT_SIZE_14,
                  fontWeight: FontWeights.medium),
            ),
            Container(
              width: Get.width / 1.1,
              child: OTPTextField(
                length: 6,
                otpFieldStyle: OtpFieldStyle(
                    borderColor: AppColors.GREY_COLOR,
                    focusBorderColor: AppColors.GREY_COLOR),
                width: MediaQuery.of(context).size.width,
                fieldWidth: 50,
                style: const TextStyle(fontSize: 20),
                outlineBorderRadius: 10,
                textFieldAlignment: MainAxisAlignment.spaceAround,
                fieldStyle: FieldStyle.box,
                onCompleted: (pin) {
                  setState(() {
                    isShow = true;
                  });
                  print("Completed: " + pin);
                },
                onChanged: (val) {
                  otpTextField = val;
                  //print("Changed: " + pin);
                },
              ),
            ),
            SizedBox(
              height: Get.height * 0.02,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppText(
                    text: 'didNotGetOtp',
                    fontFamily: 'Avenir',
                    fontSize: AppDimensions.FONT_SIZE_16,
                    fontWeight: FontWeights.regular),
                SizedBox(
                  width: Get.width * 0.015,
                ),
                AppText(
                    text: 'resend',
                    fontFamily: 'Avenir',
                    fontSize: AppDimensions.FONT_SIZE_16,
                    textColor: AppColors.BLUE_COLOR,
                    fontWeight: FontWeights.regular),
              ],
            ),
          ],
        ),
        // Spacer(flex: 1,),
        SizedBox(
          height: Get.height * 0.54,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //back button
            AppButton(
              buttonWidth: Get.width * 0.3,
              buttonRadius: AppBorderRadius.BORDER_RADIUS_10,
              buttonName: 'backText'.tr,
              textSize: AppDimensions.FONT_SIZE_16,
              fontFamily: 'Avenir',
              fontWeight: FontWeights.medium,
              buttonColor: AppColors.TRANSPARENT_COLOR,
              borderWidth: 1,
              borderColor: AppColors.BLUE_COLOR,
              textColor: AppColors.BLUE_COLOR,
              onTap: value < 4
                  ? () {
                      setState(() {
                        value--;
                      });
                    }
                  : () {},
            ),
            SizedBox(
              width: Get.width * 0.02,
            ),
            //continue button
            Expanded(
              child: AppButton(
                buttonRadius: AppBorderRadius.BORDER_RADIUS_10,
                buttonName: 'continueTxt'.tr,
                textSize: AppDimensions.FONT_SIZE_16,
                fontFamily: 'Avenir',
                fontWeight: FontWeights.medium,
                buttonColor:
                    isShow ? AppColors.BLUE_COLOR : AppColors.DISABLE_COLOR,
                textColor: isShow
                    ? AppColors.WHITE_COLOR
                    : AppColors.DARK_GREY_COLOR.withOpacity(0.8),
                onTap: value < 4
                    ? () async {

                  setState(() {
                    value++;
                  });

                       /* try {
                          appLoader(context, AppColors.PRIMARY_COLOR);
                          PhoneAuthCredential credential =
                          PhoneAuthProvider.credential(
                              verificationId: box.read('otpID'),
                              smsCode: otpTextField);


                        } on FirebaseAuthException catch (ex) {
                          Get.back();
                          Get.snackbar('Alert', 'Invalid OTP',
                              backgroundColor: AppColors.BLACK_COLOR,
                              colorText: AppColors.WHITE_COLOR);
                          debugPrint('otp wrong ${ex.code}');
                        }  on DioError catch (e) {
                          debugPrint('error while posting: $e');
                        }*/

                      }
                    : () {},
              ),
            ),
          ],
        )
      ],
    );
  }

  Column valueThree() {
    return Column(
      children: [
        GridView.builder(
            physics: const BouncingScrollPhysics(),
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: Get.height * 0.2,
                mainAxisExtent: Get.height * 0.2,
                mainAxisSpacing: 50,
                crossAxisSpacing: 50),
            shrinkWrap: true,
            // primary: true,
            itemCount: 4,
            itemBuilder: (BuildContext context, index) {
              // int value = index
              return InkWell(
                onTap: () {
                  if (list.contains(index)) {
                    setState(() {
                      list.remove(index);
                    });
                  } else {
                    setState(() {
                      list.add(index);
                    });
                  }
                },
                child: DottedBorder(
                  borderType: BorderType.RRect,
                  radius: Radius.circular(10),
                  dashPattern: [10, 10],
                  color: AppColors.LIGHT_GREY_COLOR,
                  strokeWidth: 2,
                  child: Card(
                    elevation: 0,
                    color: list.contains(index)
                        ? AppColors.BLUE_COLOR
                        : AppColors.WHITE_COLOR,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: AppPaddings.defaultPadding,
                      child: Center(
                          child: SvgPicture.asset(
                        'assets/images/car_img.svg',
                        height: Get.height,
                        color: list.contains(index)
                            ? AppColors.WHITE_COLOR
                            : AppColors.LIGHT_GREY_COLOR,
                      )),
                    ),
                  ),
                ),
              );
            }),
        SizedBox(
          height: Get.height * 0.215,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //back button
            AppButton(
              buttonWidth: Get.width * 0.3,
              buttonRadius: AppBorderRadius.BORDER_RADIUS_10,
              buttonName: 'backText'.tr,
              textSize: AppDimensions.FONT_SIZE_16,
              fontFamily: 'Avenir',
              fontWeight: FontWeights.medium,
              buttonColor: AppColors.TRANSPARENT_COLOR,
              borderWidth: 1,
              borderColor: AppColors.BLUE_COLOR,
              textColor: AppColors.BLUE_COLOR,
              onTap: value < 4
                  ? () {
                      setState(() {
                        value--;
                      });
                    }
                  : () {},
            ),
            SizedBox(
              width: Get.width * 0.02,
            ),
            //continue button
            Expanded(
              child: AppButton(
                buttonRadius: AppBorderRadius.BORDER_RADIUS_10,
                buttonName: 'continueTxt'.tr,
                textSize: AppDimensions.FONT_SIZE_16,
                fontFamily: 'Avenir',
                fontWeight: FontWeights.medium,
                buttonColor: list.length > 0
                    ? AppColors.BLUE_COLOR
                    : AppColors.DISABLE_COLOR,
                textColor: list.length > 0
                    ? AppColors.WHITE_COLOR
                    : AppColors.DARK_GREY_COLOR.withOpacity(0.8),
                onTap: value < 4
                    ? () {
                        setState(() {
                          if (list.length > 0) {
                            value++;
                          } else {
                            Get.snackbar('Alert', 'Please select atleast one',
                                backgroundColor: AppColors.BLACK_COLOR,
                                colorText: AppColors.WHITE_COLOR);
                            print('please select one');
                          }
                        });
                      }
                    : () {},
              ),
            ),
          ],
        ),
      ],
    );
  }

  Column valueFour() {
    return Column(
      children: [
        Padding(
          padding: AppPaddings.vertical,
          child: textFields(controller.driverLicenseController,
              'drivingLicenseTxt'.tr, 'D1NLD00000000000',
              image: 'assets/images/person_one.png'),
        ),
        Row(
          children: [
            AppText(
              text: 'drivingLicensImg',
              textColor: AppColors.BLACK_COLOR,
              fontSize: AppDimensions.FONT_SIZE_14,
            ),
            SizedBox(
              width: Get.width * 0.015,
            ),
            Column(
              children: [
                AppText(text: '*', textColor: AppColors.RED_COLOR),
                SizedBox(
                  height: Get.height * 0.01,
                ),
              ],
            ),
          ],
        ),
        Obx(() {
          return orderController.selectedImagePath.value == ''
              ? InkWell(
                  child: SvgPicture.asset(
                    'assets/images/driver_license.svg',
                    width: Get.width,
                  ),
                  onTap: () async {
                    showModalBottomSheet(
                        context: context,
                        builder: (BuildContext bc) {
                          return SafeArea(
                            child: Container(
                              color: AppColors.WHITE_COLOR,
                              child: Wrap(
                                children: <Widget>[
                                  ListTile(
                                    leading: Icon(Icons.photo_camera),
                                    title: AppText(
                                        text: 'Camera',
                                        fontFamily: Weights.light,
                                        fontSize: AppDimensions.FONT_SIZE_18),
                                    onTap: () async {
                                      orderController
                                          .getImage(ImageSource.camera);
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                  ListTile(
                                      leading: Icon(Icons.photo_library),
                                      title: AppText(
                                          text: 'Gallery',
                                          fontFamily: Weights.light,
                                          fontSize: AppDimensions.FONT_SIZE_18),
                                      onTap: () async {
                                        orderController
                                            .getImage(ImageSource.gallery);

                                        Navigator.of(context).pop();
                                      }),
                                  SizedBox(
                                    height: Get.height * 0.1,
                                  )
                                ],
                              ),
                            ),
                          );
                        });
                  },
                )
              : Container(
                  width: Get.width,
                  height: Get.height * 0.235,
                  decoration: BoxDecoration(
                    color: AppColors.GREY_COLOR.withOpacity(0.5),
                    borderRadius: AppBorderRadius.BORDER_RADIUS_10,
                  ),
                  child: Image.file(
                    File(orderController.selectedImagePath.value),
                    fit: BoxFit.fitWidth,
                  ),
                );
        }),
        Row(
          children: [
            AppText(
              text: 'drivingLicensImg',
              textColor: AppColors.BLACK_COLOR,
              fontSize: AppDimensions.FONT_SIZE_14,
            ),
            SizedBox(
              width: Get.width * 0.015,
            ),
            Column(
              children: [
                AppText(text: '*', textColor: AppColors.RED_COLOR),
                SizedBox(
                  height: Get.height * 0.01,
                ),
              ],
            ),
          ],
        ),
        Obx(() {
          return orderController.selectedImagePath2.value == ''
              ? InkWell(
                  child: SvgPicture.asset(
                    'assets/images/driver_license_back.svg',
                    width: Get.width,
                  ),
                  onTap: () async {
                    showModalBottomSheet(
                        context: context,
                        builder: (BuildContext bc) {
                          return SafeArea(
                            child: Container(
                              child: Wrap(
                                children: <Widget>[
                                  ListTile(
                                    leading: Icon(Icons.photo_camera),
                                    title: AppText(
                                        text: 'Camera',
                                        fontFamily: Weights.light,
                                        fontSize: AppDimensions.FONT_SIZE_18),
                                    onTap: () async {
                                      orderController
                                          .getImage2(ImageSource.camera);
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                  ListTile(
                                      leading: Icon(Icons.photo_library),
                                      title: AppText(
                                          text: 'Gallery',
                                          fontFamily: Weights.light,
                                          fontSize: AppDimensions.FONT_SIZE_18),
                                      onTap: () async {
                                        orderController
                                            .getImage2(ImageSource.gallery);

                                        Navigator.of(context).pop();
                                      }),
                                  SizedBox(
                                    height: Get.height * 0.1,
                                  )
                                ],
                              ),
                            ),
                          );
                        });
                  },
                )
              : Container(
                  width: Get.width,
                  height: Get.height * 0.235,
                  decoration: BoxDecoration(
                    color: AppColors.GREY_COLOR.withOpacity(0.5),
                    borderRadius: AppBorderRadius.BORDER_RADIUS_10,
                  ),
                  child: Image.file(
                    File(orderController.selectedImagePath2.value),
                    fit: BoxFit.fitWidth,
                  ),
                );
        }),
        SizedBox(
          height: Get.height * 0.03,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //back button
            AppButton(
              buttonWidth: Get.width * 0.3,
              buttonRadius: AppBorderRadius.BORDER_RADIUS_10,
              buttonName: 'backText'.tr,
              textSize: AppDimensions.FONT_SIZE_16,
              fontFamily: 'Avenir',
              fontWeight: FontWeights.medium,
              buttonColor: AppColors.TRANSPARENT_COLOR,
              borderWidth: 1,
              borderColor: AppColors.BLUE_COLOR,
              textColor: AppColors.BLUE_COLOR,
              onTap: value < 4
                  ? () {
                      setState(() {
                        value--;
                      });
                    }
                  : () {},
            ),
            SizedBox(
              width: Get.width * 0.02,
            ),
            //continue button
            Expanded(child: Obx(
              () {
                return AppButton(
                  buttonRadius: AppBorderRadius.BORDER_RADIUS_10,
                  buttonName: 'continueTxt'.tr,
                  textSize: AppDimensions.FONT_SIZE_16,
                  fontFamily: 'Avenir',
                  fontWeight: FontWeights.medium,
                  buttonColor: orderController.selectedImagePath2.value == ''
                      ? AppColors.DISABLE_COLOR
                      : AppColors.BLUE_COLOR,
                  textColor: orderController.selectedImagePath2.value == ''
                      ? AppColors.DARK_GREY_COLOR.withOpacity(0.8)
                      : AppColors.WHITE_COLOR,
                  onTap: value < 4
                      ? () {
                          setState(() {
                            value++;
                          });
                        }
                      : () {},
                );
              },
            )),
          ],
        ),
      ],
    );
  }

  Column valueFive() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: AppPaddings.vertical,
          child: AppText(
              text: 'hereAboutBliksyTxt',
              fontFamily: 'Avenir',
              fontSize: AppDimensions.FONT_SIZE_21,
              fontWeight: FontWeights.medium),
        ),
        //Radio list tiles'
        RadioListTile<ReferenceCharacter>(
          title: AppText(
              text: 'socialMediaTxt',
              fontSize: AppDimensions.FONT_SIZE_14,
              fontFamily: Weights.light),
          activeColor: AppColors.BLUE_COLOR,
          value: ReferenceCharacter.socialMedia,
          contentPadding: EdgeInsets.all(0),
          groupValue: _character,
          onChanged: (ReferenceCharacter? value) {
            setState(() {
              _character = value;
            });
          },
          visualDensity: VisualDensity(vertical: VisualDensity.minimumDensity),
        ),

        RadioListTile<ReferenceCharacter>(
          title: AppText(
              text: 'websiteTxt',
              fontSize: AppDimensions.FONT_SIZE_14,
              fontFamily: Weights.light),
          value: ReferenceCharacter.website,
          activeColor: AppColors.BLUE_COLOR,
          contentPadding: EdgeInsets.all(0),
          groupValue: _character,
          onChanged: (ReferenceCharacter? value) {
            setState(() {
              _character = value;
            });
          },
          visualDensity: VisualDensity(vertical: VisualDensity.minimumDensity),
        ),

        RadioListTile<ReferenceCharacter>(
          title: AppText(
              text: 'viaAqTxt',
              fontSize: AppDimensions.FONT_SIZE_14,
              fontFamily: Weights.light),
          value: ReferenceCharacter.viaacquaitances,
          activeColor: AppColors.BLUE_COLOR,
          contentPadding: EdgeInsets.all(0),
          groupValue: _character,
          onChanged: (ReferenceCharacter? value) {
            setState(() {
              _character = value;
            });
          },
          visualDensity: VisualDensity(vertical: VisualDensity.minimumDensity),
        ),

        RadioListTile<ReferenceCharacter>(
          title: AppText(
              text: 'otherTxt',
              fontSize: AppDimensions.FONT_SIZE_14,
              fontFamily: Weights.light),
          value: ReferenceCharacter.other,
          activeColor: AppColors.BLUE_COLOR,
          contentPadding: EdgeInsets.all(0),
          groupValue: _character,
          onChanged: (ReferenceCharacter? value) {
            setState(() {
              _character = value;
            });
          },
          visualDensity: VisualDensity(vertical: VisualDensity.minimumDensity),
        ),
        //button code here

        SizedBox(
          height: Get.height * 0.46,
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            //back button
            AppButton(
              buttonWidth: Get.width * 0.3,
              buttonRadius: AppBorderRadius.BORDER_RADIUS_10,
              buttonName: 'backText'.tr,
              textSize: AppDimensions.FONT_SIZE_16,
              fontFamily: 'Avenir',
              fontWeight: FontWeights.medium,
              buttonColor: AppColors.TRANSPARENT_COLOR,
              borderWidth: 1,
              borderColor: AppColors.BLUE_COLOR,
              textColor: AppColors.BLUE_COLOR,
              onTap: value < 5
                  ? () {
                      setState(() {
                        value--;
                      });
                    }
                  : () {},
            ),
            SizedBox(
              width: Get.width * 0.02,
            ),
            //continue button
            Expanded(
              child: AppButton(
                buttonRadius: AppBorderRadius.BORDER_RADIUS_10,
                buttonName: 'continueTxt'.tr,
                textSize: AppDimensions.FONT_SIZE_16,
                fontFamily: 'Avenir',
                fontWeight: FontWeights.medium,
                buttonColor: AppColors.DISABLE_COLOR,
                textColor: AppColors.DARK_GREY_COLOR.withOpacity(0.8),
                onTap: () {

                  if (_character == null) {
                    Get.snackbar('Alert', 'Please select atleast one',
                        backgroundColor: AppColors.BLACK_COLOR,
                        colorText: AppColors.WHITE_COLOR);
                  } else {
                    permissionController.checkLocationPermission(context);
                }

                  // Get.to(
                  //   () => DashboardScreen(),
                  // );
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}
