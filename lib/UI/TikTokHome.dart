import 'package:flutter/material.dart';
import 'package:tiktok_app/TikTokIcons.dart';
import 'package:tiktok_app/UI/homepage.dart';
import 'package:tiktok_app/theme/colors.dart';
import 'package:tiktok_app/widget/upload_icons.dart';

class TikTokHome extends StatefulWidget {
  @override
  _TikTokHomeState createState() => _TikTokHomeState();
}

class _TikTokHomeState extends State<TikTokHome> {
  int pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: getFooter(),
      body: getBody(),
    );
  }

  Widget getBody() {
    return IndexedStack(
      index: pageIndex,
      children: [
        HomePage(),
        Center(
          child: Text("Discover",
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: black,
              )),
        ),
        Center(
          child: Text("Upload",
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: black,
              )),
        ),
        Center(
          child: Text("All Activity",
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: black,
              )),
        ),
        Center(
          child: Text("Profile",
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: black,
              )),
        ),
        getActivityMenu(),
      ],
    );
  }

  Widget getFooter() {
    var size = MediaQuery.of(context).size;
    List buttomItems = [
      {'icon': TikTokIcons.home, 'label': 'Home', 'isIcon': true},
      {'icon': TikTokIcons.search, 'label': 'Discover', 'isIcon': true},
      {'icon': '', 'label': '', 'isIcon': false},
      {'icon': TikTokIcons.heart, 'label': 'Inbox', 'isIcon': true},
      {'icon': TikTokIcons.profile, 'label': 'Me', 'isIcon': true},
    ];
    return Container(
        width: double.infinity,
        height: 80.0,
        decoration: BoxDecoration(
          color: appBgColor,
        ),
        child: Padding(
          padding: const EdgeInsets.only(
            left: 20.0,
            right: 20.0,
            top: 10,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(buttomItems.length, (index) {
              return buttomItems[index]['isIcon']
                  ? InkWell(
                      onTap: () {
                        selectedIndex(index);
                      },
                      child: Column(
                        children: [
                          Icon(buttomItems[index]['icon'], color: Colors.white),
                          SizedBox(height: 5),
                          Text(buttomItems[index]['label'],
                              style: TextStyle(
                                color: white,
                                fontSize: 10,
                              ))
                        ],
                      ),
                    )
                  : InkWell(
                      onTap: () {
                        selectedIndex(index);
                      },
                      child: UploadIcon());
            }),
          ),
        ));
  }

  void selectedIndex(index) {
    setState(() {
      pageIndex = index;
    });
  }

  Widget getActivityMenu() {
    return Positioned(
      left: 0,
      bottom: 0,
      child: Text("hello there", style: TextStyle(fontSize: 34)),
    );
  }
}
