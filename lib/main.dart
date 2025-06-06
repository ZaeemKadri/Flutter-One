import 'package:flutter/material.dart';
import 'package:flutter_one/codefile.dart';
import 'package:workmanager/workmanager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'home_page.dart';
import 'package:flutter_one/screens/display_screen.dart';
import 'package:flutter_one/screens/display_disease_screen.dart';
import 'package:flutter_one/new_screen.dart';
import 'package:flutter_one/screens/medicine_display_screen.dart';
import 'package:flutter_one/screens/upload_pdf_screen.dart';
import 'package:pdftron_flutter/pdftron_flutter.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // Workmanager().initialize(callbackDispatcher, isInDebugMode: true);
  // Workmanager().registerPeriodicTask('resetSteps', 'resetStepsTask', frequency: Duration(hours: 24));
  WidgetsFlutterBinding.ensureInitialized();
  await PdftronFlutter.initialize();
  runApp(const MyApp());
}

// void callbackDispatcher() {
//   Workmanager().executeTask((task, inputData) async {
//     if(task == 'resetStepsTask') {
//       SharedPreferences prefs = await SharedPreferences.getInstance();
//       int todaySteps = prefs.getInt('todaySteps') ?? 0;
//       List<String> history = prefs.getStringList('stepHistory') ?? [];
//       history.insert(0, "$todaySteps");
//       await prefs.setStringList('stepHistory', history);
//       await prefs.setInt('todaySteps', 0);
//     }
//     return Future.value(true);
//   });
// }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: UploadPdfScreen(),
    );
  }
}

