import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class AttendanceScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text(
          'Homework',
          style: GoogleFonts.montserrat(
            color: Colors.white,
            fontSize: 15.0,
            fontWeight: FontWeight.w600,
          ),
        ),
        leading: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back, size: 25, color: Colors.white),
        ),
      ),
      body: DefaultTabController(
        length: 2,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 40,
                width: Get.width * 0.6,
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: TabBar(
                  indicatorSize: TabBarIndicatorSize.tab,

                  dividerColor: Colors.transparent,
                  indicator: BoxDecoration(
                    color: Colors.deepPurple,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.black,
                  tabs: [Tab(text: 'Pending'), Tab(text: 'Completed')],
                ),
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  HomeworkTab(),
                  Center(child: Text('No completed homework')),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HomeworkTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(8.0),
      children: [
        homeworkCard(
          subject: 'Hindi',
          teacher: 'NITYA KUMAR',
          title: 'HW',
          description: 'Do pg 71 and 72 in grammar book.',
          attachedFile: false,
          status: 'Pending',
          colors: [Colors.green, Colors.greenAccent],
          date: '26 Sep, 2022 | 15:07',
        ),
        homeworkCard(
          subject: 'Hindi',
          teacher: 'NITYA KUMAR',
          title: 'CW',
          description: 'In grammar notebook.',
          attachedFile: true,
          status: 'Pending',
          colors: [Colors.red, Colors.deepOrange],
          date: '26 Sep, 2022 | 15:07',
        ),
        homeworkCard(
          subject: 'Mathematics',
          teacher: 'VASUNDHARA',
          title: 'Ch 7',
          description: 'Complete chapter 7 exercises.',
          attachedFile: false,
          status: 'Pending',
          colors: [Colors.deepPurple, Colors.deepPurpleAccent],
          date: '26 Sep, 2022 | 15:07',
        ),
      ],
    );
  }

  Widget homeworkCard({
    required String subject,
    required String teacher,
    required String title,
    required String description,
    bool attachedFile = false,
    required String status,
    required List<Color> colors,
    required String date,
  }) {
    return Card(
      color: Colors.white,
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(5),
                topRight: Radius.circular(5),
              ),
              gradient: LinearGradient(colors: colors),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  subject,
                  style: GoogleFonts.montserrat(
                    color: Colors.white,
                    fontSize: 15.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Row(
                  children: [
                    Icon(Icons.person, color: Colors.white, size: 20),
                    Text(
                      teacher,
                      style: GoogleFonts.montserrat(
                        color: Colors.white,
                        fontSize: 15.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15.0),
            margin: EdgeInsets.only(top: 8.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Text(
                        'Title',
                        style: GoogleFonts.montserrat(
                          color: Colors.grey,
                          fontWeight: FontWeight.w500,
                          fontSize: 15.0,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Text(
                        title,
                        style: GoogleFonts.montserrat(
                          color: Colors.black,
                          fontSize: 15.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 4.0),
                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Text(
                        'Assigned On:',
                        style: GoogleFonts.montserrat(
                          color: Colors.grey,
                          fontWeight: FontWeight.w500,
                          fontSize: 15.0,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Text(
                        date,
                        style: GoogleFonts.montserrat(
                          color: Colors.black,
                          fontSize: 15.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 4.0),
                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Text(
                        'Due On:',
                        style: GoogleFonts.montserrat(
                          color: Colors.grey,
                          fontWeight: FontWeight.w500,
                          fontSize: 15.0,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Text(
                        'N/A | N/A',
                        style: GoogleFonts.montserrat(
                          color: Colors.black,
                          fontSize: 15.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 4.0),
                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Text(
                        'Attached File:',
                        style: GoogleFonts.montserrat(
                          color: Colors.grey,
                          fontWeight: FontWeight.w500,
                          fontSize: 15.0,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child:
                          attachedFile == true
                              ? Row(
                                children: [
                                  Icon(
                                    Icons.download,
                                    color: Colors.blue,
                                    size: 25.0,
                                  ),
                                  SizedBox(width: 5.0),
                                  Text(
                                    'Download File',
                                    style: GoogleFonts.montserrat(
                                      color: Colors.blue,
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              )
                              : Text(
                                'N/A',
                                style: GoogleFonts.montserrat(
                                  color: Colors.black,
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                    ),
                  ],
                ),
                SizedBox(height: 4.0),
                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Text(
                        'Description:',
                        style: GoogleFonts.montserrat(
                          color: Colors.grey,
                          fontWeight: FontWeight.w500,
                          fontSize: 15.0,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Text(
                        description,
                        style: GoogleFonts.montserrat(
                          color: Colors.black,
                          fontSize: 15.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 4.0),
                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Text(
                        'Status:',
                        style: GoogleFonts.montserrat(
                          color: Colors.grey,
                          fontWeight: FontWeight.w500,
                          fontSize: 15.0,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Row(
                        children: [
                          OutlinedButton(
                            onPressed: () {
                              // Handle button press
                            },
                            style: OutlinedButton.styleFrom(
                              side: BorderSide(
                                width: 1.5,
                                color: Colors.red,
                              ), // Border width and color
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                  8.0,
                                ), // Rounded corners
                              ),
                              padding: EdgeInsets.symmetric(horizontal: 10.0),
                            ),
                            child: Text(
                              'Pending',
                              style: GoogleFonts.montserrat(
                                color: Colors.red,
                                fontWeight: FontWeight.w600,
                                fontSize: 15.0,
                              ), // Text color
                            ),
                          ),
                          SizedBox(width: 20.0),
                          MaterialButton(
                            onPressed: () {},
                            color: Colors.deepPurpleAccent,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            child: Text(
                              'Submit',
                              style: GoogleFonts.montserrat(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 15.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.0),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
