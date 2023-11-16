import 'package:flutter/material.dart';

// 데이터 저장을 위한 개발자 vo
class User {
  String? firstName;
  String? lastName;
}

class FormWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyFormState();
  }
}

class MyFormState extends State<FormWidget> {
  //Form 을 사용하면 어느 순간 Form 의 State 객체를 획득해서 validate, save 함수를 호출해야
  //필요한 순간 Form 의 State 를 획득하기 위해서 key 로 위젯을 식별해 놓아야 한다.
  //key 를 사용하는 용도가 그 위젯의 state 를 얻는 것이라면 꼭 Globalkey 를 사용해 주어야 한다

  final _formKey = GlobalKey<FormState>();
  User _user = User();

  // 개발자 함수
  _save() {
    // 보통 서버와 연동한다거나 그런 목적이다.
    print('save call ... ${_user.firstName}, ${_user.lastName}');
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextFormField(
            decoration: InputDecoration(labelText: 'First name'),
            //form 의 validate() 함수 호출할 때 자동 호출된다. 매개변수는 현재 유저가 입력한 데이터이다.
            validator: (value) {
              if(value?.isEmpty ?? false) { // null 인 경우 기본 값 처리 필요
                return 'enter your first name'; // 유저에게 출력되는 에러 메시지
              }
              return null;
            },
            //form 의 save() 함수 호출할 때 자동 호출된다. 매개변수는 현재 유저가 입력한 데이터이다.
            onSaved: (value) {
              setState(() {
                _user.firstName = value;
              });
            },
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Last name'),
            //form 의 validate() 함수 호출할 때 자동 호출된다. 매개변수는 현재 유저가 입력한 데이터이다.
            validator: (value) {
              if(value?.isEmpty ?? false) { // null 인 경우 기본 값 처리 필요
                return 'enter your last name'; // 유저에게 출력되는 에러 메시지
              }
              return null;
            },
            //form 의 save() 함수 호출할 때 자동 호출된다. 매개변수는 현재 유저가 입력한 데이터이다.
            onSaved: (value) {
              setState(() {
                _user.lastName = value;
              });
            },
          ),
          ElevatedButton(
              onPressed: () {
                //form 의 key 로 state 획득
                final form = _formKey.currentState;
                //전체 유효해야 true 이다.
                //TextField 가 많을 때 일일이 체크하고 저장 하지 않아도 되어 편하다.
                if(form?.validate() ?? false) {
                  form?.save();
                  _save(); // User() 에 값 담은 후 우리 업무처리 하면 된다.
                }
              },
              child: Text('SAVE'),
          ),
        ],
      ),
    );
  }
}