import 'dart:async';
import 'package:permission_handler/permission_handler.dart';
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
class MapHomescreen extends StatefulWidget {
  MapHomescreen({super.key});

  @override
  State<MapHomescreen> createState() => _MapHomescreenState();
}

class _MapHomescreenState extends State<MapHomescreen> {
  @override
  void initState() {
    super.initState();
    _requestLocationPermission();
    getMyCurrentLocatin();
    _marker.addAll(_list);
  }
  void _requestLocationPermission() async {
    final PermissionStatus permissionStatus =
    await Permission.location.request();
    if (permissionStatus != PermissionStatus.granted) {
      showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: Text('Location permission'),
          content:
          Text('Please grant location permission to use this feature.'),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  final Completer<GoogleMapController> _mapController = Completer();
  static Position? position;
  static final CameraPosition _cameraPositionOfmyCurrentPosition =
      CameraPosition(
          target: LatLng(position!.altitude, position!.latitude), 
          zoom: 15
          );
  Future<void> getMyCurrentLocatin() async {
    position = await HelperClass.determinePosition().whenComplete(() {
      setState(() {});
    });
  }
  final List<Marker> _marker =[];
  final List<Marker> _list=[
    Marker(
      markerId: const MarkerId('1'),
      position: const LatLng(29.3078296, 30.840746),
      infoWindow: const InfoWindow(
        title: 'بنك مصر -الفيوم-شارع الحرية(السواقي) '
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    ),
    Marker(
      markerId: MarkerId('2'),
      position: LatLng(29.3611564, 30.683325),
      infoWindow: InfoWindow(
        title: 'بنك مصر -الفيوم-مدينة ابشواي-شارع الجمهورية(المحكمه)'
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    ),
    Marker(
      markerId: MarkerId('3'),
      position: LatLng(31.1935537, 29.91368769999999),
      infoWindow: InfoWindow(
        title: 'بنك مصر-الاسكندرية-محرم بك'
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    ),
    Marker(
      markerId: MarkerId('4'),
      position: LatLng(29.30766169999999, 
      30.8459884),
      infoWindow: InfoWindow(
        title: 'البنك الاهلي المصري-الفيوم-شارع الحرية(السواقي)'
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    ),
    Marker(
      markerId: MarkerId('5'),
      position: LatLng(29.3088067, 30.8698577),
      infoWindow: InfoWindow(
        title: 'البنك الاهلي المصري-الفيوم-ميدان المسلة'
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    ),
    Marker(
      markerId: MarkerId('6'),
      position: LatLng(30.1084261, 31.3176555),
      infoWindow: InfoWindow(
        title: 'البنك الاهلي المصري_طاميه_قسم الزيتون'
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    ),
    Marker(
      markerId: MarkerId('7'),
      position: const LatLng(30.6026918, 32.2755228),
      infoWindow: InfoWindow(
        title: 'البنك الاهلي المصري-الاسماعيلية-مديرية الزراعة-الشيخ زايد'
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    ),
    Marker(
      markerId: MarkerId('8'),
      position: LatLng(30.591221, 32.2747987),
      infoWindow: InfoWindow(
        title: 'بنك القاهرة-الاسماعيلية-شارع فريد ندى'
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    ),
    Marker(
      markerId: MarkerId('9'),
      position: LatLng(29.2411646, 30.7950495),
      infoWindow: InfoWindow(
        title: 'بنك القاهرة-الفيوم-اطسا-الغرق'
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    ),
    Marker(
      markerId: MarkerId('10'),
      position: LatLng(27.7358987, 30.8458016),
      infoWindow: InfoWindow(
        title: 'بنك القاهرة-المنيا-ملوي-شارع الجلاء'
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    ),
    Marker(
      markerId: MarkerId('11'),
      position: LatLng(30.079516, 31.24818830000001),
      infoWindow: InfoWindow(
        title: 'بنك القاهرة-القاهرة-شبرا-شارع خلوصي'
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    ),
    Marker(
      markerId: MarkerId('12'),
      position: LatLng(29.306535, 30.84980499999999),
      infoWindow: InfoWindow(
        title: 'بنك الاسكندرية-الفيوم-امام السنترال'
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    ),
    Marker(
      markerId: MarkerId('13'),
      position: LatLng(30.289364, 31.739486),
      infoWindow: InfoWindow(
        title: 'بنك الاسكندرية-الشرقية-مدينة العاشر من رمضان'
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    ),
    Marker(
      markerId: MarkerId('14'),
      position: LatLng(25.3035831, 32.5503172),
      infoWindow: InfoWindow(
        title: 'بنك التنمية والائتمان الزراعي-قنا-اسنا'
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    ),
    Marker(
      markerId: MarkerId('15'),
      position: LatLng(29.309962,30.70740750000001),
      infoWindow: InfoWindow(
        title: 'فرع اتصالات-الفيوم-مركز ابشواي-طبهار-النزله'
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    ),
    Marker(
      markerId: MarkerId('16'),
      position: LatLng(29.1383848, 30.6954358),
      infoWindow: InfoWindow(
        title: 'فرع اتصالات-الفيوم -اطسا-الغرق قبلي '
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    ),
    Marker(
      markerId: MarkerId('17'),
      position: LatLng(29.2376679, 30.7957233),
      infoWindow: InfoWindow(
        title: 'فرع اورانج-الفيوم-مدينة اطسا'
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    ),
    Marker(
      markerId: MarkerId('18'),
      position: LatLng(29.4750688, 30.9565651),
      infoWindow: InfoWindow(
        title: 'فرع فودافون-الفيوم-طامية -مدينة طامية-11يوليو'
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    ),
    Marker(
      markerId: MarkerId('19'),
      position: LatLng( 30.12206470000001, 31.13917300000001),
      infoWindow: InfoWindow(
        title: 'فرع وي -الجيزة-مركز اوسيم- زاوية ثابت'
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    ),
   
  ];
  Widget showMap() {
    return GoogleMap(
      mapType: MapType.normal,
      myLocationButtonEnabled: false,
      myLocationEnabled: true,
      markers: Set<Marker>.of(_marker),
      initialCameraPosition: _cameraPositionOfmyCurrentPosition,
      onMapCreated: (GoogleMapController controller) {
        _mapController.complete(controller);
      },
    );
  }

  Future<void> _goToMyCurrentLocation() async {
    final GoogleMapController controller = await _mapController.future;
    await controller.animateCamera(
        CameraUpdate.newCameraPosition(_cameraPositionOfmyCurrentPosition));
  }

  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color(0xfff5f5f5),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: BlocConsumer<layoutCubit, layoutStates>(
            listener: (context, state) => {},
            builder: (context, state) {
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
                          padding: const EdgeInsets.only(
                              right: 16, left: 16, bottom: 16),
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
                                child: specialtext(
                                    text: 'الخريطة',
                                    fsize: 21,
                                    fweight: FontWeight.w500),
                              ),
                              Spacer(),
                              CircleAvatar(
                                backgroundColor: Color(0xffbceee3),
                                child: InkWell(
                                  onTap: () {
                                    _goToMyCurrentLocation;
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
                              child: position != null
                                  ? showMap()
                                  : Center(child: CircularProgressIndicator()),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}
