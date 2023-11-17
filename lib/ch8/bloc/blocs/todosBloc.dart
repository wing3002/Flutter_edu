import 'package:bloc/bloc.dart';
import '../events/events.dart';
import '../states/todosState.dart';

class TodosBloc extends Bloc<TodosEvent, TodosState> {

  TodosBloc() : super(TodosState([])){
    on<AddTodoEvent>((event, emit)
    {
      List<Todo> newTodos = List.from(state.todos)
        ..add(event.todo);//newTodos 에 add 시킨거다.
      emit(TodosState(newTodos));
    });

    on<DeleteTodoEvent>((event, emit)
    {
      List<Todo> newTodos = List.from(state.todos)
        ..remove(event.todo);
      emit(TodosState(newTodos));
    });

    on<ToggleCompletedTodoEvent>((event, emit)
    {
      List<Todo> newTodos = List.from(state.todos);
      int index=newTodos.indexOf(event.todo);
      newTodos[index].toggleCompleted();
      emit(TodosState(newTodos));
    });
  }

  @override
  void onTransition(Transition<TodosEvent, TodosState> transition) {
    super.onTransition(transition);
    print(transition);
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    print('$error, $stackTrace');
    super.onError(error, stackTrace);
  }
}