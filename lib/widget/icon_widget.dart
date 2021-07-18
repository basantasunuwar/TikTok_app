import 'package:flutter/material.dart';
import 'package:tiktok_app/theme/colors.dart';

Widget getAlbum(albumImg) {
  return Container(
      height: 55,
      width: 55,
      child: Stack(
        children: [
          Container(
              width: 55,
              height: 60,
              decoration: BoxDecoration(shape: BoxShape.circle, color: black)),
          Center(
            child: Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: NetworkImage(
                          (albumImg),
                        ),
                        fit: BoxFit.cover))),
          )
        ],
      ));
}

Widget getIcon(icon, size, count) {
  return Column(
    children: [
      Icon(icon, color: white, size: size),
      SizedBox(height: 5),
      Text(count, style: TextStyle(color: white, fontWeight: FontWeight.w500))
    ],
  );
}

////////*****PROFILE IMAGE PART THAT NEED TO BE CHANGED IN LATER TIME */
Widget getProfile(profileImg) {
  return Container(
      height: 55,
      width: 55,
      child: Stack(
        children: [
          Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                  border: Border.all(color: white),
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: NetworkImage(profileImg), fit: BoxFit.cover))),
          Positioned(
              left: 18,
              bottom: -5,
              child: Container(
                  width: 20,
                  height: 20,
                  decoration:
                      BoxDecoration(shape: BoxShape.circle, color: primary),
                  child:
                      Center(child: Icon(Icons.add, color: white, size: 15))))
        ],
      ));
}
