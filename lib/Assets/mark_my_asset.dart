import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:latlong2/latlong.dart';

class AddPointsToMapScreen extends StatefulWidget {
  const AddPointsToMapScreen({Key? key}) : super(key: key);

  @override
  State<AddPointsToMapScreen> createState() => _AddPointsToMapScreenState();
}

class _AddPointsToMapScreenState extends State<AddPointsToMapScreen> {
  List<LatLng> points = [];

  void _addPoint(LatLng point) {
    setState(() {
      points.add(point);
    });
  }

  final TextEditingController latController = TextEditingController();
  final TextEditingController longController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          FlutterMap(
            options: MapOptions(
              initialZoom: 12,
              initialCenter: LatLng(28.5149, 77.1124),
              onTap: (tapPosition, point) {
                latController.text = point.latitude.toString();
                longController.text = point.longitude.toString();
                Get.defaultDialog(
                  title: "Add Point",
                  titleStyle: GoogleFonts.montserrat(
                    color: Colors.black,
                    fontSize: 15.0,
                    fontWeight: FontWeight.w600,
                  ),
                  content: Column(
                    children: [
                      TextField(
                        controller: latController,
                        decoration: InputDecoration(
                          labelText: "Latitude",
                          labelStyle: GoogleFonts.montserrat(
                            color: Colors.black,
                            fontSize: 15.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        keyboardType: TextInputType.number,
                      ),
                      TextField(
                        controller: longController,
                        decoration: InputDecoration(
                          labelText: "Longitude",
                          labelStyle: GoogleFonts.montserrat(
                            color: Colors.black,
                            fontSize: 15.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        keyboardType: TextInputType.number,
                      ),
                    ],
                  ),
                  confirm: MaterialButton(
                    color: Colors.red,
                    onPressed: () {
                      double? lat = double.tryParse(latController.text);
                      double? long = double.tryParse(longController.text);
                      if (lat != null && long != null) {
                        setState(() {
                          points.add(LatLng(lat, long));
                        });
                        latController.clear();
                        longController.clear();
                        Get.back(); // Close the dialog
                      } else {
                        Get.snackbar("Error", "Please enter valid coordinates");
                      }
                    },
                    child: Text(
                      "Add",
                      style: GoogleFonts.montserrat(
                        color: Colors.white,
                        fontSize: 15.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  cancel: MaterialButton(
                    color: Colors.green,
                    onPressed: () {
                      latController.clear();
                      longController.clear();
                      Get.back(); // Close the dialog
                    },
                    child: Text(
                      "Cancel",
                      style: GoogleFonts.montserrat(
                        color: Colors.white,
                        fontSize: 15.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                );
              },
            ),
            children: [
              TileLayer(
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                userAgentPackageName: 'com.example.app',
              ),
              MarkerLayer(
                markers:
                    points.map((point) {
                      return Marker(
                        width: 80.0,
                        height: 80.0,
                        point: point,
                        child: Icon(
                          Icons.location_on,
                          size: 40.0,
                          color: Colors.red,
                        ),
                      );
                    }).toList(),
              ),
            ],
          ),
          Positioned(
            bottom: 2 * kBottomNavigationBarHeight,
            left: 0,
            right: 0,
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                Get.defaultDialog(
                  title: "Add Point",
                  titleStyle: GoogleFonts.montserrat(
                    color: Colors.black,
                    fontSize: 15.0,
                    fontWeight: FontWeight.w600,
                  ),
                  content: Column(
                    children: [
                      TextField(
                        controller: latController,
                        decoration: InputDecoration(
                          labelText: "Latitude",
                          labelStyle: GoogleFonts.montserrat(
                            color: Colors.black,
                            fontSize: 15.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        keyboardType: TextInputType.number,
                      ),
                      TextField(
                        controller: longController,
                        decoration: InputDecoration(
                          labelText: "Longitude",
                          labelStyle: GoogleFonts.montserrat(
                            color: Colors.black,
                            fontSize: 15.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        keyboardType: TextInputType.number,
                      ),
                    ],
                  ),
                  confirm: MaterialButton(
                    color: Colors.red,
                    onPressed: () {
                      double? lat = double.tryParse(latController.text);
                      double? long = double.tryParse(longController.text);
                      if (lat != null && long != null) {
                        setState(() {
                          points.add(LatLng(lat, long));
                        });
                        latController.clear();
                        longController.clear();
                        Get.back(); // Close the dialog
                      } else {
                        Get.snackbar("Error", "Please enter valid coordinates");
                      }
                    },
                    child: Text(
                      "Add",
                      style: GoogleFonts.montserrat(
                        color: Colors.white,
                        fontSize: 15.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  cancel: MaterialButton(
                    color: Colors.green,
                    onPressed: () {
                      latController.clear();
                      longController.clear();
                      Get.back(); // Close the dialog
                    },
                    child: Text(
                      "Cancel",
                      style: GoogleFonts.montserrat(
                        color: Colors.white,
                        fontSize: 15.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(6.0),
                ),
                margin: EdgeInsets.symmetric(horizontal: 20.0),
                height: 48.0,

                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.add_location_alt,
                      size: 25.0,
                      color: Colors.white,
                    ),
                    SizedBox(width: 10),
                    Text(
                      'Add Asset',
                      style: GoogleFonts.montserrat(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 15.0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
