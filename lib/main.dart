import 'package:flutter/material.dart';
import 'package:tiktok_app/UI/TikTokHome.dart';

void main(List<String> args) {
  runApp(TikTokApp());
}

class TikTokApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TikTokApp',
      debugShowCheckedModeBanner: false,
      home: TikTokHome(),
    );
  }
}
