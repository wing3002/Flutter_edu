import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  //화면을 구성하기 위한 위젯 목록을 만드는 개발자 배열
  List<Widget> widgets = [
    //타입이 다른 위젯 여러개. 위젯 키 명시하지 않고 테스트
    //state 객체가 widget 과 연결의 기본은 타입이다. 타입이 다른
    //위젯 객체가 여러개 있음으로 key 를 주지 않아도 문제 없다.
    // MyItemWidget(Colors.red),
    // MyItemWidget2(Colors.blue),

    //동일한 타입 위젯 여러개 테스트. state 객체 여러 개 살아있고
    //위젯과 연결되어야 하는데 타입으로 식별이 안되어 그냥 순서로 한다. (순서는 빨간, 파랑)
    // MyItemWidget(Colors.red),
    // MyItemWidget(Colors.blue),

    //이때 key 를 주면 된다.
    MyItemWidget(Colors.red, key: UniqueKey()),
    MyItemWidget(Colors.blue, key: UniqueKey()),
  ];

  //이벤트 개발자 함수. 위젯의 출력 순서를 바꾸는 역할
  onChange() {
    setState(() {
      widgets.insert(1, widgets.removeAt(0));
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('key text'),),
        body: Column(
          children: [
            Row(children: widgets,),
            ElevatedButton(onPressed: onChange, child: Text('toggle'))
          ],
        )
      ),
    );
  }
}

class MyItemWidget extends StatefulWidget {
  Color color;

  MyItemWidget(this.color, {Key? key}): super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyItemState(color);
  }
}

class MyItemState extends State<MyItemWidget> {
  Color color;

  MyItemState(this.color);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Expanded(
      child: Container(
        color: color,
        width: 150,
        height: 150,
      ),
    );
  }
}

class MyItemWidget2 extends StatefulWidget {
  Color color;

  MyItemWidget2(this.color, {Key? key}): super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyItemState2(color);
  }
}

class MyItemState2 extends State<MyItemWidget2> {
  Color color;

  MyItemState2(this.color);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Expanded(
      child: Container(
        color: color,
        width: 150,
        height: 150,
      ),
    );
  }
}