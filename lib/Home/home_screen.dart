import 'package:cached_network_image/cached_network_image.dart';
import 'package:egs/Login/login_screen.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../Attendance/attendance_screen.dart';
import '../Calender/calender_screen.dart';
import 'graph_screen.dart';

class HomeScreen extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    FirebaseAnalytics.instance.logScreenView(screenName: "Home Screen");
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        leading: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            scaffoldKey.currentState?.openDrawer();
          },
          child: Icon(Icons.menu_open_rounded, color: Colors.black, size: 30),
        ),
        centerTitle: true,
        elevation: 1.0,
        title: Text(
          'EGS Service ',
          style: GoogleFonts.montserrat(
            color: Colors.black,
            fontSize: 16.0,
            fontWeight: FontWeight.w600,
          ),
        ),
        automaticallyImplyLeading: false,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              'assets/images/Emblem_of_India.svg.png',
              height: 35,
              width: 35,
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.orange, Colors.orangeAccent.shade200],
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipOval(
                    child: CachedNetworkImage(
                      imageUrl: 'https://picsum.photos/id/237/200/300',
                      placeholder:
                          (context, url) => CircularProgressIndicator(),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                      width: 45,
                      height: 45,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Sangam Sharma',
                    style: GoogleFonts.montserrat(
                      color: Colors.black,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    'sangam@example.com',
                    style: GoogleFonts.montserrat(
                      color: Colors.black,
                      fontSize: 15.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text(
                'Home',
                style: GoogleFonts.montserrat(
                  color: Colors.black,
                  fontSize: 15.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
              onTap: () {
                Navigator.pop(context); // Close the drawer
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Logout'),
              onTap: () {
                showLogoutPopup(context);
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 40),
            Stack(
              clipBehavior: Clip.none, // Allows overlapping
              children: [
                Container(
                  width: Get.width,
                  margin: EdgeInsets.symmetric(
                    horizontal: 20.0,
                    vertical: 10.0,
                  ),
                  padding: EdgeInsets.fromLTRB(20, 50, 20, 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    gradient: LinearGradient(
                      colors: [
                        Colors.deepPurple,
                        Colors.deepPurpleAccent.shade100,
                      ],
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(width: 50.0),
                      Text(
                        'Sangam Sharma',
                        style: GoogleFonts.montserrat(
                          color: Colors.white,
                          fontSize: 25.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(width: 3.0),
                      Text(
                        'Flutter Developer',
                        style: GoogleFonts.montserrat(
                          color: Colors.white,
                          fontSize: 18.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 12.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Attendance',
                                      style: GoogleFonts.montserrat(
                                        color: Colors.white,
                                        fontSize: 10.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Spacer(),
                                    Text(
                                      '90 %',
                                      style: GoogleFonts.montserrat(
                                        color: Colors.white,
                                        fontSize: 10.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 8),
                                LinearPercentIndicator(
                                  lineHeight: 4.0,
                                  percent: 0.9,
                                  backgroundColor: Colors.white,
                                  progressColor: Colors.black,
                                ),
                              ],
                            ),
                            flex: 1,
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      'Fees',
                                      style: GoogleFonts.montserrat(
                                        color: Colors.white,
                                        fontSize: 10.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Spacer(),
                                    Text(
                                      '51 %',
                                      style: GoogleFonts.montserrat(
                                        color: Colors.white,
                                        fontSize: 10.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 8),
                                LinearPercentIndicator(
                                  lineHeight: 4.0,
                                  percent: 0.51,
                                  backgroundColor: Colors.white,
                                  progressColor: Colors.black,
                                ),
                              ],
                            ),
                            flex: 1,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Positioned(
                  child: ClipOval(
                    child: CachedNetworkImage(
                      imageUrl: 'https://picsum.photos/id/237/200/300',
                      placeholder:
                          (context, url) => CircularProgressIndicator(),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                      width: 70,
                      height: 70,
                      fit: BoxFit.cover,
                    ),
                  ),
                  left: 30,
                  top: -20,
                ),
              ],
            ),

            SizedBox(height: 10.0),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 15.0),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4.0),
                        gradient: LinearGradient(
                          colors: [Colors.orange, Colors.orangeAccent.shade100],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Your Panchayat',
                              style: GoogleFonts.montserrat(
                                color: Colors.white,
                                fontSize: 14.0,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              '10',
                              style: GoogleFonts.montserrat(
                                color: Colors.white,
                                fontSize: 18.0,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10.0),
                  Expanded(
                    flex: 1,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4.0),
                        gradient: LinearGradient(
                          colors: [
                            Colors.deepPurple,
                            Colors.deepPurpleAccent.shade100,
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Your Facilitators',
                              style: GoogleFonts.montserrat(
                                color: Colors.white,
                                fontSize: 14.0,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              '20',
                              style: GoogleFonts.montserrat(
                                color: Colors.white,
                                fontSize: 18.0,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30.0),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 15.0),
              child: Text(
                'Services',
                style: GoogleFonts.montserrat(
                  color: Colors.black,
                  fontSize: 17.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(height: 20.0),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 15.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 1,
                    child: GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () {
                        Get.to(() => AttendanceScreen());
                      },
                      child: serviceCard(
                        'Add Facilitator',
                        Icon(
                          Icons.support_outlined,
                          size: 30,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () {
                        Get.to(() => AttendanceApp());
                      },
                      child: serviceCard(
                        'Upload Attendance',
                        Icon(
                          Icons.countertops_outlined,
                          size: 30,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: serviceCard(
                      'Upload Documents',
                      Icon(Icons.upload_file, size: 30, color: Colors.white),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: serviceCard(
                      'Geofence',
                      Icon(
                        Icons.gesture_outlined,
                        size: 30,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.0),
            Divider(),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 15.0),
              child: Text(
                'My Information',
                style: GoogleFonts.montserrat(
                  color: Colors.black,
                  fontSize: 17.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(height: 20.0),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 15.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 1,
                    child: serviceCardNew(
                      'Add Facilitator',
                      Icon(
                        Icons.support_outlined,
                        size: 30,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: serviceCardNew(
                      'Upload Attendance',
                      Icon(
                        Icons.countertops_outlined,
                        size: 30,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: serviceCardNew(
                      'Upload Documents',
                      Icon(Icons.upload_file, size: 30, color: Colors.black),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: serviceCardNew(
                      'Geofence',
                      Icon(
                        Icons.gesture_outlined,
                        size: 30,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Divider(),
            SizedBox(height: 20),
            Container(
              child: BarChartSample3(),
              margin: EdgeInsets.symmetric(horizontal: 15.0),
            ),
            SizedBox(height: kBottomNavigationBarHeight + 20),
            /* Container(
              height: 400,
              child: BarChart(
                BarChartData(
                  barGroups: [
                    BarChartGroupData(
                      x: 0,
                      barRods: [
                        BarChartRodData(toY: 8, color: Colors.lightBlueAccent),
                      ],
                    ),
                    BarChartGroupData(
                      x: 1,
                      barRods: [
                        BarChartRodData(toY: 10, color: Colors.lightBlueAccent),
                      ],
                    ),
                    BarChartGroupData(
                      x: 2,
                      barRods: [
                        BarChartRodData(toY: 14, color: Colors.lightBlueAccent),
                      ],
                    ),
                    BarChartGroupData(
                      x: 3,
                      barRods: [
                        BarChartRodData(toY: 15, color: Colors.lightBlueAccent),
                      ],
                    ),
                    BarChartGroupData(
                      x: 4,
                      barRods: [
                        BarChartRodData(toY: 13, color: Colors.lightBlueAccent),
                      ],
                    ),
                  ],
                  barTouchData: BarTouchData(
                    touchTooltipData: BarTouchTooltipData(
                      getTooltipColor:
                          (barTouchTooltipData) => Colors.blueAccent,
                    ),
                    touchCallback: (
                      FlTouchEvent event,
                      BarTouchResponse? response,
                    ) {
                      if (!event.isInterestedForInteractions ||
                          response == null ||
                          response.spot == null) {
                        return;
                      }
                      // Handle touch events here
                    },
                    handleBuiltInTouches: true,
                  ),
                ),
              ),
            ),*/
          ],
        ),
      ),
    );
  }

  List<BarChartGroupData> _buildBarGroups() {
    return List.generate(
      [90, 85, 80, 95, 70, 100, 75, 85, 90, 95, 80, 100].length,
      (index) {
        return BarChartGroupData(
          x: index,
          barRods: [
            BarChartRodData(
              fromY:
                  [
                    90,
                    85,
                    80,
                    95,
                    70,
                    100,
                    75,
                    85,
                    90,
                    95,
                    80,
                    100,
                  ][index].toDouble(),
              color: Colors.blueAccent,
              width: 16,
              borderRadius: BorderRadius.circular(4),
              toY: 1,
            ),
          ],
        );
      },
    );
  }

  Widget serviceCard(title, icons) => Container(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(4.0),
          ),
          child: icons,
        ),
        SizedBox(height: 3.0),
        Text(
          title,
          style: GoogleFonts.montserrat(
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: 12.0,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    ),
  );

  Widget serviceCardNew(title, icons) => Container(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(4.0)),
          child: icons,
        ),
        SizedBox(height: 3.0),
        Text(
          title,
          style: GoogleFonts.montserrat(
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: 12.0,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    ),
  );

  void showLogoutPopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Confirm Logout',
            style: GoogleFonts.montserrat(
              color: Colors.black,
              fontWeight: FontWeight.w600,
              fontSize: 15.0,
            ),
          ),
          content: Text(
            'Are you sure you want to log out?',
            style: GoogleFonts.montserrat(
              color: Colors.black,
              fontWeight: FontWeight.w500,
              fontSize: 14.0,
            ),
          ),
          actions: [
            TextButton(
              child: Text(
                'Cancel',
                style: GoogleFonts.montserrat(
                  color: Colors.red,
                  fontWeight: FontWeight.w500,
                  fontSize: 12.0,
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
            ),
            TextButton(
              child: Text(
                'Logout',
                style: GoogleFonts.montserrat(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 12.0,
                ),
              ),
              onPressed: () {
                Get.offAll(() => LoginScreen());
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('You have been logged out')),
                );
              },
            ),
          ],
        );
      },
    );
  }
}
