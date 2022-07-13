import 'package:bliksy/App_Modules/Otp/View/OtpScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';

import '../../../Utils/Fonts/AppDimensions.dart';
import '../../../Utils/Fonts/AppFonts.dart';
import '../../../Utils/Paddings/AppBorderRadius.dart';
import '../../../Utils/Paddings/AppPaddings.dart';
import '../../../Utils/Themes/AppColors.dart';
import '../../../Utils/Widgets/AppButton.dart';
import '../../../Utils/Widgets/AppText.dart';
import '../../MyEarnings/ViewController/MyEarningScreen.dart';
import '../../dashboard_screen.dart';
import '../View/text_form_field.dart';


/*
class StepsWidgetClass extends StatefulWidget {
  const StepsWidgetClass({Key? key}) : super(key: key);

  @override
  State<StepsWidgetClass> createState() => _StepsWidgetClassState();
}

class _StepsWidgetClassState extends State<StepsWidgetClass> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  bool isSwitched = false;
  int currentStep = 0;
  bool isChecked = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stepper(
          type: StepperType.horizontal,
          steps: getSteps(),
          currentStep: currentStep,
          physics: BouncingScrollPhysics(),
          onStepContinue: () {
            final isLastStep = currentStep == getSteps().length - 1;
            if (isLastStep) {
              debugPrint('steps Completed');
              Get.to(()=> DashboardScreen());
              //Get.to(() => MyEarning());
            } else {
              setState(() => currentStep += 1);
            }
          },
          // onStepCancel:() => setState(()=> currentStep -=1),
        ),
      ),
    );
  }

  List<Step> getSteps() => [
    Step(
      isActive: currentStep >= 0,
      title: Text('-'),
      content: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Let\'s start with creating your\naccount'),
            SizedBox(
              height: Get.height * 0.02,
            ),
            textField(
                firstNameController, 'First Name', 'Enter your first name'),
            SizedBox(
              height: Get.height * 0.025,
            ),
            textField(
                lastNameController, 'Last Name', 'Enter your last name'),
            SizedBox(
              height: Get.height * 0.025,
            ),
            textField(emailNameController, 'Email Address',
                'Enter your email address',inputType: TextInputType.emailAddress),
            SizedBox(
              height: Get.height * 0.025,
            ),
            Container(
              height: Get.height * 0.08,
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5)),
              ),
              child: Card(
                child: textField(
                    phoneNumberController,
                    'Phone Number',
                    isShow: true,
                    'Enter your Phone Number',
                inputType: TextInputType.phone),
              ),
            ),
            SizedBox(
              height: Get.height * 0.025,
            ),
            textField(
                passwordController, 'Password', 'Enter your password'),
            SizedBox(
              height: Get.height * 0.025,
            ),
            textField(cityController, 'City', 'Enter your city'),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: Get.width * 0.7,
                  child: const Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                            text: 'by signing up, you are agree to our '),
                        TextSpan(
                          text: 'Terms & Condition',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        TextSpan(text: ' and!'),
                        TextSpan(
                          text: ' Privacy Policy',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
                const Spacer(),
                Switch(
                  value: isSwitched,
                  onChanged: (value) {
                    setState(() {
                      isSwitched = value;
                    });
                  },
                  activeColor: Colors.blue,
                  activeTrackColor: Colors.grey,
                ),
              ],
            ),
            *//*SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    child: const Text('Continue'),
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(primary: Colors.blue),
                  ),
                ),*//*
          ],
        ),
      ),
    ),
    Step(
      isActive: currentStep >= 1,
      title: Text('-'),
      content: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 30),
            child: AppText(
                text:
                'Enter the OTP code we send via SMS to \nyour registered phone number +31 (***) ****-***',
                fontFamily: 'Avenir',
                fontSize: AppDimensions.FONT_SIZE_14,
                fontWeight: FontWeights.medium),
          ),
          Container(
            width: Get.width / 1.4,
            child: OTPTextField(
              length: 5,
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
                print("Completed: " + pin);
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
                  text: 'Didn’t get the OTP?',
                  fontFamily: 'Avenir',
                  fontSize: AppDimensions.FONT_SIZE_16,
                  fontWeight: FontWeights.regular),
              SizedBox(
                width: Get.width * 0.015,
              ),
              AppText(
                  text: 'Resend',
                  fontFamily: 'Avenir',
                  fontSize: AppDimensions.FONT_SIZE_16,
                  textColor: AppColors.BLUE_COLOR,
                  fontWeight: FontWeights.regular),
            ],
          ),
          SizedBox(
            height: Get.height * 0.08,
          ),
          *//*Padding(
            padding: AppPaddings.horizontal,
            child: AppButton(
                buttonWidth: Get.width,
                buttonRadius: AppBorderRadius.BORDER_RADIUS_10,
                buttonName: 'Continue',
                textSize: AppDimensions.FONT_SIZE_16,
                fontFamily: 'Avenir',
                fontWeight: FontWeights.medium,
                buttonColor: AppColors.DISABLE_COLOR,
                textColor: AppColors.DARK_GREY_COLOR.withOpacity(0.8),
                onTap: () {
                  Get.to(() => MyEarning());
                }),
          )*//*
        ],
      ),
    ),
    Step(
      isActive: currentStep >= 2,
      title: Text('-'),
      content: Wrap(
        runSpacing: 10,
        spacing: 5,
        children: [
          Card(
            child: Container(
              width: Get.width * 0.4,
              height: Get.height * 0.2,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5),),

              ),
              alignment: Alignment.center,
              child: Icon(Icons.electric_bike,size: 50,),
            ),
          ),
          Card(
            child: Container(
              width: Get.width * 0.4,
              height: Get.height * 0.2,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5),),

              ),
              alignment: Alignment.center,
              child: Icon(Icons.electric_bike,size: 50,),
            ),
          ),
          Card(
            child: Container(
              width: Get.width * 0.4,
              height: Get.height * 0.2,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5),),

              ),
              alignment: Alignment.center,
              child: Icon(Icons.electric_bike,size: 50,),
            ),
          ),
          Card(
            child: Container(
              width: Get.width * 0.4,
              height: Get.height * 0.2,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5),),

              ),
              alignment: Alignment.center,
              child: Icon(Icons.electric_bike,size: 50,),
            ),
          ),
          Card(
            child: Container(
              width: Get.width * 0.4,
              height: Get.height * 0.2,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5),),

              ),
              alignment: Alignment.center,
              child: AppText(text: 'None of them',fontSize: 18,fontFamily: 'Avenir',fontWeight: FontWeights.medium),
            ),
          ),
        ],
      ),
    ),
    Step(
      isActive: currentStep >= 3,
      title: Text('-'),
      content: Column(
        children: [
          Card(
            child: Container(
              width: double.infinity,
              height: Get.height *0.25,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.all(Radius.circular(5),)
              ),
              padding: AppPaddings.defaultPadding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(text: 'Driver License Front',fontSize: AppDimensions.FONT_SIZE_22,fontFamily: 'Avenir'),
                  ListTile(
                    contentPadding: EdgeInsets.all(0),
                    minLeadingWidth: 0,
                    leading: Icon(Icons.person,size: 100,),
                    title: AppText(text: 'Name',fontSize: AppDimensions.FONT_SIZE_14,fontFamily: 'Avenir',
                    fontWeight: FontWeights.medium),
                    subtitle: AppText(text: 'ID',fontSize: AppDimensions.FONT_SIZE_12,fontFamily: 'Avenir',
                        fontWeight: FontWeights.medium),
                  )
                ],
              ),
            ),
          ),
          Card(
            child: Container(
              width: double.infinity,
              height: Get.height *0.25,
              decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.all(Radius.circular(5),)
              ),
              padding: AppPaddings.defaultPadding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(text: 'Driver License Back',fontSize: AppDimensions.FONT_SIZE_22,fontFamily: 'Avenir'),
                  ListTile(
                    contentPadding: EdgeInsets.all(0),
                    minLeadingWidth: 0,
                    leading: Icon(Icons.person,size: 100,),
                    title: AppText(text: 'Name',fontSize: AppDimensions.FONT_SIZE_14,fontFamily: 'Avenir',
                        fontWeight: FontWeights.medium),
                    subtitle: AppText(text: 'ID',fontSize: AppDimensions.FONT_SIZE_12,fontFamily: 'Avenir',
                        fontWeight: FontWeights.medium),
                  )
                ],
              ),
            ),
          ),

        ],
      ),
    ),
    //how did you hear about step
    Step(
      isActive: currentStep >= 4,
      title: Text('-'),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText(
              text: 'How did you hear about BLISKY',
              fontFamily: 'Avenir',
              fontSize: AppDimensions.FONT_SIZE_21,
              fontWeight: FontWeights.medium),
          SizedBox(
            height: Get.height * 0.05,
          ),
          CheckboxListTile(
            title: const Text('Social Media'),
            value: isChecked,
            onChanged: (bool? newValue) {
              setState(() {
                isChecked = newValue!;
              });
            },
            controlAffinity: ListTileControlAffinity.leading,
            activeColor: AppColors.BLUE_COLOR,
            checkColor: AppColors.SECONDRY_COLOR,
          ),
          SizedBox(
            height: Get.height * 0.02,
          ),
          CheckboxListTile(
            title: const Text('Website'),
            value: isChecked,
            onChanged: (bool? newValue) {
              setState(() {
                isChecked = newValue!;
              });
            },
            controlAffinity: ListTileControlAffinity.leading,
            activeColor: AppColors.BLUE_COLOR,
            checkColor: AppColors.SECONDRY_COLOR,
          ),
          SizedBox(
            height: Get.height * 0.02,
          ),
          CheckboxListTile(
            title:  Text('Via acquaitance\s'),
            value: isChecked,
            onChanged: (bool? newValue) {
              setState(() {
                isChecked = newValue!;
              });
            },
            controlAffinity: ListTileControlAffinity.leading,
            activeColor: AppColors.BLUE_COLOR,
            checkColor: AppColors.SECONDRY_COLOR,
          ),
          SizedBox(
            height: Get.height * 0.02,
          ),
          CheckboxListTile(
            title: const Text('Other'),
            value: isChecked,
            onChanged: (bool? newValue) {
              setState(() {
                isChecked = newValue!;
              });
            },
            controlAffinity: ListTileControlAffinity.leading,
            activeColor: AppColors.BLUE_COLOR,
            checkColor: AppColors.SECONDRY_COLOR,
          ),
        ],
      ),
    ),

  ];
}



class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {

    TextEditingController firstNameController = TextEditingController();
    TextEditingController lastNameController = TextEditingController();
    TextEditingController emailNameController = TextEditingController();
    TextEditingController phoneNumberController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController cityController = TextEditingController();
    bool isSwitched = false;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'Create Account',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Let\'s start with creating your\naccount'),
              SizedBox(
                height: Get.height * 0.02,
              ),
              textField(
                  firstNameController, 'First Name', 'Enter your first name'),
              SizedBox(
                height: Get.height * 0.025,
              ),
              textField(
                  lastNameController, 'Last Name', 'Enter your last name'),
              SizedBox(
                height: Get.height * 0.025,
              ),
              textField(emailNameController, 'Email Address',
                  'Enter your email address',inputType: TextInputType.emailAddress),
              SizedBox(
                height: Get.height * 0.025,
              ),
              Container(
                height: Get.height * 0.08,
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
                child: Card(
                  child: textField(
                      phoneNumberController,
                      'Phone Number',
                      isShow: true,
                      'Enter your Phone Number',
                      inputType: TextInputType.phone),
                ),
              ),
              SizedBox(
                height: Get.height * 0.025,
              ),
              textField(
                  passwordController, 'Password', 'Enter your password'),
              SizedBox(
                height: Get.height * 0.025,
              ),
              textField(cityController, 'City', 'Enter your city'),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: Get.width * 0.7,
                    child: const Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                              text: 'by signing up, you are agree to our '),
                          TextSpan(
                            text: 'Terms & Condition',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          TextSpan(text: ' and!'),
                          TextSpan(
                            text: ' Privacy Policy',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Spacer(),
                  Switch(
                    value: isSwitched,
                    onChanged: (value) {
                      setState(() {
                        isSwitched = value;
                      });
                    },
                    activeColor: Colors.blue,
                    activeTrackColor: Colors.grey,
                  ),
                ],
              ),
              *//*SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    child: const Text('Continue'),
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(primary: Colors.blue),
                  ),
                ),*//*
            ],
          ),
        ),
      ),
    );
  }
}*/





