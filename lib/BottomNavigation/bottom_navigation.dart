import 'package:egs/Assets/mark_my_asset.dart';
import 'package:egs/Home/home_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_floating_bottom_bar/flutter_floating_bottom_bar.dart';

class MyBottomNavigation extends StatefulWidget {
  MyBottomNavigation({Key? key}) : super(key: key);

  @override
  _MyBottomNavigationState createState() => _MyBottomNavigationState();
}

class _MyBottomNavigationState extends State<MyBottomNavigation>
    with SingleTickerProviderStateMixin {
  late int currentPage;
  late TabController tabController;
  final List<Color> colors = [
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
  ];

  @override
  void initState() {
    currentPage = 0;
    tabController = TabController(length: 5, vsync: this);
    tabController.animation!.addListener(() {
      final value = tabController.animation!.value.round();
      if (value != currentPage && mounted) {
        changePage(value);
      }
    });
    super.initState();
  }

  void changePage(int newPage) {
    setState(() {
      currentPage = newPage;
    });
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Color unselectedColor =
        colors[currentPage].computeLuminance() < 0.5
            ? Colors.black
            : Colors.white;
    return SafeArea(
      child: Scaffold(
        body: BottomBar(
          fit: StackFit.expand,
          icon:
              (width, height) => Center(
                child: IconButton(
                  padding: EdgeInsets.zero,
                  onPressed: null,
                  icon: Icon(
                    Icons.arrow_upward_rounded,
                    color: unselectedColor,
                    size: width,
                  ),
                ),
              ),
          borderRadius: BorderRadius.circular(500),
          duration: Duration(seconds: 1),
          curve: Curves.decelerate,
          showIcon: true,
          width: MediaQuery.of(context).size.width * 0.8,
          barColor:
              colors[currentPage].computeLuminance() > 0.5
                  ? Colors.black26.withOpacity(0.5)
                  : Colors.white,
          start: 2,
          end: 0,
          offset: 10,
          barAlignment: Alignment.bottomCenter,
          iconHeight: 35,
          iconWidth: 35,
          reverse: false,
          hideOnScroll: true,
          scrollOpposite: false,
          onBottomBarHidden: () {},
          onBottomBarShown: () {},
          body:
              (context, controller) => TabBarView(
                controller: tabController,
                dragStartBehavior: DragStartBehavior.down,
                physics: const BouncingScrollPhysics(),
                children: [
                  HomeScreen(),
                  AddPointsToMapScreen(),
                  Container(color: Colors.green),
                  Container(color: Colors.green),
                ],
              ),
          child: TabBar(
            dividerColor: Colors.transparent,
            indicatorPadding: const EdgeInsets.fromLTRB(6, 0, 6, 0),
            controller: tabController,
            indicator: UnderlineTabIndicator(
              borderSide: BorderSide(color: Colors.white, width: 4),
              insets: EdgeInsets.fromLTRB(16, 0, 16, 8),
            ),
            tabs: [
              SizedBox(
                height: 55,
                width: 40,
                child: Center(
                  child: Icon(
                    Icons.home,
                    color: currentPage == 0 ? Colors.white : unselectedColor,
                  ),
                ),
              ),
              SizedBox(
                height: 55,
                width: 40,
                child: Center(
                  child: Icon(
                    Icons.add_location_alt,
                    color: currentPage == 1 ? Colors.white : unselectedColor,
                  ),
                ),
              ),

              SizedBox(
                height: 55,
                width: 40,
                child: Center(
                  child: Icon(
                    Icons.pinch,
                    color: currentPage == 3 ? Colors.white : unselectedColor,
                  ),
                ),
              ),
              SizedBox(
                height: 55,
                width: 40,
                child: Center(
                  child: Icon(
                    Icons.person,
                    color: currentPage == 4 ? Colors.white : unselectedColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
