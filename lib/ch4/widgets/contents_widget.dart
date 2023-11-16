import 'package:flutter/material.dart';

class ContentsWidget extends StatelessWidget {
  int count = 100;
  String id = 'instagram';
  String content =
      '동해물과 백두산이 마르고 닳도록 하나님이 보우하사 우리나라 만세동해물과 백두산이 마르고 닳도록 하나님이 보우하사 우리나라 만세동해물과 백두산이 마르고 닳도록 하나님이 보우하사 우리나라 만세동해물과 백두산이 마르고 닳도록 하나님이 보우하사 우리나라 만세동해물과 백두산이 마르고 닳도록 하나님이 보우하사 우리나라 만세동해물과 백두산이 마르고 닳도록 하나님이 보우하사 우리나라 만세동해물과 백두산이 마르고 닳도록 하나님이 보우하사 우리나라 만세동해물과 백두산이 마르고 닳도록 하나님이 보우하사 우리나라 만세동해물과 백두산이 마르고 닳도록 하나님이 보우하사 우리나라 만세동해물과 백두산이 마르고 닳도록 하나님이 보우하사 우리나라 만세동해물과 백두산이 마르고 닳도록 하나님이 보우하사 우리나라 만세동해물과 백두산이 마르고 닳도록 하나님이 보우하사 우리나라 만세동해물과 백두산이 마르고 닳도록 하나님이 보우하사 우리나라 만세동해물과 백두산이 마르고 닳도록 하나님이 보우하사 우리나라 만세동해물과 백두산이 마르고 닳도록 하나님이 보우하사 우리나라 만세동해물과 백두산이 마르고 닳도록 하나님이 보우하사 우리나라 만세동해물과 백두산이 마르고 닳도록 하나님이 보우하사 우리나라 만세';

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('좋아요 $count 개'),
        //Text 위젯에 의해 출력되는 문자열의 일부분의 ui 효과를 주고 싶을 때
        //문자열 부분 부분에 서식 설 때
        Text.rich(
          TextSpan(children: [
            TextSpan(text: id, style: TextStyle(fontWeight: FontWeight.bold)),
            TextSpan(text: content),
          ]),
        ),
      ],
    );
  }
}
