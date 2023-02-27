import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:shopdata/data/image.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shopdata/data/regerstion.dart';
import 'package:shopdata/mordern/dataservice.dart';

class AdminePost extends StatefulWidget {
  AdminePost({Key? key}) : super(key: key);

  @override
  State<AdminePost> createState() => _AdminePostState();
}

class _AdminePostState extends State<AdminePost> {
  File? postimage;
  DatabaseService _databaseService = DatabaseService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Post'),
      ),
      body: Container(
        child: Column(
          children: [
            //First Row
            Center(
              child: Container(
                width: 100,
                height: 100,
                margin: EdgeInsets.only(top: 20, bottom: 20),
                decoration: BoxDecoration(
                    border: Border.all(
                  width: 1,
                )),
                child: (postimage != null)
                    ? Image.file(
                        postimage!,
                        fit: BoxFit.contain,
                      )
                    : IconButton(
                        onPressed: () async {
                          File? image = await choseimage();
                          if (image != null) {
                            setState(() {
                              postimage = image;
                            });
                          }
                        },
                        icon: Icon(Icons.add)),

                //(postimage !=null)?Image.file(postimage!):SizedBox(),
              ),
            ),
            //Second Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                    width: 100,
                    child: TextField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(), hintText: 'Prize'),
                    )),
                Container(
                    width: 100,
                    child: TextField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(), hintText: 'Name'),
                    )),
                Container(
                    width: 100,
                    child: TextField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(), hintText: 'Prize'),
                    )),
              ],
            ),
            IconButton(onPressed: postadd, icon: Icon(Icons.upload))
          ],
        ),
      ),
    );
  }

  Future<void> postadd() async {
    String? url;
    if (postimage != null) {
      url = await uplodimage(postimage!);
    }
    _databaseService.upimage().add(images(image: url)).then((value) => value).catchError((e){});
  }
}
