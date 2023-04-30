import 'package:flutter/material.dart';
import 'package:easy_birthdays/main.dart';

import 'package:easy_birthdays/color_provider.dart';
import 'package:provider/provider.dart';

class SettingsRoute extends StatefulWidget {
  const SettingsRoute({super.key});

  @override
  _SettingsRouteState createState() => _SettingsRouteState();
}

class _SettingsRouteState extends State<SettingsRoute> {
  String dropdownValue = 'Blue';

  @override
  Widget build(BuildContext context) {
    final priceProvider = Provider.of<PriceProvider>(context);
    bool _priceSetting = priceProvider.priceSetting;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Route'),
        backgroundColor: Provider.of<ColorProvider>(context).colorSetting,
// set the background color of the app bar
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("Color Scheme"),
          DropdownButton<String>(
            value: dropdownValue,
            onChanged: (String? newValue) {
              setState(() {
                dropdownValue = newValue!;

                if (dropdownValue == 'Blue') {
                  Provider.of<ColorProvider>(context, listen: false)
                      .colorSetting = Colors.blue;
                } else if (dropdownValue == 'Green') {
                  Provider.of<ColorProvider>(context, listen: false)
                      .colorSetting = Colors.green;
                } else if (dropdownValue == 'Red') {
                  Provider.of<ColorProvider>(context, listen: false)
                      .colorSetting = Colors.red;
                }
                //use the Provider.of method to get the instance of ColorProvider and update the color setting
              });
            },
            items: <String>['Blue', 'Green', 'Red']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
          ElevatedButton(
            onPressed: () {},
            child: const Text('Button 2'),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(
                Provider.of<ColorProvider>(context).colorSetting,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            child: const Text('Button 3'),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(
                Provider.of<ColorProvider>(context).colorSetting,
              ),
            ),
          ),
          Text('Show Prices'),
          Switch(
            value: _priceSetting,
            onChanged: (value) {
              setState(() {
                _priceSetting = value;
              });
              priceProvider.priceSetting = value;
            },
          ),
        ],
      ),
    );
  }
}
