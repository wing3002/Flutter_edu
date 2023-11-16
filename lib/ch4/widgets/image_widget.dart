import 'package:flutter/material.dart';

class ImageWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Image.asset(
      'images/lab_instagram.jpg',
      width: double.infinity, // 가로 사이즈 전체


    );
  }
}