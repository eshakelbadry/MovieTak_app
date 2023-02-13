import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:movie_info/constants.dart';
import 'package:movie_info/screens/search_screen/search.dart';
import 'package:movie_info/screens/watchListScreen/watch_list_screen.dart';
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
    // SettingsPage()
  ];

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
          // appBar: AppBar(
          //   elevation: 0,
          //   automaticallyImplyLeading: false,
          //   title: Text('Welcome To MovieX'),
          //   actions: [
          //     IconButton(
          //       onPressed: () {},
          //       icon: Icon(Icons.light_mode_rounded),
          //     )
          //   ],
          // ),
          // backgroundColor: kBackgroundColor,
          bottomNavigationBar: ConvexAppBar(
            items: const [
              TabItem(
                  icon: Icon(Icons.home_outlined, color: Colors.black),
                  title: 'Home'),
              TabItem(
                  icon: Icon(Icons.manage_search_outlined, color: Colors.black),
                  title: 'Search'),
              // TabItem(
              //   icon: Icon(Icons.favorite_border_outlined, color: Colors.black),
              //   title: 'WatchList',

                // backgroundColor: Colors.red
              // ),
              // TabItem(
              //     icon: Icon(Icons.settings_applications_sharp), title: 'Settings'
              //     // backgroundColor: Colors.green
              //     ),
            ],
            initialActiveIndex: selectedIndex,

            //      selectedItemColor: kPrimaryColor,
            // unselectedItemColor: Colors.grey,

            onTap: ((index) {
              setState(() {
                selectedIndex = index;
              });
            }),
            backgroundColor: kBottomNavigationBarColor,
            height: 60,
            // color: Colors.amber,
            // shadowColor: Colors.brown,
            // style: TabStyle.textIn,
          ),
          body: pages.elementAt(selectedIndex)),
    );
  }
}
