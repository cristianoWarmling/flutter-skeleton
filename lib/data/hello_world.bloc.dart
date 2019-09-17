import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:rxdart/rxdart.dart';

class HelloWorldBloc extends BlocBase {
  var _counterController = BehaviorSubject<int>.seeded(0);

  Stream<int> get outCounter => _counterController.stream;
  Sink<int> get inCounter => _counterController.sink;

  increment() {
    inCounter.add(_counterController.value + 1);
  }

  @override
  void dispose() {
    _counterController.close();
    super.dispose();
  }
}
