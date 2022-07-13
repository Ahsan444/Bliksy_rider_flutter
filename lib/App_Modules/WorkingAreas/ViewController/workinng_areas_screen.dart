import 'package:bliksy/App_Modules/WorkingAreas/View/workinng_controller.dart';
import 'package:bliksy/App_Modules/dashboard_screen.dart';
import 'package:bliksy/Utils/Paddings/AppBorderRadius.dart';
import 'package:bliksy/Utils/Widgets/AppButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Utils/Fonts/AppDimensions.dart';
import '../../../Utils/Fonts/AppFonts.dart';
import '../../../Utils/Paddings/AppPaddings.dart';
import '../../../Utils/Themes/AppColors.dart';
import '../../../Utils/Widgets/AppText.dart';

class WorkingAreasScreen extends StatelessWidget {
  WorkingAreasScreen({Key? key}) : super(key: key);
  final controller = Get.put(WorkingAreaController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        height: Get.height,
        width: Get.width,
        color: AppColors.WHITE_COLOR,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: Get.height * 0.01,
            ),
            Container(
              height: Get.height / 10,
              padding: AppPaddings.defaultPadding,
              decoration: BoxDecoration(
                color: AppColors.TRANSPARENT_COLOR,
              ),
              margin: EdgeInsets.only(top: Get.height * 0.019),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: Get.height * 0.02,
                  ),
                  CircleAvatar(
                    radius: 18,
                    backgroundColor: AppColors.BLUE_COLOR.withOpacity(0.5),
                    child: IconButton(
                      icon: Icon(Icons.chevron_left),
                      color: AppColors.BLACK_COLOR,
                      padding: EdgeInsets.all(0),
                      onPressed: () => Get.back(),
                    ),
                  ),
                  SizedBox(
                    width: Get.width * 0.025,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 0),
                    child: AppText(
                        text: 'workingarea',
                        fontFamily: Weights.medium,
                        fontSize: AppDimensions.FONT_SIZE_18,
                        fontWeight: FontWeights.bold),
                  ),
                  Spacer(),
                  //Icon(Icons.search,color: AppColors.PRIMARY_COLOR,)
                  Expanded(
                      flex: 5,
                      child: Obx(
                        () => TextField(
                          cursorColor: AppColors.BLUE_COLOR,
                          controller: controller.searchController.value,
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                              icon: Icon(Icons.search),
                              color: AppColors.BLUE_COLOR,
                              onPressed: () {
                               /* controller.list2.forEach((element) {
                                  controller.list2.forEach((element) {
                                    if (element['name'].toLowerCase().contains(
                                        controller.searchController.value.text
                                            .toLowerCase())) {
                                      controller.list1.add(element);
                                    }
                                  });
                                });*/
                              },
                            ),
                            border: InputBorder.none,
                            hintText: 'Search here',
                            hintStyle: TextStyle(
                                fontFamily: Weights.light,
                                fontSize: AppDimensions.FONT_SIZE_16,
                                fontWeight: FontWeights.regular),
                          ),
                        ),
                      ))
                ],
              ),
            ),
            Padding(
              padding: AppPaddings.defaultPadding,
              child: AppText(
                  text: 'current',
                  fontSize: AppDimensions.FONT_SIZE_16,
                  textColor: AppColors.DARK_GREY_COLOR.withOpacity(0.7),
                  fontWeight: FontWeights.regular,
                  fontFamily: Weights.medium),
            ),
            Column(
              children: [
                Expanded(
                  flex: 0,
                  child: Container(
                    width: Get.width,
                    child: Obx(
                      () => ListView.builder(
                          shrinkWrap: true,
                          padding: EdgeInsets.zero,
                          scrollDirection: Axis.vertical,
                          itemCount: controller.list1.length,
                          physics: BouncingScrollPhysics(),
                          itemBuilder: (BuildContext context, index) {
                            return controller.list1.isEmpty
                                ? SizedBox.shrink()
                                : cardWidget(
                                    name: controller.list1[index]['name'],
                                    code: controller.list1[index]['code'],
                                    show: true,
                                    dist: controller.list1[index]['dist'],
                                    onPressed: () {
                                      if (controller.list2
                                          .contains(controller.list1[index])) {
                                        controller.list1.removeAt(index);
                                        debugPrint(
                                            'removed: ${controller.list1.remove([
                                              index
                                            ])}');
                                      } else {
                                        controller.list2
                                            .add(controller.list1[index]);
                                        controller.list1.removeAt(index);
                                        print(
                                            'added ${controller.list2[index]}');
                                      }
                                      //print('hello');
                                    });
                          }),
                    ),
                  ),
                ),

                //nearby txt
                Padding(
                  padding: AppPaddings.defaultPadding,
                  child: AppText(
                      text: 'nearby',
                      fontSize: AppDimensions.FONT_SIZE_16,
                      textColor: AppColors.DARK_GREY_COLOR.withOpacity(0.7),
                      fontWeight: FontWeights.regular,
                      fontFamily: Weights.medium),
                ),
                Expanded(
                  flex: 0,
                  child: Container(
                    width: Get.width,
                    child: Obx(
                      () => ListView.builder(
                          shrinkWrap: true,
                          padding: EdgeInsets.zero,
                          scrollDirection: Axis.vertical,
                          itemCount: controller.list2.length,
                          physics: BouncingScrollPhysics(),
                          itemBuilder: (BuildContext context, index) {
                            return cardWidget(
                                name: controller.list2[index]['name'],
                                code: controller.list2[index]['code'],
                                dist: controller.list2[index]['dist'],
                                onPressed: () {
                                  if (controller.list1
                                      .contains(controller.list2[index])) {
                                    controller.list2.removeAt(index);
                                    debugPrint(
                                        'removed: ${controller.list2.remove([
                                          index
                                        ])}');
                                  } else {
                                    controller.list1
                                        .add(controller.list2[index]);
                                    controller.list2.removeAt(index);
                                    //  print('added ${controller.list1[index]}');
                                  }

                                  //print('hello');
                                });
                          }),
                    ),
                  ),
                ),
              ],
            ),
            // Spacer(),
            Padding(
              padding: AppPaddings.defaultPadding,
              child: AppButton(
                  buttonWidth: Get.width,
                  buttonRadius: AppBorderRadius.BORDER_RADIUS_10,
                  buttonName: 'update',
                  buttonColor: AppColors.PRIMARY_COLOR,
                  textColor: AppColors.WHITE_COLOR,
                  onTap: () {
                    Get.to(() => DashboardScreen());
                  }),
            )
          ],
        ),
      ),
    );
  }
}

