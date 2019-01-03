import 'package:flutter/material.dart';
import 'package:unit_converter/category.dart';
import 'package:unit_converter/unit.dart';

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

  /// Returns a list of mock [Unit]s.
  List<Unit> _retrieveUnitList(String categoryName) {
    return List.generate(10, (int i) {
      i += 1;
      return Unit(
        name: '$categoryName Unit $i',
        conversion: i.toDouble(),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final categories = <Category>[];

    for (var i = 0; i < _categoryNames.length; i++) {
      categories.add(
        Category(
            name: _categoryNames[i],
            color: _baseColors[i],
            iconLocation: Icons.cake,
            units: _retrieveUnitList(_categoryNames[i])),
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
