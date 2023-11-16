import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

//각 이벤트 내용을 가지는 vo 클래스
class DataVO {
  String image;
  String title;
  String content;
  String date;
  String location;

  DataVO(this.image, this.title, this.content, this.date, this.location);
}

List<DataVO> datas = [
  DataVO('images/lab_lotte_1.jpg', '롯데웨딩위크', '각 지점 본 매장', '2.14(금) ~ 2.23(일)',
      '백화점 전점'),
  DataVO('images/lab_lotte_2.jpg', 'LG TROMM 스타일러', '각 지점 본 매장',
      '2.14(금) ~ 2.29(토)', '백화점 전점'),
  DataVO(
      'images/lab_lotte_3.jpg', '금양와인 페스티발', '본매장', '2.15(토) ~ 2.20(목)', '잠실점'),
  DataVO('images/lab_lotte_4.jpg', '써스데이 아일랜드', '본 매장', '2.17(월) ~ 2.23(일)',
      '잠실점'),
  DataVO('images/lab_lotte_5.jpg', '듀풍클래식', '본 매장', '2.21(금) ~ 3.8(일)', '잠실점'),
];

//각 이벤트 내용이 출력되는 위젯
class CardADWidget extends StatelessWidget {
  DataVO vo;

  CardADWidget(this.vo);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
      children: [
        Container(
          color: Colors.pink[200],
        ),
        Align(
          alignment: Alignment.center, // (0.0, 0.0)
          child: Stack(
            children: [
              Column(
                mainAxisSize: MainAxisSize.min, // 뿌릴 수 있는 영역만 확보하라
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    vo.image,
                    width: 350,
                  ),
                  Container(
                    width: 350,
                    height: 100,
                    color: Colors.white,
                    padding: EdgeInsets.only(left: 16, top: 8, bottom: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          vo.title,
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                        Spacer(),
                        Text(vo.content),
                        Text(vo.date)
                      ],
                    ),
                  )
                ],
              ),
              Positioned(
                left: 30,
                bottom: 90,
                child: Container(
                  padding: EdgeInsets.all(10),
                  color: Colors.black,
                  child: Text(
                    vo.location,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  List<CardADWidget> makeViewPagerWidgets() {
    return datas.map((vo) {
      return CardADWidget(vo);
    }).toList();
  }

  //pageview 제어자
  PageController controller = PageController(
    initialPage: 0,
    // 현재 화면에 나오는 위젯을 기준으로 왼쪽, 오른쪽에 다른 위젯이 있다는 이야기
    // 왼쪽, 오른쪽에 얼마나 같이 보여야 하는가? 에 대한 조정
    // 1.0 은 왼쪽, 오른쪽 안보인다.
    viewportFraction: 0.9,
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Layout Test'),
        ),
        body: Container(
          color: Colors.pink[200],
          child: Column(
            children: [
              Expanded(
                child: PageView(
                  controller: controller,
                  children: makeViewPagerWidgets(),
                ),
              ),
              SmoothPageIndicator(
                controller: controller,
                count: datas.length,
                effect: WormEffect(
                  dotColor: Colors.white,
                  activeDotColor: Colors.indigo,
                ),
                onDotClicked: (index) {}, //indicator click event 도 처리 가능
              ),
              SizedBox(
                height: 32.0,
              )
            ],
          ),
        ),
      ),
    );
  }
}
