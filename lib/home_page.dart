import 'package:flutter/material.dart';
import 'package:pedometer/pedometer.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:async';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _steps = 0;
  List<String> _stepHistory = [];
  StreamSubscription<StepCount>? _stepCountStream;

  @override
  void initState(){
    super.initState();
    _requestPermissions();
    _loadSavedSteps();
    _startStepCounting();
  }

  Future<void> _requestPermissions() async {
    await Permission.activityRecognition.request();
  }

  Future<void> _loadSavedSteps() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _steps = prefs.getInt('todaySteps') ?? 0;
    });
  }

  void _startStepCounting() {
    _stepCountStream = Pedometer.stepCountStream.listen((StepCount event) async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      int savedSteps = prefs.getInt('todaySteps') ?? 0;
      int newSteps = savedSteps + event.steps;
      await prefs.setInt('todaySteps', newSteps);
      setState(() {
        _steps = newSteps;
      });
    }, onError: (error) {
      print("Step Counter Error: $error");
    });
  }

  @override
  void dispose() {
    _stepCountStream?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Steps Today: $_steps', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          SizedBox(height: 20),
          Text('Step History:', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          Expanded(
            child: _stepHistory.isEmpty
                ? Center(child: Text("No history available"))
                : ListView.builder(
              itemCount: _stepHistory.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('Day ${index + 1}: ${_stepHistory[index]} steps'),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
