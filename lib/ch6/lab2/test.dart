import 'package:flutter/material.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    //add..................................
    return MaterialApp.router(
      routerDelegate: MyRouteDelegate(),
      routeInformationParser: MyRouteInformationParse(),
    );
  }
}
//add...................................
//라우팅 시 유지해야 하는 데이터를 담는 클래스. 개발자 임의 VO 클래스
//원하는 만큼
class MyRoutePath {
  String? id; //화면전환 시 유지되는 데이터. 없나? 있으면 1? 2? 에 따라 다르게

  //편의성을 위해서 생성자
  MyRoutePath.home() : this.id = null;
  MyRoutePath.detail(this.id);
}

//화면 전환 역할이 아니다.
//요청한 정보를 분석 후 정보 발생
class MyRouteInformationParse extends RouteInformationParser<MyRoutePath> {
  @override
  Future<MyRoutePath> parseRouteInformation(RouteInformation routeInformation) async {
    // TODO: implement parseRouteInformation
    Uri uri = routeInformation.uri;
    // url/aaa/bbb : aaa, bbb 같은 애들이 segment 이다.
    // 이게 2개 이상이면? 아니면?
    if(uri.pathSegments.length >= 2){
      var remaining = uri.pathSegments[1];
      return MyRoutePath.detail(remaining);
    } else {
      return MyRoutePath.home();
    }
  }
}

// MyRouteInformationParse 의 분석결과(MyRoutePath) 를 보면서
// 어떻게 화면이 전환이 되어야 하는지를 결정
class MyRouteDelegate extends RouterDelegate<MyRoutePath> with
  ChangeNotifier, PopNavigatorRouterDelegateMixin<MyRoutePath> {

  String? selectId;
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  // 이곳에서 리턴 시킨 정보가. 화면 전환의 상태로 유지. 저장된다.
  @override
  // TODO: implement currentConfiguration
  MyRoutePath? get currentConfiguration{
    if(selectId != null){
      return MyRoutePath.detail(selectId);
    } else {
      return MyRoutePath.home();
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //이곳에서 MyRoutePath 정보를 보면서 어떻게 navigator 가 구성이 되는지를 구현
    //리턴 시키는 Navigator 대로 화면이 나온다.
    return Navigator(
      key: navigatorKey,
      pages: [
        MaterialPage(child: HomeScreen(handlePressed)),
        if(selectId != null) MaterialPage(child: DetailScreen(selectId))
      ],
      // pop 으로 되돌아 오는 경우 실행
      onPopPage: (route, result) {
        if(!route.didPop(result)){
          return false;
        }

        selectId = null;
        // back button(appbar 의 up button) 이 눌린 것만으로 화면 전환이 안된다.
        // 무언가 데이터적으로 이전 화면이 나오게 변경해놓고 반영하라고 명령을 줘야 한다.
        notifyListeners();
        return true;
      },
    );
  }

  @override
  Future<void> setNewRoutePath(MyRoutePath configuration) async {
    // TODO: implement setNewRoutePath
    // 최초 혹은 notifyListeners() 가 호출될 때 호출. 분석 결과를 보면서 자신들의 데이터 조정 등
    if(configuration.id != null){
      selectId = configuration.id;
    }
  }

  //개발자 이벤트 콜백 함수
  //이 함수가 호출되면 화면을 갱신하고 싶다
  void handlePressed(String id){
    selectId = id;
    notifyListeners();
  }
}

class HomeScreen extends StatelessWidget {
  final ValueChanged<String> onPressed;

  HomeScreen(this.onPressed);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        color: Colors.red,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Home Screen',
                style: TextStyle(color: Colors.white, fontSize: 30),
              ),
              ElevatedButton(
                child: Text('go detail with 1'),
                onPressed: () => onPressed('1'),
              ),
              ElevatedButton(
                child: Text('go detail with 2'),
                onPressed: () => onPressed('2'),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  String? id;

  DetailScreen(this.id);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        color: Colors.green,
        child: Center(
          child: Text(
            'Detail Screen $id',
            style: TextStyle(color: Colors.white, fontSize: 30),
          ),
        ),
      ),
    );
  }
}
