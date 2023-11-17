import 'package:flutter/material.dart';
//add...............
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/todosBloc.dart';
import '../events/events.dart';
import '../states/todosState.dart';

class TodoListItem extends StatelessWidget {
  final Todo todo;

  TodoListItem({required this.todo});

  @override
  Widget build(BuildContext context) {
    //add.....................
    final TodosBloc todosBloc = BlocProvider.of<TodosBloc>(context);
    return BlocBuilder<TodosBloc, TodosState>(
      // bloc: todosBloc,
        builder: (context, count) {
          return ListTile(
            leading: Checkbox(
              value: todo.completed,
              onChanged: (bool? checked) {
                todosBloc.add(ToggleCompletedTodoEvent(todo));
              },
            ),
            title: Text(todo.title),
            trailing: IconButton(
              icon: Icon(
                Icons.delete,
                color: Colors.red,
              ),
              onPressed: () {
                todosBloc.add(DeleteTodoEvent(todo));
              },
            ),
          );
        }
    );
    
  }
}
