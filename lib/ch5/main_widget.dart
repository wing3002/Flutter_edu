import 'package:flutter/material.dart';
import 'package:flutter_lab/ch5/form_widget.dart';
import 'asset_widget.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  int selectedIndex = 0; // 선택된 탭 인덱스

  List<Widget> widgets = <Widget>[
    AssetWidget(),
    FormWidget(),
  ];

  onTab(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    //MaterialApp 머티리얼 디자인에 입각한 여러가지 화면 기법을 제공
    //머티리얼 디자인 : 구글에서 만든 디자인 철학 2015년 발표. 실사물 체계.
    //안드로이드에 가장 처음 적용 되었다.
    //전체 프론트에서 유용하다고 해서 많이들 사용중이다.
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.pink,
        //appbar 에 이미지까지 올릴껀데 그러면 아래 칼라가 안보이긴 한다
        appBarTheme: AppBarTheme(
            backgroundColor: Colors.orange, foregroundColor: Colors.black),
      ),
      home: Scaffold(
        appBar: AppBar(
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(48.0),
            child: Container(
              height: 48.0,
              alignment: Alignment.center,
              child: Text('AppBar Bottom Title'),
            ),
          ),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/big.jpg'),
                fit: BoxFit.fill,
              ),
            ),
          ),
          title: Text('Widget Test'),
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.add_alert)),
            IconButton(onPressed: () {}, icon: Icon(Icons.navigate_next)),
          ],
        ),
        // body: AssetWidget(),
        body: Center(
          child: widgets.elementAt(selectedIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.shifting,
          //선택된 버튼에 따라 백그라운드 칼라 변경
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'First',
                backgroundColor: Colors.green),
            BottomNavigationBarItem(
                icon: Icon(Icons.business),
                label: 'Second',
                backgroundColor: Colors.red),
          ],
          currentIndex: selectedIndex,
          selectedItemColor: Colors.amber,
          onTap: onTab,
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                child: Text('Drawer Header'),
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
              ),
              ListTile(
                title: Text('Item1'),
              ),
              ListTile(
                title: Text('Item2'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
