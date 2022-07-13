import 'package:bliksy/App_Modules/BottomNavigation/MyOrder/View/completed_tab.dart';
import 'package:bliksy/App_Modules/BottomNavigation/MyOrder/View/ongoing_tab.dart';
import 'package:bliksy/Utils/Fonts/AppFonts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../Utils/Fonts/AppDimensions.dart';
import '../../../../Utils/Themes/AppColors.dart';
import '../../../../Utils/Widgets/AppText.dart';
import '../Model/Order_detail_model.dart';
import 'order_screen.dart';

class OrderScreenOne extends StatefulWidget {
  OrderScreenOne({Key? key,}) : super(key: key);

  @override
  State<OrderScreenOne> createState() => _OrderScreenOneState();
}

class _OrderScreenOneState extends State<OrderScreenOne> {

  @override
  void initState() {
  
    super.initState();
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.BLUE_COLOR,

      appBar: AppBar(
        title: AppText(
          text: 'myOrders',
          fontFamily: Weights.light,
          textColor: AppColors.WHITE_COLOR,
          fontSize: AppDimensions.FONT_SIZE_24,
          fontWeight: FontWeights.medium,
        ),

        centerTitle: true,
        backgroundColor: AppColors.TRANSPARENT_COLOR,
        elevation: 0,
        iconTheme: IconThemeData(color: AppColors.TRANSPARENT_COLOR),
      ),
      body: DefaultTabController(
          length: 2,
          child: Column(
            children: [
              TabBar(
                indicatorColor: AppColors.WHITE_COLOR,
                labelColor: Colors.white,
                unselectedLabelColor: AppColors.GREY_COLOR.withOpacity(0.8),
                indicatorSize: TabBarIndicatorSize.label,
                labelStyle: TextStyle(
                    fontSize: AppDimensions.FONT_SIZE_18,
                    fontFamily: Weights.bold,
                    fontWeight: FontWeights.medium),
                indicatorWeight: 2,
                indicator: UnderlineTabIndicator(
                  borderSide:
                      BorderSide(width: 2.0, color: AppColors.WHITE_COLOR),
                  insets: EdgeInsets.only(right: 20),
                ),
                tabs: [
                  Tab(
                    text: 'onGoingOrder'.tr,
                  ),
                  Tab(
                    text: 'completedOrder'.tr,
                  ),
                ],
              ),
              Expanded(
                  child: TabBarView(
                children: [
                  InkWell(child: OngoingTab(),
                  onTap: (){
                    Get.to(() => OrderScreen());
                  },),
                  CompletedTab(),
                ],
              ))
            ],
          )),
    );
  }
}
