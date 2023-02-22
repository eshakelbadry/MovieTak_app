import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter_offline/flutter_offline.dart';
import '../../constants.dart';
import '../../helper.dart';
import '../search_screen/search.dart';
import '../watchListScreen/watch_list_screen.dart';
import '../../models/movie_model.dart';
import 'home_body.dart';

class HomeLayOut extends StatefulWidget {
  HomeLayOut({super.key});

  @override
  State<HomeLayOut> createState() => _HomeLayOutState();
}

class _HomeLayOutState extends State<HomeLayOut> {
  int selectedIndex = 0;

  List<Widget> pages = <Widget>[
    HomeBody(),
    SearchPage(),
    // WatchListPage(),
  ];

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: ConvexAppBar(
          items: const [
            TabItem(
                icon: Icon(Icons.home_outlined, color: Colors.black),
                title: 'Home'),
            TabItem(
                icon: Icon(Icons.manage_search_outlined, color: Colors.black),
                title: 'Search'),
          ],
          initialActiveIndex: selectedIndex,
          onTap: ((index) {
            setState(() {
              selectedIndex = index;
            });
          }),
          backgroundColor: kBottomNavigationBarColor,
          height: 60,
        ),
        body: OfflineBuilder(
          connectivityBuilder: (
            BuildContext context,
            ConnectivityResult connectivity,
            Widget child,
          ) {
            final bool connected = connectivity != ConnectivityResult.none;
            return connected
                ? pages.elementAt(selectedIndex)
                : const NoInternetErrorWidget();
          },
          child: const CircularProgressIndicator(),
        ),
      ),
    );
  }
}
