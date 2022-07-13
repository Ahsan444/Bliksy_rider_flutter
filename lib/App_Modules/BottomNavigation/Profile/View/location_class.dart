import 'package:bliksy/Localization/save_locale.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocationClass extends StatefulWidget {
  LocationClass({Key? key}) : super(key: key);

  @override
  State<LocationClass> createState() => _LocationClassState();
}

class _LocationClassState extends State<LocationClass> {
  Location location = new Location();

  late bool serviceEnabled;
  late PermissionStatus permissionGranted;
  LocationData? locationData;
  String lati = '';
  String long = '';
  final fireStore = FirebaseDatabase.instance;
  List latLongList = [];

  void getLoca() async {
    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return;
      }
    }

    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    locationData = await location.getLocation();
    changeLoc();
    debugPrint("Location latitude: ${locationData?.latitude}");
    debugPrint("Location longitude: ${locationData?.longitude}");
  }

  Stream changeLoc() async* {
    final prefs = await SharedPreferences.getInstance();
    location.onLocationChanged.listen((LocationData currentLocation) {
      if (mounted) {
        setState(() {
          lati = currentLocation.latitude.toString();
          long = currentLocation.longitude.toString();
        });
      }
     // String? id = box.read('userId') ?? '';
      int? id = prefs.getInt('userID');
      latLongList.add(id);
      
      // fireStore.ref('online_drivers').child('$id').set({
      //   'lat': lati,
      //   'long': long,
      // });

      if (id != fireStore.ref('online_drivers').child('$id')) {
        fireStore.ref('online_drivers').child('$id').set({
          'lat': lati,
          'long': long,
        });
      } if(id == fireStore.ref('online_drivers').child('$id')) {
        fireStore.ref('$id').set({
          'lat': lati,
          'long': long,
        });
      }

      debugPrint("Change location latitude: ${currentLocation.latitude}");
      debugPrint("Changes location longitude: ${currentLocation.longitude}");
    });
    location.enableBackgroundMode(enable: false);
  }

  @override
  void initState() {
    if (mounted) {
      getLoca();
    }
    //changeLoc();

    super.initState();
  }

  // bgLoc(){
  //   bg.BackgroundGeolocation.onLocation((bg.Location location) {
  //    setState(() {
  //      lati = location.coords.latitude.toString();
  //      long = location.coords.longitude.toString();
  //    });
  //    String id = box.read('userId');
  //    latLongList.add(id);
  //    if(id == fireStore.ref('$id')){
  //      fireStore.ref('$id').set({
  //        'lat': lati,
  //        'long': long,
  //      });
  //    }else{
  //      fireStore.ref('$id').set({
  //        'lat': lati,
  //        'long': long,
  //      });
  //    }
  //    // fireStore.ref().child('online_drivers').set({
  //    //   "${box.read('userId')}": [
  //    //     {"latitude": lati, "longitude": long}
  //    //   ]
  //    // });

  //    debugPrint("Change location latitude: ${location.coords.latitude}");

  //  });
  //  bg.BackgroundGeolocation.start();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: changeLoc(),
          initialData: 0,
          builder: (context, snapshot) {
            if (snapshot.data == null) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Location latitude: ${lati}"),
                    Text("Location longitude: ${long}"),
                  ],
                ),
              );
            } else {
              // changeLoc();
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Location latitude: ${lati}"),
                    Text("Location longitude: ${long}"),
                  ],
                ),
              );
            }
          }),
      // body: SafeArea(
      //   child: Container(
      //     child: Center(
      //       child:
      //           Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      //         Text("Location latitude: ${lati}"),
      //         Text("Location longitude: ${long}"),
      //       ]),
      //     ),
      //   ),
      // ),
    );
  }
}
