//상위 state 의 상태 값이 변경될 때 하위 state 의 라이프사이클이 어떻게 움직이는지
//상위 state 가 하위에 전파되는 방법은 여러가지가 있다. ch8에서 자세히 본다.
//편의성을 위해 유명한 provider 패키지를 이용해 상태를 전파시킬거다.

import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; // pubspec.yaml 에 디펜던시 추가했다.

void main() => runApp(ParentWidget());

class ParentWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ParentState();
  }
}

class ParentState extends State<ParentWidget> {
  //상위에서 유지하는 상태 데이터. 하위 위젯에 전파되는 데이터로 가정.
  int count = 0;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Title'),
        ),
        body: Provider.value(//이곳. value 에 등록한 값이 하위에 전파되는 값
            value: count,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('I am parent Widget'),
                  ElevatedButton(
                      onPressed: (){
                        setState(() {
                          count++;
                        });
                      },
                      child: Text('click me'),
                  ),
                  ChildWidget(),
                ],
              ),
            ),
        ),
      ),
    );
  }
}

class ChildWidget extends StatefulWidget {
  ChildWidget() {
    print('ChildWidget constructor...');
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ChildState();
  }
}

//WidgetsBindingObserver - 앱 자체의 라이프사이클 감지. 화면에 보이는 순간. 보이지 않는 순간.
class ChildState extends State<ChildWidget> with WidgetsBindingObserver {
  int count = 0;

  ChildState() {
    print('ChildState constructor...');
  }

  //state 객체가 생성되고 최초 한 번 콜
  //상태 데이터 초고화가 주 역할이다.
  //이벤트 등록. 위젯의 이벤트는 위젯에 등록시키지만. 그 이외 앱을 위해 걸어야 하는 이벤트.
  @override
  void initState() {
    // TODO: implement initState
    print('initState... count : ${count}');
    super.initState();

    //앱 상태 변경 이벤트를 감지하기 위해서
    WidgetsBinding.instance.addObserver(this);
  }

  //state 객체가 소멸될 때. 마지막 한 번 호출
  //대부분 이벤트 등록 해제
  @override
  void dispose() {
    // TODO: implement dispose
    WidgetsBinding.instance.removeObserver(this);

    super.dispose();
  }

  //일반적으로는 initState 호출 후 바로 호출되고
  //반복 호출 가능성이 있다. 상위의 계층이 변경되거나. 상위의 상태 데이터가 변경될 때 감지하라고 있다.
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    //상위 상태 데이터 획득
    count = Provider.of<int>(context);
    print('didChangeDependencies... count : ${count}');
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    print('ChildState build...');
    return Text('I am ChildState : ${count}');
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // TODO: implement didChangeAppLifecycleState
    print('Current State = ${state}');
  }
}

//최초
// I/flutter ( 6180): ChildWidget constructor...
// I/flutter ( 6180): ChildState constructor... // 얘는 위젯은 아니라서 매번 생성되는 건 아니다.
// I/flutter ( 6180): initState... count : 0
// I/flutter ( 6180): didChangeDependencies... count : 0
// I/flutter ( 6180): ChildState build...

//상태값 변경 click me 버튼 클릭 (버튼은 상위 쪽 위젯에 있다.)
// I/flutter ( 6180): ChildWidget constructor... // 위젯은 계속 생성된다.
// I/flutter ( 6180): didChangeDependencies... count : 1 // 상위 바뀌면서 콜 된다.
// I/flutter ( 6180): ChildState build...

//홈버튼 눌러서 바탕화면으로 가기
//앱의 라이프사이클 감지 로그 보기
// I/flutter ( 6180): Current State = AppLifecycleState.inactive
// D/EGL_emulation( 6180): app_time_stats: avg=12355.54ms min=1.96ms max=234546.17ms count=19
// I/flutter ( 6180): Current State = AppLifecycleState.resumed
// I/flutter ( 6180): Current State = AppLifecycleState.inactive
// D/EGL_emulation( 6180): app_time_stats: avg=1687.46ms min=686.02ms max=2688.90ms count=2
// I/flutter ( 6180): Current State = AppLifecycleState.hidden
// I/flutter ( 6180): Current State = AppLifecycleState.paused

//다시 나오게 앱 아이콘 클릭
// I/flutter ( 6180): Current State = AppLifecycleState.hidden
// I/flutter ( 6180): Current State = AppLifecycleState.inactive
// E/OpenGLRenderer( 6180): Unable to match the desired swap behavior.
// I/flutter ( 6180): Current State = AppLifecycleState.resumed // 다시 나오게 한다.
