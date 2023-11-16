import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  //위젯이 화면에 나올 때 위젯의 화면을 결정하기 위해서 자동 호출된다.
  //이 함수에서 리턴되는 부분이 이 위젯의 화면이다.
  @override
  Widget build(BuildContext context) {
    //MaterialApp 위젯을 위젯 트리의 루트에 위치시키는 것이 필수는 아니지만
    //거의 대부분 materialapp 에서 제공되는 테마설정, 화면 전환등의 도움을 받아서 작성하다 보니
    //루트 위젯은 materialApp 을 사용하고 있다.
    return MaterialApp(
      //Scaffold 필수는 아니지만 대부분 - 화면 테마
      //화면의 기본적인 구조를 구성해주는 역할 - appbar, fab, drawer 등등
      home: Scaffold(
          appBar: AppBar(
            title: Text('First Test'),
          ),
          body: Center(
            child: Column(
              children: [
                MyStatelessWidget(),
                MyStatefulWidget(),
              ],
            ),
          ),
      ),
    );
  }
}

class MyStatelessWidget extends StatelessWidget {
  //state, 상태 표현이 안되는 것 뿐이지 얼마든지 변수, 함수 선언 가능하다.
  bool favorited = false;
  int favoriteCount = 10;

  void toggleFavorite() {
    print('stateless... toggleFavorite');
    if (favorited) {
      favoriteCount -= 1;
      favorited = false;
    } else {
      favoriteCount += 1;
      favorited = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    print('stateless... build..');
    return Row(
      children: [
        IconButton(
          onPressed: toggleFavorite,
          icon: (favorited ? Icon(Icons.star) : Icon(Icons.star_border)),
          color: Colors.red,
        ),
        Container(
          child: Text('$favoriteCount'),
        ),
      ],
    );
  }
}

// StatefulWidget 은 거의 대부분 이런 형태로 단순하다
class MyStatefulWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyState();
  }
}

class MyState extends State<MyStatefulWidget> {
  bool favorited = false;
  int favoriteCount = 10;

  void toggleFavorite() {
    print('stateful... toggleFavorite');
    //state 의 상태값을 변경하고 변경된 것으로 화면 갱신이 되려면
    //즉 re-rendering 하려면 setState() 함수 호출이 필요하다.
    //setState() 함수 호출이 끝나면 알아서 build 함수가 다시 호출된다.

    //setState() 의 매개변수는 개발자 함수이다. 개발자 함수가 끝나면 re-rendering 한다.
    //그래서 대부분 화면 갱신을 위한 데이터 변경은 setState() 에 지정된 개발자 함수내에서 한다.
    setState(() {
      if (favorited) {
        favoriteCount -= 1;
        favorited = false;
      } else {
        favoriteCount += 1;
        favorited = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    print('stateful... build..');
    return Row(
      children: [
        IconButton(
          onPressed: toggleFavorite,
          icon: (favorited ? Icon(Icons.star) : Icon(Icons.star_border)),
          color: Colors.red,
        ),
        Container(
          child: Text('$favoriteCount'),
        ),
      ],
    );
  }
}