import 'package:flutter/cupertino.dart';

class TabbarModel {
  final String imageName;
  final String name;
  final int id;
  final Widget widget;

  const TabbarModel({
    required this.imageName,
    required this.name,
    required this.id,
    required this.widget
  });
}