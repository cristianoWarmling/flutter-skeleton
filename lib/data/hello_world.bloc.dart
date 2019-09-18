import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter_skeleton/model/todo.model.dart';
import 'package:flutter_skeleton/services/hello_world.service.dart';
import 'package:rxdart/rxdart.dart';

class HelloWorldBloc extends BlocBase {
  HelloWorldService get helloWorldService =>
      BlocProvider.getDependency<HelloWorldService>();

  var _counterController = BehaviorSubject<int>.seeded(0);
  var _loadingController = BehaviorSubject<bool>.seeded(false);
  var _todoController = BehaviorSubject<TodoModel>.seeded(null);

  Stream<int> get outCounter => _counterController.stream;
  Sink<int> get inCounter => _counterController.sink;
  Stream<bool> get outLoading => _loadingController.stream;
  Sink<bool> get inLoading => _loadingController.sink;
  Stream<TodoModel> get outTodo => _todoController.stream;
  Sink<TodoModel> get inTodo => _todoController.sink;

  Future<TodoModel> increment() {
    inCounter.add(_counterController.value + 1);
    return getTodo();
  }

  Future<TodoModel> getTodo() async {
    inLoading.add(true);
    try {
      var returnObj = await helloWorldService.getTodo(_counterController.value);
      TodoModel obj = TodoModel.fromJson(returnObj.data);
      inTodo.add(obj);
      inLoading.add(false);
      return obj;
    } catch (e) {
      inLoading.add(false);
      throw e;
    }
  }

  @override
  void dispose() {
    _counterController.close();
    _loadingController.close();
    _todoController.close();
    super.dispose();
  }
}
