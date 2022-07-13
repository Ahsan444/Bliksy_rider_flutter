import 'dart:io';
import 'package:bliksy/App_Modules/BottomNavigation/MyOrder/View/bottomSheet_0.dart';
import 'package:bliksy/App_Modules/BottomNavigation/MyOrder/View/order_controller.dart';
import 'package:bliksy/App_Modules/BottomNavigation/MyOrder/View/order_detail_controller.dart';
import 'package:bliksy/App_Modules/dashboard_screen.dart';
import 'package:bliksy/Localization/save_locale.dart';
import 'package:bliksy/Utils/Fonts/AppDimensions.dart';
import 'package:bliksy/Utils/Fonts/AppFonts.dart';
import 'package:bliksy/Utils/Paddings/AppBorderRadius.dart';
import 'package:bliksy/Utils/Paddings/AppPaddings.dart';
import 'package:bliksy/Utils/Themes/AppColors.dart';
import 'package:bliksy/Utils/Widgets/AppText.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../Utils/Widgets/AppButton.dart';
import '../View/bottom_sheet1.dart';
import '../View/bottom_sheet2.dart';
import '../View/cancel_order_controller.dart';

final orderController = Get.put(OrderController());
final orderDetailController = Get.put(OrderDetailController());

class OrderScreen extends StatefulWidget {



   OrderScreen({Key? key,}) : super(key: key);

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
   GoogleMapController? goController;
  String? _mapStyle;
  String googleApikey = "AIzaSyCpv6Gof2kZtntXXkzVslAz-40RcYP3Vbo";
  CameraPosition? cameraPosition;
  late Position currentLocation;
  final cancelOrderController = Get.put(CancelOrderController());


  //final int value = 0;

  var number = '+1-555-010-999';

  void locationPosition() async {
   // await Geolocator.checkPermission();
   // await Geolocator.requestPermission();
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    currentLocation = position;
    LatLng latlatPostion = LatLng(position.latitude, position.longitude);
    CameraPosition cameraPositin =
    new CameraPosition(target: latlatPostion, zoom: 14);
    goController?.animateCamera(CameraUpdate.newCameraPosition(cameraPositin));

  }

