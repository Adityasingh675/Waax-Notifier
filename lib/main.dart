import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wax_notifier_app/provider/settings_provider.dart';
import 'package:wax_notifier_app/screens/home.dart';
import 'package:wax_notifier_app/services/firestore_service.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final FirestoreService _db = FirestoreService();
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (BuildContext context) => SettingsProvider(),),
        StreamProvider(create: (BuildContext context) => _db.getReports(),)
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.teal,
          accentColor: Colors.deepOrangeAccent,
        ),
        home: Home(),
      ),
    );
  }
}
