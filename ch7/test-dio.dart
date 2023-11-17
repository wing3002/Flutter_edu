import 'dart:async';
import 'dart:ffi';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  //서버 결과 데이터
  List datas = [];

  //ListView 에 등록하여 유저 스크롤 이벤트 처리가 가능하다
  ScrollController controller = ScrollController();

  //서버 요청 정보
  int page = 1;
  int seed = 1;

  //서버 요청 역할
  Future<List<dynamic>> dioTest() async {
    try{
      var dio = Dio(BaseOptions(
        connectTimeout: Duration(seconds: 5),
        receiveTimeout: Duration(seconds: 5),
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
          HttpHeaders.acceptHeader: 'application/json'
        }
      ));

      //네트워킹 요청
      //시간이 오래 걸리는 작업. 기다려라. await 함수 내에서 await 를 사용 했다면
      //함수 선언시에 async 등록해야한다.
      Response<dynamic> response = await dio.get(
        'https://randomuser.me/api/?seed=${seed}&page=${page}&results=20'
      );

      //print(response.data['results']);

      return response.data['results'];
    }catch(e){
      print(e);
    }

    return [];
  }

  //ListView 스크롤 이벤트 콜백
  _scrollListener() async {
    //마지막까지 스크롤이 되었는지?
    if(controller.offset >= controller.position.maxScrollExtent &&
        !controller.position.outOfRange){
      page++;
      List result = await dioTest();

      //화면 갱신
      setState(() {
        datas.addAll(result);
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.addListener(_scrollListener);
    //초기 데이터 획득
    dioTest().then((value){
      setState(() {
        datas = value;
      });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }

  //ListView, refresh 이벤트 발생 시 호출
  Future<void> _refresh() async {
    page = 1;
    seed++;

    List result = await dioTest();
    setState(() {
      datas = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Test'),
        ),
        body: RefreshIndicator(
          onRefresh: _refresh,
          child: ListView.separated(
            controller: controller,
            itemCount: datas.length,
            itemBuilder: (BuildContext context, int position) {
              return ListTile(
                contentPadding: EdgeInsets.all(5),
                title: Text(
                    "${datas[position]["name"]["first"]} ${datas[position]["name"]["last"]}"),
                subtitle: Text(datas[position]["email"]),
                leading: CircleAvatar(
                  radius: 25,
                  child: ClipOval(
                    child:
                        Image.network(datas[position]["picture"]['thumbnail']),
                  ),
                ),
              );
            },
            separatorBuilder: (BuildContext context, int position) {
              return Divider(
                color: Colors.black,
              );
            },
          ),
        ),
      ),
    );
  }
}
