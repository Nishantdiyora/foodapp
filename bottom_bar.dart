import 'package:flutter/material.dart';
import 'package:food_app/bottom_page/add_icon.dart';
import 'package:food_app/bottom_page/favorite.dart';
import 'package:food_app/bottom_page/home_icon.dart';
import 'package:food_app/bottom_page/profile_page.dart';

class Bottombar extends StatefulWidget {
  const Bottombar({Key? key}) : super(key: key);

  @override
  State<Bottombar> createState() => _BottombarState();
}

class _BottombarState extends State<Bottombar> {
  var selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  static const List<Widget> PageList = [
    HomeIcon(),
    Favorite(),
    AddIcon(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageList.elementAt(selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        selectedIconTheme:
            IconThemeData(shadows: [Shadow(color: Colors.red, blurRadius: 16)]),
        currentIndex: selectedIndex,
        type: BottomNavigationBarType.fixed,
        onTap: _onItemTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border_outlined), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.add), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
        ],
        selectedItemColor: Color(0xffFD0807),
        unselectedItemColor: Color(0xffD8D8D9),
      ),
    );

    // return Padding(
    //   padding: const EdgeInsets.all(18.0),
    //   child: Container(
    //     height: 65,
    //     color: Colors.white,
    //     child: Scaffold(
    //       bottomNavigationBar: GNav(
    //         gap: 10,
    //         iconSize: 25,
    //         activeColor: Color(0xffFD0807),
    //         tabBackgroundColor: Color(0xffF9E3DC),
    //         padding: EdgeInsets.all(10),
    //         tabs: [
    //           GButton(
    //             icon: Icons.home,
    //           ),
    //           GButton(
    //             icon: Icons.favorite_border_outlined,
    //           ),
    //           GButton(
    //             icon: Icons.add,
    //           ),
    //           GButton(
    //             icon: Icons.av_timer_outlined,
    //           ),
    //         ],
    //       ),
    //     ),
    //   ),
    // );
  }
}

// import 'package:flutter/material.dart';
// import 'package:food_app/bottom_page/profile_page.dart';
// import 'package:food_app/bottom_page/second_screen.dart';
//
// import 'bottom_page/add_icon.dart';
// import 'bottom_page/favorite.dart';
//
// class BottomScreen extends StatefulWidget {
//   const BottomScreen({Key? key}) : super(key: key);
//
//   @override
//   State<BottomScreen> createState() => _BottomScreenState();
// }
//
// class _BottomScreenState extends State<BottomScreen> {
//   var selectedIndex = 0;
//   static const List<Widget> PageList = [
//     SecondScreen(),
//     Favorite(),
//     AddIcon(),
//     ProfilePage(),
//   ];
//
//   void _onItemTapped(int index) {
//     setState(() {
//       selectedIndex = index;
//     });
//   }
//
//   // final drawerKey = GlobalKey<ScaffoldState>();
//   // openDrawer() {
//   //   drawerKey.currentState!.openDrawer();
//   // }
//   //
//   // closeDrawer() {
//   //   drawerKey.currentState!.closeDrawer();
//   // }
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(5.0),
//       child: Scaffold(
//         body: PageList.elementAt(selectedIndex),
//         bottomNavigationBar: BottomNavigationBar(
//           showSelectedLabels: false,
//           showUnselectedLabels: false,
//           currentIndex: selectedIndex,
//           iconSize: 25,
//           onTap: _onItemTapped,
//           type: BottomNavigationBarType.fixed,
//           elevation: 1,
//           // backgroundColor: Color(0xffebefef),
//           selectedItemColor: Color(0xffd80605),
//
//           items: [
//             BottomNavigationBarItem(
//                 icon: Icon(
//                   Icons.home,
//                   size: 10,
//                 ),
//                 label: ""),
//             BottomNavigationBarItem(
//                 icon: Icon(
//                   Icons.favorite,
//                   size: 10,
//                 ),
//                 label: ""),
//             BottomNavigationBarItem(
//                 icon: Icon(
//                   Icons.add,
//                   size: 10,
//                 ),
//                 label: ""),
//             BottomNavigationBarItem(
//                 icon: Icon(
//                   Icons.watch_later,
//                   size: 10,
//                 ),
//                 label: ""),
//           ],
//         ),
//         // key: drawerKey,
//         // drawer: Drawer(
//         //   child: ListView(
//         //     children: [
//         //       UserAccountsDrawerHeader(
//         //         accountName: Text("xyz"),
//         //         accountEmail: Text("xyz@gmail.com"),
//         //       ),
//         //       GestureDetector(
//         //         onTap: () {
//         //           closeDrawer();
//         //         },
//         //         child: Center(child: Text("close drawer")),
//         //       ),
//         //     ],
//         //   ),
//         //   // backgroundColor: Colors.green.withOpacity(0.2),
//         //   backgroundColor: Color(0xffbefef),
//         // ),
//       ),
//     );
//   }
// }
