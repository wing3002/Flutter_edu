import 'package:flutter/material.dart';
import 'widgets/header_widget.dart';
import 'widgets/image_widget.dart';
import 'widgets/icons_widget.dart';
import 'widgets/contents_widget.dart';

void main() => runApp(MyApp());

//fluttertoast 에서 android minSdk 버전을 최소21을 요구한다
//현 시점 플러터 기본 minSdk 는 19로 지정
//minSdk 는 앱에서 지원하는 안드로이드 최소 버전이다
//build.gradle - 안드로이드 빌드 환경파일. android-app-build.gradle

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Layout Test'),
        ),
        //flutter 앱의 화면을 구성하다가 세로, 가로방향 화면을 벗어나는 경우
        //경고의 의미로 노란/검정 패턴이 출력된다
        //스크롤을 신경쓰지 않았어의 이미. 스크롤 준비하면 된다
        //하나의 위젯을 지칭해서 그 위젯의 스크롤을 지원 - SingleChildScrollView
        //여러 위젯을 지칭. 스크롤 - ListView
        body: SingleChildScrollView(
          child: Column(
            children: [
              HeaderWidget(),
              ImageWidget(),
              IconsWidget(),
              ContentsWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
