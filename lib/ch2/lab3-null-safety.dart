// int data1; // error
int data1 = 10;
// int data2 = null; // error
int? data2 = null;

main(){
  // data1 = null; // error
  data2 = null;
  data2 = 10;

  int? data3 = 10;
  data3!;
  data3 = null;
  // data3!; // runtime error

  data1.isEven;
  // data2.isEven; // error : nullable 이니까 ?. 으로 접근 필요하다.
  // bool result = data2?.isEven; // error : 결과 값이 null 가능하므로 타입이 안 맞아서 오류남
  bool? result = data2?.isEven;
  bool result2 = data2?.isEven ?? false;

  int data5 = 10;
  int? data6 = data5; // nullable 이 non-null 의 상위 클래스다

  // int data7 = data2; // error : 명시적 캐스팅 연산자 필요
  int data7 = data2 as int;

}

// int a2; // error : non-null 변수에 초기값 없어서
late int a2;
