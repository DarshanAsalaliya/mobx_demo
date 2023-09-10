// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_list_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TodoListStore on _TodoListStore, Store {
  late final _$todos2Atom =
      Atom(name: '_TodoListStore.todos2', context: context);

  @override
  List<Todo> get todos2 {
    _$todos2Atom.reportRead();
    return super.todos2;
  }

  @override
  set todos2(List<Todo> value) {
    _$todos2Atom.reportWrite(value, super.todos2, () {
      super.todos2 = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_TodoListStore.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$todosAtom = Atom(name: '_TodoListStore.todos', context: context);

  @override
  ObservableFuture<List<Todo>> get todos {
    _$todosAtom.reportRead();
    return super.todos;
  }

  @override
  set todos(ObservableFuture<List<Todo>> value) {
    _$todosAtom.reportWrite(value, super.todos, () {
      super.todos = value;
    });
  }

  late final _$todoObserverListAtom =
      Atom(name: '_TodoListStore.todoObserverList', context: context);

  @override
  ObservableList<Todo> get todoObserverList {
    _$todoObserverListAtom.reportRead();
    return super.todoObserverList;
  }

  @override
  set todoObserverList(ObservableList<Todo> value) {
    _$todoObserverListAtom.reportWrite(value, super.todoObserverList, () {
      super.todoObserverList = value;
    });
  }

  late final _$getTodoListTwoAsyncAction =
      AsyncAction('_TodoListStore.getTodoListTwo', context: context);

  @override
  Future<dynamic> getTodoListTwo(int id) {
    return _$getTodoListTwoAsyncAction.run(() => super.getTodoListTwo(id));
  }

  late final _$_TodoListStoreActionController =
      ActionController(name: '_TodoListStore', context: context);

  @override
  Future<dynamic> fetchTodos(int id) {
    final _$actionInfo = _$_TodoListStoreActionController.startAction(
        name: '_TodoListStore.fetchTodos');
    try {
      return super.fetchTodos(id);
    } finally {
      _$_TodoListStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeStatus(int index, bool val) {
    final _$actionInfo = _$_TodoListStoreActionController.startAction(
        name: '_TodoListStore.changeStatus');
    try {
      return super.changeStatus(index, val);
    } finally {
      _$_TodoListStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
todos2: ${todos2},
isLoading: ${isLoading},
todos: ${todos},
todoObserverList: ${todoObserverList}
    ''';
  }
}
