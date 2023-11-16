//동일 폴더의 다트 파일도 import 해야 사용 가능하다.
//상대경로로 import
//lib 벗어난 파일을 상대경로로 지정할 수 없다.
// import '../../../test/widget_test.dart';
// import './test1.dart';
//프로젝트 내의 다트 파일도 package 접두사로 import 가능
//일반적으로 package 접두사는 flutter sdk, pub.dev 의 패키지를 import 하기 위해서 사용
import 'package:flutter/material.dart';
import 'package:flutter_lab/ch2/lab1/test1.dart';

main() {
  no1 = 30;
  //_no2 = 30; //error
}