import 'package:mobx/mobx.dart';
import 'package:mobx_demo/api_service/api_service.dart';
import 'package:mobx_demo/model/todo_model.dart';
part 'todo_list_store.g.dart';

class TodoListStore = _TodoListStore with _$TodoListStore;

abstract class _TodoListStore with Store {
  @observable
  List<Todo> todos2 = [];

  @observable
  bool isLoading = false;

  @action
  Future getTodoListTwo(int id) async {
    isLoading = true;
    final todos2 = await ApiService().getTodoList(id);
    print(todos2);
    isLoading = false;
    print(isLoading);
  }

// this is with observable future
  @observable
  ObservableFuture<List<Todo>> todos = ObservableFuture.value([]);

  @observable
  ObservableList<Todo> todoObserverList = ObservableList<Todo>();

  @action
  Future fetchTodos(int id) =>
      todos = ObservableFuture(ApiService().getTodoList(id));

  void getTodos(int id) {
    fetchTodos(id);
  }

  @action
  void changeStatus(int index, bool val) {
    todos.value?[index].completed = val;
    todos = todos;
  }
}
