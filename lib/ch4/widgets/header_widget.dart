import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

//popup menu 구성 문자열
const List<String> choices = <String>['신고', '게시물 알림 설정', '링크 복사'];

class HeaderWidget extends StatelessWidget {
  //popup menu click event callback
  void select(String choice) {
    Fluttertoast.showToast(
        msg: choice,
        // 화며네 뜨는 문자열
        toastLength: Toast.LENGTH_SHORT,
        // 자동으로 사라진다. 사라지는 시간
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.black,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Row(
      children: [
        Image.asset('images/lab_instagram_icon_0.jpg'),
        //위젯이 나오는 특정 영역을 위한 위젯. 마진, 패딩, 보더, 백그라운드 등
        Container(
          padding: EdgeInsets.only(left: 16),
          child: Text(
            'instagram',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ),
        Spacer(), // 여백만 차지하는 위젯
        PopupMenuButton(
            onSelected: select,
            //popup menu 를 구성하기 위해서 자동 호출
            itemBuilder: (BuildContext context) {
              return choices.map<PopupMenuItem<String>>((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice),
                );
              }).toList();
            }),
      ],
    );
  }
}
