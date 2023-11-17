import 'package:flutter/material.dart';
//add.....................
import 'package:flutter_bloc/flutter_bloc.dart';
import 'blocs/todosBloc.dart';
import 'screens/home_screen.dart';

void main() => runApp(TodosApp());

class TodosApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //add.................................
    final ThemeData theme = ThemeData();
    return BlocProvider<TodosBloc>(
        create: (context) => TodosBloc(),
        child: MaterialApp(
          title: 'Todos-Bloc',
            theme: theme.copyWith(
              colorScheme: theme.colorScheme.copyWith(primary: Colors.blue,secondary: Colors.red),
            ),
          home: HomeScreen(),
        )
    );
    
  }
}