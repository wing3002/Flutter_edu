import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'add_screen.dart';

//add...........
import '../models/todo.dart';
import '../providers/todos_model.dart';
import '../widgets/todo_list.dart';

class TabScreen extends StatelessWidget {

  List<Todo> todos;
  TabScreen(this.todos);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TodoList(this.todos ),
    );
  }
}


class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {//tab 화면 전환 animation

  late TabController controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 3, vsync: this);//animation
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todos'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddTodoScreen(),
                ),
              );
            },
          ),
        ],
        bottom: TabBar(
          controller: controller,
          tabs: <Widget>[
            Tab(text: 'All'),
            Tab(text: 'Active'),
            Tab(text: 'Complete'),
          ],
        ),
      ),
        //add........................
        body:
        Consumer<TodosModel>(
          //child : child 속성으로 지정한 위젯. 이 위젯이 먼저 생성되고 builder 의 3번째 매개변수로 전달
          builder: (context, model, child){
            return TabBarView(
              controller: controller,
              children: <Widget>[
                TabScreen(model.todos),
                TabScreen(model.todos.where((todo) => !todo.completed).toList()),//where.. list filter...리턴 타입이 Interable.. toList() 로.. List 로 반환
                TabScreen(model.todos.where((todo) => todo.completed).toList())
              ],
            );
          },
        )

      
    );
  }
}
