import 'package:flutter/material.dart';
import 'package:unit_converter/category.dart';

final _backgroundColor = Colors.green[100];

///Home screen for Unit Converter app. Shows a header and list of [Category]
class CategoryScreen extends StatelessWidget {
  const CategoryScreen();

  static const _categoryNames = <String>[
    'Length',
    'Area',
    'Volume',
    'Mass',
    'Time',
    'Digital Storage',
    'Energy',
    'Currency'
  ];

  static const _baseColors = <Color>[
    Colors.teal,
    Colors.orange,
    Colors.pinkAccent,
    Colors.blueAccent,
    Colors.yellow,
    Colors.greenAccent,
    Colors.purpleAccent,
    Colors.red,
  ];

  @override
  Widget build(BuildContext context) {
    final categories = <Category>[];

    for (var i = 0; i < _categoryNames.length; i++) {
      categories.add(
        Category(
            name: _categoryNames[i],
            color: _baseColors[i],
            iconLocation: Icons.cake),
      );
    }

    final appBar = AppBar(
      elevation: 0,
      title: Text(
        'Unit Converter',
        style: TextStyle(
          fontSize: 30.0,
          color: Colors.black,
        ),
      ),
      backgroundColor: _backgroundColor,
      centerTitle: true,
    );

    final listView = Container(
        color: _backgroundColor,
        child: ListView(
          children: categories,
        ));

    return Scaffold(
      appBar: appBar,
      body: listView,
    );
  }
}
