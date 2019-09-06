import 'package:flutter/material.dart';
import 'package:flutter_skeleton/routes.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'Flutter Skeleton',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: RoutesProvider.routes,
      initialRoute: "/",
    ),
  );
}