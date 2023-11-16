class User {
  String? name;
  int? age;

  // User(String name, int age) {
  //   this.name = name;
  //   this.age = age;
  // }

  // named constructor 를 제공함으로 생성자 오버로딩 제공 안한다.
  // User(); // error

  User(this.name, this.age); // 필요 없으면 생성자 바디는 선언하지 않아도 된다.

  User.one(){}
  User.two(this.name, this.age);
  User.three(String name, int age): this.one(); // 다른 생성자 호출 (this, super) 는 initialize 영역에

}

// 프로그램 전역에서 딱 하나만 생성되어 이용되었으면 좋겠다.
class Singleton {
  int? data;
  //객체가 생성되려면 생성자가 있어야 한다.
  //외부에서 호출 못하게해야 한다.
  Singleton._privateConstructor();
  static final Singleton _instance = Singleton._privateConstructor();
  factory Singleton() => _instance;
}

// 동일 이미지라면 매번 생성될 필요 없이 캐싱된 것 사용
class Image {
  late String url;
  static Map<String, Image> _cache = <String, Image>{};
  Image._instance(this.url);

  factory Image(String url){

    if(_cache[url] == null){
      var obj = Image._instance(url);
      _cache[url] = obj;
    }

    return _cache[url];
  }
}

main () {
  new User('kim',20);
  new User.one();
  new User.three('lee', 50);

  Singleton obj1 = Singleton();
  Singleton obj2 = Singleton();
  obj1.data = 10;
  obj2.data = 20;

  print('${obj1.data}, ${obj2.data}');

  var image1 = Image('a.jpg');
  var image2 = Image('a.jpg');
  print('${image1 == image2}');
}