import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:wax_notifier_app/models/report.dart';
import 'package:wax_notifier_app/provider/settings_provider.dart';
import 'package:wax_notifier_app/screens/settings.dart';
import 'package:provider/provider.dart';
import 'package:wax_notifier_app/services/firestore_service.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SettingsProvider settings = Provider.of<SettingsProvider>(context);
    var reports = Provider.of<List<Report>>(context)
        .where((report) => settings.waxLines.contains(report.line))
        .toList();
    FirestoreService _db = FirestoreService();

    return Scaffold(
      appBar: AppBar(
        title: Text("Wax-Noty App"),
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => Settings()));
            },
          )
        ],
      ),
      body: ListView.builder(
        itemCount: reports?.length ?? 0,
        itemBuilder: (context, index) {
          Report report = reports[index];
          return ListTile(
            leading: (settings.units == 'Metric')
                ? Text(report.temp.toString())
                : Text((((report.temp) * (9 / 5)) + 32).round().toString() + '\u00B0'),
            title: Text(report.wax),
            subtitle: Text(report.line),
            trailing: Text(formatDate(
                DateTime.parse(report.timestamp), [h, ':', nn, ' ', am])),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          _db.addReport();
        },
      ),
    );
  }
}
