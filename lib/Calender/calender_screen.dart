import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'package:google_fonts/google_fonts.dart' as gF;
import 'package:google_fonts/google_fonts.dart';

class AttendanceApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AttendancePage(),
    );
  }
}

class AttendancePage extends StatefulWidget {
  @override
  _AttendancePageState createState() => _AttendancePageState();
}

class _AttendancePageState extends State<AttendancePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text(
          'Attendance',
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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Calendar Section
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: CalendarCarousel<Event>(
                height: 380,
                todayBorderColor: Colors.transparent,
                todayButtonColor: Colors.deepPurpleAccent,
                markedDateIconBorderColor: Colors.transparent,
                markedDateIconBuilder:
                    (event) => Icon(
                      Icons.check_circle,
                      color: event.date.day == 16 ? Colors.red : Colors.green,
                    ),
                weekendTextStyle: gF.GoogleFonts.montserrat(
                  color: Colors.black,
                  fontSize: 14.0,
                ),
                thisMonthDayBorderColor: Colors.grey,
                headerTextStyle: gF.GoogleFonts.montserrat(
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                  fontSize: 18.0,
                ),
                weekDayBackgroundColor: Colors.grey.shade200,
                weekDayMargin: EdgeInsets.all(4),
                selectedDayBorderColor: Colors.deepPurple,
              ),
            ),
            SizedBox(height: 12.0),

            // Attendance Status Cards
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _statusCard(
                    color: Colors.lightGreen.shade100,
                    icon: Icons.check_circle,
                    text: 'Present',
                    value: '16 Days',
                  ),
                  _statusCard(
                    color: Colors.red.shade100,
                    icon: Icons.cancel,
                    text: 'Absent',
                    value: '1 Day',
                  ),
                ],
              ),
            ),
            SizedBox(height: 8.0),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _statusCard(
                    color: Colors.yellow.shade100,
                    icon: Icons.remove_circle,
                    text: 'Leave',
                    value: '0 Days',
                  ),
                  _statusCard(
                    color: Colors.purple.shade100,
                    icon: Icons.beach_access,
                    text: 'Holiday',
                    value: '4 Days',
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.0),

            // Attendance Summary Section
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Your Attendance Summary',
                style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0,
                ),
              ),
            ),
            SizedBox(height: 8.0),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  _summaryCard(
                    label: 'Total Attendance Days',
                    value: '81',
                    color: Colors.green,
                  ),
                  _summaryCard(
                    label: 'Total No. Of Days Present',
                    value: '76',
                    color: Colors.orange,
                  ),
                  _summaryCard(
                    label: 'Annual Percentage Till Current Date',
                    value: '93.83',
                    color: Colors.purple,
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.0),
          ],
        ),
      ),
    );
  }

  Widget _statusCard({
    required Color color,
    required IconData icon,
    required String text,
    required String value,
  }) {
    return Container(
      padding: EdgeInsets.all(8.0),
      width: (MediaQuery.of(context).size.width / 2) - 24,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        children: [
          Icon(icon, color: Colors.black54, size: 32.0),
          SizedBox(height: 8.0),
          Text(
            text,
            style: GoogleFonts.montserrat(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 4.0),
          Text(value, style: GoogleFonts.montserrat(color: Colors.black54)),
        ],
      ),
    );
  }

  Widget _summaryCard({
    required String label,
    required String value,
    required Color color,
  }) {
    return Card(
      elevation: 2.0,
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: EdgeInsets.all(12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: GoogleFonts.montserrat(fontWeight: FontWeight.bold),
            ),
            CircleAvatar(
              radius: 20,
              backgroundColor: color,
              child: Text(
                value,
                style: GoogleFonts.montserrat(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
