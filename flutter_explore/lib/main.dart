import 'package:flutter/material.dart';
import 'package:flutter_explore/flutter_layout_widget/flutter_layout.dart';
import 'package:flutter_explore/flutter_layout_widget/intrisinic_height_width.dart';
import 'package:flutter_explore/flutter_layout_widget/my_stack.dart';
import 'package:flutter_explore/flutter_layout_widget/rows_column.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter layout demo',
      home: MyStack(),
    );
  }
}
