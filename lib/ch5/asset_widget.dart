import 'package:flutter/material.dart';
import 'dart:convert'; // json 파싱 때문
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AssetWidget extends StatelessWidget {
  //asset 을 로딩하고. 그 데이터로 화면 구성 위젯을 리턴
  Widget makeTextAssectWidget(context) {
    //asset 은 파일이다. 파일 로딩. 데이터 읽기. 시간이 오래 걸릴 수 있다.
    //다 읽어 들일때까지 기다릴 수는 없다. 즉 동기적으로 처리하기 부담스럽다.
    //일을 시키고 내할일 하고 비동기
    //비동기를 위해 제공되는 Future 미래에 발생하는 데이터
    //어떤 곳에 일을 시키면 바로 Future 를 리턴. 실제 데이터는 미래에 발생한다.
    //그 Future 에서 발생하는 데이터를 화면에 출력하는 위젯이 따로 있어야 한다.
    //그게 FutureBuilder 이다.

    return FutureBuilder(
        //미래에 발생하는 데이터 지정
        // 실행 시 바로 리턴 (실제 데이터는 기다렸다. 다 받으면 알려준다.)
        future: DefaultAssetBundle.of(context)
            .loadString('assets/text/my_text.txt'),
        //화면구성. snapshot 에 실제 Future 에 의한 데이터 전달
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Text(
              'assets file data : ${snapshot.data}',
              style: TextStyle(fontSize: 20),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            );
          }
          return Text('');
        });
  }

  Widget makeJsonAssetWidget(context) {
    return FutureBuilder(
        future:
            DefaultAssetBundle.of(context).loadString('assets/text/data.json'),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            //json 문자열 파싱
            var root = json.decode(snapshot.data.toString());
            return Text('json data : ${root[0]['name']} - ${root[1]['age']}');
          }
          return Text('');
        });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image(image: AssetImage('assets/icon/user.png')),
        //위의 축약형
        Image.asset('assets/icon/user.png'),
        makeTextAssectWidget(context),
        makeJsonAssetWidget(context),
        Icon(Icons.menu),
        Icon(FontAwesomeIcons.music, size: 30, color: Colors.pink,),
      ],
    );
  }
}
