import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:mobx_demo/store/todo_list_store.dart';
import '../api_service/api_service.dart';
import '../model/todo_model.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class TodoListScreen extends StatefulWidget {
  final String id;
  const TodoListScreen({Key? key, required this.id}) : super(key: key);

  @override
  State<TodoListScreen> createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  ApiService apiService = ApiService();
  TodoListStore todoList = TodoListStore();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // todoList.getTodoListTwo(int.parse(widget.id));
    todoList.fetchTodos(int.parse(widget.id));
  }

  @override
  Widget build(BuildContext context) {
    final future = todoList.todos;

    return Scaffold(
        appBar: AppBar(
          title: const Text('Todo List'),
        ),
        body: Container(
          padding: const EdgeInsets.all(16),
          child: Observer(builder: (_) {
            if (future.status == FutureStatus.pending) {
              // print(todoList.isLoading);
              // if (todoList.isLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (future.status == FutureStatus.rejected) {
              return const Text('Something went wrong');
            } else {
              // todoList.todoObserverList = future.value! as ObservableList<Todo>;
              // List<Todo> todos = todoList.todos2;
              List<Todo> todos = future.value!;
              return ListView.builder(
                  itemCount: todos.length,
                  // itemCount: todoList.todoObserverList.length,
                  itemBuilder: (context, index) {
                    final todo = todos[index];
                    // final todo = todoList.todoObserverList[index];

                    return Observer(builder: (_) {
                      print(todo.completed.toString());
                      return CheckboxListTile(
                        value: todo.completed,
                        onChanged: (val) {
                          todoList.changeStatus(index, val!);
                        },
                        title: Text(todo.title),
                      );
                    });
                  });
            }
          }),
          // child: FutureBuilder<List<Todo>>(
          //     future: apiService.getTodoList(int.parse(widget.id)),
          //     builder: (context, snapshot) {
          //       if (snapshot.connectionState == ConnectionState.waiting) {
          //         return const Center(
          //           child: CircularProgressIndicator(),
          //         );
          //       } else {
          //         final todos = snapshot.data!;
          //         return ListView.builder(
          //           itemCount: todos.length,
          //           itemBuilder: (context, index) {
          //             return ListTile(
          //               title: Text(todos[index].title),
          //               trailing: todos[index].completed
          //                   ? const Icon(
          //                       Icons.check,
          //                       color: Colors.green,
          //                     )
          //                   : const Icon(
          //                       Icons.close,
          //                       color: Colors.red,
          //                     ),
          //             );
          //           },
          //         );
          //       }
          //     }),
        ));
  }
}

// FutureBuilder<List<Todo>>(
//               future: apiService.getTodoList(int.parse(widget.id)),
//               builder: (context, snapshot) {
//                 if (snapshot.connectionState == ConnectionState.waiting) {
//                   return const Center(
//                     child: CircularProgressIndicator(),
//                   );
//                 } else {
//                   final todos = snapshot.data!;
//                   return ListView.builder(
//                     itemCount: todos.length,
//                     itemBuilder: (context, index) {
//                       return ListTile(
//                         title: Text(todos[index].title),
//                         trailing: todos[index].completed
//                             ? const Icon(
//                                 Icons.check,
//                                 color: Colors.green,
//                               )
//                             : const Icon(
//                                 Icons.close,
//                                 color: Colors.red,
//                               ),
//                       );
//                     },
//                   );
//                 }
//               }),
