import 'package:flutter/material.dart';
import 'package:flutter_skeleton/screens/hello_world/hello_world.dart';

class RoutesProvider {
  static final routes = <String, WidgetBuilder>{
    "/": (BuildContext context) => new HelloWorld(),
  };


}