import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:line_icons/line_icons.dart';
import 'package:shopdata/mordern/dataservice.dart';
import 'package:shopdata/widget/NavigatorService.dart';

import '../data/regerstion.dart';

class Profile {
  String? Location;

  //List<QueryDocumentSnapshot<RegisterData>> get = snapshot.data!.docs;
  // Profile();
  Widget PhonePage() {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.white),
      // body: _phoneEdite(),
    );
  }

  Widget phoneEdite(String phone) {
    bool edit = false;
    return Scaffold(
      appBar: AppBar(),
      body: ListTile(
          // trailing: Text('helo'),
          title: Text('Phone Number'),
          //leading: Text('ll'),
          subtitle: Text('data')),
    );
  }
}

DatabaseService _databaseService = DatabaseService();
NavigatorService _navigatorService = NavigatorService();
Widget setting() {
  return Scaffold(
    appBar: AppBar(title: Text('Setting')),
    body: StreamBuilder<QuerySnapshot<RegisterData>>(
      stream: _databaseService.getdata(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<QueryDocumentSnapshot<RegisterData>> get = snapshot.data!.docs;
          return ListView.builder(
              itemCount: get.length,
              itemBuilder: ((context, index) {
                QueryDocumentSnapshot<RegisterData> indeget = get[index];
                return Container(
                  child: Column(
                    children: [
                      Center(
                        child: Column(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 40, bottom: 20),
                              child: CircleAvatar(
                                radius: 50,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(indeget.data().FirstName ?? ''),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(indeget.data().LastName ?? '')
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(indeget.data().phonenumber ?? '')
                          ],
                        ),
                      ),

                      GestureDetector(
                        onTap: () {
                          _navigatorService.navigatorPage(Profile()
                              .phoneEdite(indeget.data().phonenumber ?? ''));
                        },
                        child: ListTile(
                          leading: Icon(Icons.settings),
                          title: Text('Profile'),
                        ),
                      ),
                      // GestureDetector(
                      //   child: ListTile(
                      //     leading: Icon(Icons.settings),
                      //     title: Text('Profile'),
                      //   ),
                      // ),
                      GestureDetector(
                        child: ListTile(
                          leading: Icon(Icons.wechat),
                          title: Text('FAQ & Help'),
                        ),
                      ),
                    ],
                  ),
                );
              }));
          print('hasdata');
        } else if (snapshot.hasError) {
          print('has erro');
        }
        return Container();
      },
    ),
  );
}

Widget imageslide() {
  return Container(
    //  color: Colors.amber,
    child: StreamBuilder<QuerySnapshot<images>>(
      stream: _databaseService.getimage(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<QueryDocumentSnapshot<images>> getimg = snapshot.data!.docs;

          return Column(
            children: [
              CarouselSlider.builder(
                  itemCount: getimg.length,
                  itemBuilder: (context, index, realIndex) {
                    QueryDocumentSnapshot<images> url = getimg[index];
                    return Container(
                      //color: Colors.amber,
                      width: 300,
                      margin: EdgeInsets.only(left: 30, right: 30),
                      padding: EdgeInsets.only(
                        top: 10,
                      ),
                      child: Image.network(
                        url.data().image!,
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                    );
                  },
                  options: CarouselOptions(
                      viewportFraction: 0.7, height: 200, autoPlay: true)),

              //icon widget
              IconGroup()
            ],
          );
        } else if (snapshot.hasError) {
          return Text('data');
        }
        return CircularProgressIndicator(
          strokeWidth: 2.0,
        );
      },
    ),
  );
}

Widget IconGroup() {
  List<Icon> icons = [Icon(LineIcons.values['code'])];
  final j = List<int>.generate(icons.length, (index) => index);
  ScrollController c =
      ScrollController(debugLabel: 'h', initialScrollOffset: 1.0);
  return Container(
    // height: 500,
    // color: Colors.black,
    margin: EdgeInsets.only(top: 20),
    child: GridView.builder(
      shrinkWrap: true,
      // reverse: true,
      // scrollDirection: Axis.horizontal,
      controller: c,
      physics: AlwaysScrollableScrollPhysics(),
      itemCount: 10,

      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisSpacing: 10, crossAxisSpacing: 10, crossAxisCount: 6),
      itemBuilder: (context, index) {
        return Container(
            width: 100,
            height: 100,
            // color: Colors.amber,
            child: Card());
      },
    ),
  );
}

Widget itemPage() {
  return StreamBuilder<QuerySnapshot<images>>(
    stream: _databaseService.getimage(),
    builder: (context, snapshot) {
      if (snapshot.hasData) {
        List<QueryDocumentSnapshot<images>> pageimg = snapshot.data!.docs;
        return ListView.builder(
          physics: AlwaysScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: pageimg.length,
          itemBuilder: (context, index) {
            QueryDocumentSnapshot<images> pagurlimg = pageimg[index];
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Card(
                  child: Container(
                    //constraints: BoxConstraints.tight(Size.infinite),
                    //height: 100,
                    width: 180,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.network(
                          pagurlimg.data().image!,
                          fit: BoxFit.cover,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 10),
                          child: Text(
                            'shoe',
                          ),
                        ),
                        Divider(
                          height: 20,
                          thickness: 2,
                        ),
                        Container(
                            padding: EdgeInsets.only(left: 10, bottom: 10),
                            child: Row(
                              children: [
                                Text('\$540'),
                                SizedBox(
                                  width: 10,
                                ),
                                Row(
                                  children: [Icon(Icons.star), Text('4.9')],
                                )
                              ],
                            ))
                      ],
                    ),
                  ),
                ),
                Card(
                  child: Container(
                    //  height: 100,
                    width: 180,
                  ),
                )
              ],
            );
          },
        );
      }
      return CircularProgressIndicator();
    },
  );
}
