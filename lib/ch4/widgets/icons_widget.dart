import 'package:flutter/material.dart';

class IconsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: EdgeInsets.all(8),
      child: Row(
        children: [
          Image.asset('images/lab_instagram_icon_1.jpg', width: 35,),
          Image.asset('images/lab_instagram_icon_2.jpg', width: 35,),
          Image.asset('images/lab_instagram_icon_3.jpg', width: 35,),
          Spacer(),
          Image.asset('images/lab_instagram_icon_4.jpg', width: 35,),
        ],
      ),
    );
  }
}
