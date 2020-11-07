import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wax_notifier_app/provider/settings_provider.dart';

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var settingsProvider = Provider.of<SettingsProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Units"),
                DropdownButton<String>(
                  value: settingsProvider.units,
                  items: <String>['Imperial', 'Metric'].map((String values) {
                    return DropdownMenuItem(value: values, child: Text(values));
                  }).toList(),
                  onChanged: (String value) {
                    settingsProvider.setUnits(value);
                  },
                )
              ],
            ),
          ),
          SizedBox(height: 10.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Wax Lines"),
                Container(
                  child: Wrap(
                    spacing: 5.0,
                    runSpacing: 5.0,
                    children: [
                      FilterChip(
                        label: Text(
                          "Swix",
                          style:
                              TextStyle(color: Theme.of(context).accentColor),
                        ),
                        selected: (settingsProvider.waxLines.contains("Swix"))
                            ? true
                            : false,
                        onSelected: (bool value) {
                          if (value == true) {
                            settingsProvider.addWaxLines("Swix");
                          } else {
                            settingsProvider.removeWaxLines("Swix");
                          }
                        },
                      ),
                      FilterChip(
                        label: Text(
                          "Toko",
                          style:
                              TextStyle(color: Theme.of(context).accentColor),
                        ),
                        selected: (settingsProvider.waxLines.contains("Toko"))
                            ? true
                            : false,
                        onSelected: (bool value) {
                          if (value == true) {
                            settingsProvider.addWaxLines("Toko");
                          } else {
                            settingsProvider.removeWaxLines("Toko");
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