Widget cardWidget({
  String code = '',
  String name = '',
  String dist = '',
  bool show = false,
  required VoidCallback onPressed,
}) {
  return Card(
    elevation: 1,
    child: Padding(
      padding: AppPaddings.defaultPadding,
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText(
                  text: name,
                  fontSize: AppDimensions.FONT_SIZE_16,
                  textColor: AppColors.BLACK_COLOR,
                  fontWeight: FontWeights.semiBold),
              AppText(
                  text: code,
                  fontSize: AppDimensions.FONT_SIZE_16,
                  textColor: AppColors.BLACK_COLOR,
                  fontWeight: FontWeights.semiBold),
            ],
          ),
          Row(
            children: [
              AppText(
                text: dist,
                fontSize: AppDimensions.FONT_SIZE_16,
                textColor: AppColors.GREY_COLOR,
                fontWeight: FontWeights.regular,
              ),
              Spacer(),
              CircleAvatar(
                radius: 15,
                backgroundColor: AppColors.BLUE_COLOR,
                child: IconButton(
                  icon: show ? Icon(Icons.remove) : Icon(Icons.add),
                  color: AppColors.WHITE_COLOR,
                  padding: EdgeInsets.all(0),
                  onPressed: onPressed,
                ),
              )
            ],
          ),
        ],
      ),
    ),
  );
}
