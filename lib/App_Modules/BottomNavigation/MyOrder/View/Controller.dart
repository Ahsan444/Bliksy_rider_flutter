import 'package:get/get.dart';



class UserStoreController extends GetxController{
  var nearbyData = [].obs;
  var isLoading = false.obs;



  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

  }



  nearList(var id) async{
/*
    try{
      isLoading(true);

      var nearData =await ApiManger.orderDetail(id: id, );
      if(nearData!=null){
        nearbyData.value = nearData.data as dynamic;
        print(nearbyData);

      }
      else{
       // print(nearData!.data.length);
      }
    }*/
  /*  catch(e){print(e.toString());}
    finally{
      isLoading(false);
    }
*/



  }

}