import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:shopdata/Admine/adminepost.dart';
import 'package:shopdata/widget/NavigatorService.dart';
import 'package:shopdata/widget/firstscreen.dart';
import 'package:shopdata/widget/secondscreen.dart';

import '../profile/Classswidget.dart';

class BodyPage extends StatefulWidget {
  BodyPage({Key? key}) : super(key: key);

  @override
  State<BodyPage> createState() => _BodyPageState();
}

class _BodyPageState extends State<BodyPage> {
  List<Widget> PageRoute = [ SecondScreen(),AdminePost(), setting()];

  int currentindex = 0;

  NavigatorService _navigatorService = NavigatorService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageRoute.elementAt(currentindex),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        // ignore: prefer_const_literals_to_create_immutables
        items: <BottomNavigationBarItem>[
          const BottomNavigationBarItem(label: 'Home', icon: Icon(Icons.abc)
              // icon: IconButton(
              //   icon: Icon(Icons.abc),
              //   onPressed: () {},
              // ),
              ),
          const BottomNavigationBarItem(label: 'Shop', icon: Icon(Icons.abc)
              // icon: IconButton(
              //   icon: Icon(Icons.abc),
              //   onPressed: () {},
              // ),
              ),
          const BottomNavigationBarItem(
            icon: const Icon(Icons.abc),
            label: 'Setting',
            // icon: IconButton(
            //   icon: Icon(Icons.abc),
            //   onPressed: () {
            //     _navigatorService.navigatorPage(setting());
            //   },
            // ),
          ),
        ],
        currentIndex: currentindex,
        selectedItemColor: Colors.amber,
        unselectedItemColor: Colors.black,
        onTap: (int index) {
          currentindex = index;
          setState(() {
            currentindex = index;
            // if (currentindex == 0) {
            //  // PageRoute.elementAt(currentindex);
            // } else if (currentindex == 1) {
            //   // PageRoute.elementAt(currentindex);
            // } else if (currentindex == 2) {
            //    //PageRoute.elementAt(currentindex);
            // }
          });
        },
      ),
    );
  }
}
