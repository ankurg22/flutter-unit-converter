import 'package:flutter/material.dart';
import 'package:unit_converter/converter_screen.dart';
import 'package:unit_converter/unit.dart';

final rowHeight = 100.0;
final cornerRadius = BorderRadius.circular(rowHeight / 2);

class Category extends StatelessWidget {
  final String name;
  final ColorSwatch color;
  final IconData iconLocation;
  final List<Unit> units;

  const Category({
    Key key,
    @required this.name,
    @required this.color,
    @required this.iconLocation,
    @required this.units,
  })  : assert(name != null),
        assert(color != null),
        assert(iconLocation != null),
        assert(units != null),
        super(key: key);

  void _navigateToConverter(BuildContext context) {
    if (Navigator.of(context).canPop()) {
      Navigator.of(context).pop();
    }
    Navigator.of(context).push(
      MaterialPageRoute(builder: (BuildContext context) {
        return Scaffold(
            appBar: AppBar(
              elevation: 1.0,
              title: Text(
                name,
                style: Theme.of(context).textTheme.display1,
              ),
              centerTitle: true,
              backgroundColor: color,
            ),
            body: ConverterScreen(
              name: name,
              color: color,
              units: units,
            ));
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        height: rowHeight,
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: InkWell(
            borderRadius: cornerRadius,
            highlightColor: color,
            splashColor: color,
            onTap: () {
              _navigateToConverter(context);
            },
            child: Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Icon(
                    iconLocation,
                    size: 60.0,
                  ),
                ),
                Center(
                  child: Text(
                    name,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
