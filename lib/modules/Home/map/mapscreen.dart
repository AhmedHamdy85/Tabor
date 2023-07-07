import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:tabor/layout/cubit/logic.dart';
import 'package:tabor/layout/cubit/states.dart';
import 'package:tabor/layout/layout_screen.dart';
import 'package:tabor/shared/componants/componant.dart';
import 'package:tabor/shared/componants/iconsax_icons.dart';

import '../../../shared/network/helpers/location_helper.dart';

/*class MapHome extends StatefulWidget {
  const MapHome({super.key});

  @override
  State<MapHome> createState() => _MapHomeState();
}

class _MapHomeState extends State<MapHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: GoogleMap(
          initialCameraPosition: CameraPosition(
            target: LatLng(37.43296265331129, -122.08832357078792),
            ),
          ),
      ),
    );
  }
}*/
class MapHome extends StatefulWidget {
   MapHome({super.key});

  @override
  State<MapHome> createState() => _MapHomeState();
}

class _MapHomeState extends State<MapHome> {
@ override
  void initState() {
    super.initState();
    getMyCurrentLocatin();
  }
  final Completer<GoogleMapController> _mapController=Completer();
  static Position? position;
  static final CameraPosition _cameraPositionOfmyCurrentPosition=CameraPosition(
    target: LatLng(position!.altitude, position!.latitude),
    zoom: 15
    );
  Future<void> getMyCurrentLocatin() async  {
    position= await HelperClass.determinePosition().whenComplete(() {
      setState(() {
      });
    });
  }
  Widget showMap(){
    return GoogleMap(
      mapType: MapType.normal,
      myLocationButtonEnabled: false,
      myLocationEnabled: true,
      initialCameraPosition: _cameraPositionOfmyCurrentPosition,
      onMapCreated: (GoogleMapController controller) {
       _mapController.complete(controller);
      },
      );
  }
  Future<void> _goToMyLocation() async {
    final GoogleMapController controller=await _mapController.future;
    await controller.animateCamera(CameraUpdate.newCameraPosition(_cameraPositionOfmyCurrentPosition));
  }


  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color(0xfff5f5f5),
      body: Directionality(
        textDirection: TextDirection.rtl, 
        child: BlocConsumer<layoutCubit,layoutStates>(
          listener: (context, state) => {},
          builder: (context,state){
            return Scaffold(
              body: SafeArea(
                child: Column(
                children: [
                  Container(
                    height: screenHight * 0.17,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Color(0xffffffff),
                      boxShadow: [
                        BoxShadow(blurRadius: 4, color: Color(0xff40000000))
                      ],
                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(16),
                          bottomLeft: Radius.circular(16)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(right: 16, left: 16, bottom: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 4),
                            child: InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: DefoltSvgImage(
                                  image:
                                      'assets/images/vuesax_bulk_arrow_square_right.svg'),
                            ),
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 5),
                            child: specialtext(text: 'الخريطة',
                            fsize: 21,
                            fweight: FontWeight.w500
                            ),
                          ),
                          Spacer(),
                          CircleAvatar(
                            backgroundColor: Color(0xffbceee3),
                            child: InkWell(
                                onTap: () {
                                  NavigateAndFinsh(
                                      context,
                                      Directionality(
                                          textDirection: TextDirection.rtl,
                                          child: layoutScreen()));
                                },
                                child: Icon(Iconsax.gps),
                                ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Stack(
                      children: [
                        Container(
                        width: double.infinity,
                        child: position!=null? showMap():Center(child: CircularProgressIndicator()),
                     ),
                      ],
                    ),
                  ),
                         ],
                       ),
              ),
            );
        }
       ),
    ),
  );
 }
}