  @override
  void initState() {
    orderController.indexValue.value = 0;

    locationPosition();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      bottomSheet: Container(
        height: Get.height * 0.56,
        color: Colors.white.withOpacity(0.2),
        child: ListView(
          // controller: scrollController,
          children: [
            Obx(() {
              return Column(
                children: [
                  //--------------sheet 0 ---------
                  orderController.indexValue == 0
                      ? BottomSheet0()
                      : SizedBox.shrink(),
                  //--------------sheet 1 ---------
                  orderController.indexValue == 1
                      ? BottomSheet1()
                      : SizedBox.shrink(),
                  //--------------sheet 2 ---------
                  orderController.indexValue == 2
                      ? BottomSheet2()
                      : SizedBox.shrink(),
                  //--------------sheet 3 ---------
                  orderController.indexValue == 3
                      ? Column(
                    children: [
                      Container(
                        color: AppColors.WHITE_COLOR,
                        child: Column(children: [
                          Padding(
                            padding: EdgeInsets.only(
                                left: 16,
                                right: 16,
                                top: 16,
                                bottom: 0),
                            child: Column(
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              children: [
                                AppText(
                                    text: 'noContentDelivery',
                                    fontSize:
                                    AppDimensions.FONT_SIZE_18,
                                    fontFamily: Weights.medium),
                                ListTile(
                                  contentPadding: EdgeInsets.all(0),
                                  title: AppText(
                                      text: 'deliveryIns',
                                      fontSize:
                                      AppDimensions.FONT_SIZE_16,
                                      textColor:
                                      AppColors.BLACK_COLOR,
                                      fontFamily: Weights.medium),
                                  subtitle: AppText(
                                      text: 'deliveryMessage',
                                      textColor: AppColors
                                          .DARK_GREY_COLOR
                                          .withOpacity(0.6),
                                      fontFamily: Weights.medium,
                                      fontSize:
                                      AppDimensions.FONT_SIZE_12),
                                ),
                              ],
                            ),
                          ),
                          Divider(
                            color: AppColors.GREY_COLOR,
                            thickness: 1,
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: 16,
                                right: 16,
                                top: 0,
                                bottom: 16),
                            child: Column(
                              children: [
                                ListTile(
                                  contentPadding: EdgeInsets.all(0),
                                  title: AppText(
                                      text: 'takePhoto',
                                      fontSize:
                                      AppDimensions.FONT_SIZE_16,
                                      textColor:
                                      AppColors.BLACK_COLOR,
                                      fontFamily: Weights.medium),
                                  subtitle: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 5, bottom: 16),
                                    child: AppText(
                                        text: 'deliveryMsg',
                                        textColor: AppColors
                                            .DARK_GREY_COLOR
                                            .withOpacity(0.6),
                                        fontFamily: Weights.medium,
                                        fontSize: AppDimensions
                                            .FONT_SIZE_12),
                                  ),
                                ),
                                Obx(
                                      () =>
                                  orderController
                                      .selectedImagePath
                                      .value ==
                                      ''
                                      ? InkWell(
                                    child: Container(
                                      width: Get.width,
                                      height:
                                      Get.height * 0.19,
                                      decoration:
                                      BoxDecoration(
                                        color: AppColors
                                            .GREY_COLOR
                                            .withOpacity(
                                            0.5),
                                        borderRadius:
                                        AppBorderRadius
                                            .BORDER_RADIUS_10,
                                        // image: DecorationImage(
                                        //   image: Image.file(orderController.imageFile!)
                                        //       .image,
                                        //   fit: BoxFit.cover,
                                        // ),
                                      ),
                                      alignment:
                                      Alignment.center,
                                      child: AppText(
                                          text:
                                          'tapClickPhoto',
                                          fontFamily:
                                          Weights
                                              .medium,
                                          textColor: AppColors
                                              .LIGHT_GREY_COLOR,
                                          fontSize:
                                          AppDimensions
                                              .FONT_SIZE_14),
                                    ),
                                    onTap: () {
                                      //camera fun here modal bottom sheet
                                      showModalBottomSheet(
                                          context: context,
                                          builder:
                                              (BuildContext
                                          bc) {
                                            return SafeArea(
                                              child:
                                              Container(
                                                color: AppColors.WHITE_COLOR,
                                                child: Wrap(
                                                  children: <
                                                      Widget>[
                                                    ListTile(
                                                      leading:
                                                      Icon(Icons.photo_camera),
                                                      title: AppText(
                                                          text: 'Camera',
                                                          fontFamily: Weights.light,
                                                          fontSize: AppDimensions.FONT_SIZE_18),
                                                      onTap:
                                                          () async {
                                                        orderController.getImage(ImageSource.camera);
                                                        Navigator.pop(context);
                                                        // orderController
                                                        //         .image =
                                                        //     await orderController
                                                        //         .picker
                                                        //         .pickImage(
                                                        //             source:
                                                        //                 ImageSource.camera);
                                                        //  orderController.setImage(orderController.image);

                                                        // Navigator.of(context).pop();
                                                      },
                                                    ),
                                                    ListTile(
                                                        leading: Icon(Icons
                                                            .photo_library),
                                                        title: AppText(
                                                            text: 'Gallery',
                                                            fontFamily: Weights.light,
                                                            fontSize: AppDimensions.FONT_SIZE_18),
                                                        onTap: () async {
                                                          orderController.getImage(ImageSource.gallery);
                                                          // orderController
                                                          //         .image =
                                                          //     await orderController
                                                          //         .picker
                                                          //         .pickImage(
                                                          //             source:
                                                          //                 ImageSource.gallery);
                                                          // _onImageButtonPressed("gallery");
                                                          Navigator.of(context).pop();
                                                        }),

                                                  ],
                                                ),
                                              ),
                                            );
                                          });
                                    },
                                  )
                                      : Container(
                                    width: Get.width,
                                    height:
                                    Get.height * 0.19,
                                    decoration:
                                    BoxDecoration(
                                      color: AppColors
                                          .GREY_COLOR
                                          .withOpacity(0.5),
                                      borderRadius:
                                      AppBorderRadius
                                          .BORDER_RADIUS_10,
                                    ),
                                    child: Image.file(
                                      File(orderController
                                          .selectedImagePath
                                          .value),
                                      fit: BoxFit.fitWidth,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: AppPaddings.defaultPadding,
                            child: AppButton(
                              buttonName: 'completeMyOrder',
                              fontFamily: Weights.light,
                              buttonColor: orderController
                                  .selectedImagePath.value ==
                                  ''
                                  ? AppColors.DISABLE_COLOR
                                  : AppColors.BLUE_COLOR,
                              textColor: orderController
                                  .selectedImagePath.value ==
                                  ''
                                  ? AppColors.LIGHT_GREY_COLOR
                                  : AppColors.WHITE_COLOR,
                              buttonWidth: Get.width,
                              buttonRadius: BorderRadius.all(
                                  Radius.circular(10)),
                              onTap: () {
                                orderController.indexValue.value= 0;
                               // updateController.acceptOrder(box.read('userIDD'),context,4);
                                Get.offAll(() => DashboardScreen());
                              },
                            ),
                          ),
                        ]),
                      ),
                    ],
                  )
                      : SizedBox.shrink(),

                ],
              );
            }),
          ],
        ),
      ),

      body: Container(
        height: Get.height,
        width: Get.width,
        color: AppColors.WHITE_COLOR,
        child: Obx(() {
          return Column(
            children: [
              orderController.isShow.value
                  ? Container(
                height: Get.height / 10,
                padding: AppPaddings.defaultPadding,
                decoration: BoxDecoration(
                  color: AppColors.TRANSPARENT_COLOR,
                ),
                margin: EdgeInsets.only(top: Get.height * 0.019),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: Get.height * 0.02,
                        ),
                        InkWell(
                          child: CircleAvatar(
                            radius: 18,
                            backgroundColor:
                            AppColors.BLUE_COLOR.withOpacity(0.5),
                            child: Icon(
                              Icons.chevron_left,
                              color: AppColors.BLACK_COLOR,
                            ),
                          ),
                          onTap: (){
                            Get.back();
                          },
                        ),
                        SizedBox(
                          width: Get.width * 0.025,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 0),
                          child: AppText(
                              text: orderController.checkBox.value
                                  ? 'deliverOrder'
                                  : 'collectOrder',
                              fontFamily: Weights.medium,
                              fontSize: AppDimensions.FONT_SIZE_18,
                              fontWeight: FontWeights.bold),
                        ),
                        Spacer(),
                        IconButton(
                          padding: EdgeInsets.all(0),
                          tooltip: 'make a call',
                          icon: Icon(
                            Icons.phone,
                            color: AppColors.BLUE_COLOR,
                          ),
                          color: AppColors.BLUE_COLOR,
                          onPressed: () {
                            //make a call code
                            orderController.launchURL();
                            print('hello');

                            //_launchURL();
                            // launch('tel:$number');
                          },
                        ),
                        SizedBox(
                          width: Get.width * 0.05,
                        ),
                        Icon(
                          Icons.info_outline,
                          color: AppColors.BLUE_COLOR,
                        )
                      ],
                    ),
                  ],
                ),
              )
                  : SizedBox.shrink(),
              Stack(
                children: [
                  SizedBox(
                    width: size.width,
                    height: size.height * 0.8,
                    child: GoogleMap(
                      zoomControlsEnabled: false,
                      initialCameraPosition: const CameraPosition(
                        target: LatLng(48.8561, 2.2930),
                        zoom: 11.0,
                      ),
                      myLocationEnabled: true,
                      zoomGesturesEnabled: true,
                      mapToolbarEnabled: false,
                      myLocationButtonEnabled: false,
                      onMapCreated: (GoogleMapController controller) {
                        goController = controller;
                        goController?.setMapStyle(_mapStyle);
                        locationPosition();
                      },
                      onCameraMove: (CameraPosition cameraPosition) {
                        cameraPosition = cameraPosition; //when map is dragging
                      },
                    ),
                  ),
                  //bottom sheet open button
                  orderController.isShow.value
                      ? SizedBox.shrink()
                      : Positioned(
                    top: 40,
                    left: 16,
                    child: TextButton(
                        onPressed: () {
                          // Get.bottomSheet(AddressBottomSheet(),
                          //     isScrollControlled: false,
                          // isDismissible: true,
                          //     barrierColor: AppColors.TRANSPARENT_COLOR);
                        },
                        child: InkWell(
                          child: AppText(
                              text: 'cancelOrder'.tr,
                              textColor: AppColors.RED_COLOR,
                              fontSize: AppDimensions.FONT_SIZE_14,
                              fontFamily: Weights.medium),
                          onTap: (){

                            //open dialog code
                            cancelOrderController.cancelOrder(context);
                            /*showDialog(
                                context: context,
                                builder: (BuildContext context){
                                  return Dialog(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    elevation: 0.0,
                                    backgroundColor: Colors.white,
                                    insetPadding:
                                    EdgeInsets.symmetric(horizontal: 40, vertical: Get.height / 4),
                                    child: GetBuilder<CancelOrderController>(
                                      builder: (context) {
                                        return Container(
                                          width: Get.width,
                                          height: Get.height *0.4,
                                          child: ListView.builder(
                                            itemCount: cancelOrderController.list.length,
                                            itemBuilder: (context, int index){
                                            return Column(
                                              children: [
                                                Text('id is ${cancelOrderController.cancelOrderModel.data?.cancelData?[index].id}'),
                                                Text('reason is ${cancelOrderController.cancelOrderModel.data?.cancelData?[index].name}'),

                                              ],
                                            );
                                          },)
                                        );
                                      }
                                    ),
                                  );
                                });*/
                          },
                        )),
                  ),
                ],
              ),
            ],
          );
        }),
      ),
    );
  }
}