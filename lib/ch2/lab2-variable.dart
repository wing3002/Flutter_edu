main() {
  // int 는 예약어가 아니라 클래스명이다. 다트의 모든 변수는 객체다. int 클래스의 객체
  int data1 = 10;

  data1.isEven;

  //primitive type 이었다면 int <-> double 캐스팅이 지원되었을 것은데. dart 에서는 안된다.
  //double data2 = data1; // 안된다. 서로 다른 클래스 간 캐스팅 안됨. 객체 캐스팅은 상하위 관계에서만 논할 수 있다.

  //methods 로 타입 변형 필요
  double data3 = data1.toDouble();

  int data4 = 10.0.toInt();

  //int <-> String
  String data5 = '10';
  int data6 = int.parse(data5);
  String data7 = data6.toString();

  // dart 는 strong typed language 이다.
  int a = 10;
  //a = 'hello'; // error
  //dart 에서는 타입 유추 기법도 제공한다.
  //개발자가 타입을 지정하지는 않았지만 대입되는 데이터에 의해 타입이 유추, 고정된다.
  var b = 10;
  // b = 'hello'; // error

  // 일종의 any 같은 타입이다.
  dynamic c = 10;
  c = 'hello'; // 가능하다. 근데 좋은 방법은 아닌 것 같다.

  // var 로 선언하면서 값을 대입해야 타입이 유추가 된다.
  // 선언과 동시에 값을 지정하지 않으면 dynamic 으로 유추된다.
  var d;
  d = 10;
  d = 'hello';

  //dart 에서는 list 가 배열이고, 배열이 list 이다.
  List list1 = [10, true, 'hello'];
  list1[0] = 20;

  //제네릭으로 타입 한정 가능
  List<int> list2 = [10, 20, 30];
  list2.add(40);
  list2.forEach((element) {
    print(element);
  });

  //선언과 동시에 초기 데이터가 없는 경우
  List<int> list3 = [];

  //생성자를 이용해 객체 생성 filled 는 static 함수가 아니고 객체 생성 후 생성자 호출하는 문법이다.
  List list4 = List.filled(3, null);

  //map
  Map map1 = {1:10, 'two':'hello'};
  map1['two'] = 'world';

  Map<String, String> map2 = {"one":"hello"};
}