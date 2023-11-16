// dart 언어는 접근제한자를 제공하지 않는다
// 변수, 함수, 클래스명 앞에 _를 추가하면 해당 파일에서만 이용하는 private 개념이다.
int no1 = 10;
int _no2 = 20;

void sayHello1() {}
void _sayHello2() {}

class User1 {
  String? name;
  String _address = 'seoul'; // 같은 파일 내에서는 다른 클래스에서도 접근 가능함
}

class _User2 {}

main() {
  no1 = 20;
  _no2 = 20;

  sayHello1();
  _sayHello2();

  User1 obj1 = User1();
  _User2 obj2 = _User2();

  obj1.name = 'kim';
  obj1._address = 'busan';
}