import 'package:flutter/material.dart';



import 'add_screen.dart';

//add..............
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/todosBloc.dart';
import '../states/todosState.dart';
import '../widgets/todo_list.dart';

class TabScreen extends StatelessWidget {

  List<Todo> todos;

  TabScreen(this.todos);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TodoList(
        todos: this.todos,
      ),
    );
  }
}


class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {

  late TabController controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text('Todos-Bloc'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) => AddTodoScreen(),
              ),);
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
      body:
      //add...............................
      BlocBuilder<TodosBloc, TodosState>(
        // bloc: todosBloc,
          builder: (context, state) {
            return TabBarView(
              controller: controller,
              children: <Widget>[
                TabScreen(state.todos),
                TabScreen(state.todos.where((todo) => !todo.completed).toList()),
                TabScreen(state.todos.where((todo) => todo.completed).toList()),
              ],
            );
          }
      ),
      
    );


  }
}
