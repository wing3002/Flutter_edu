void some(bool data1, {String data2 = 'hello', int? data3}){}

main(){
  some(true);
  // some(true, "world", 10); // error : named parameter 라서
  some(true, data2: 'world', data3: 20);
  //name 을 명시함으로 optional 에 순서는 의미가 없다.
  some(true, data3: 30, data2: 'world');
  some(true, data3: 30);
  some(true, data2: 'world');
  // 이런식으로 호출이 가능함으로 오버로딩이 필요가 없다.



}