import 'package:crochapp/home_page.dart';
import 'package:crochapp/models/pattern_model.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'models/project_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Initialize hive
  await Hive.initFlutter();
  Hive.registerAdapter(PatternModelAdapter());
  Hive.registerAdapter(ProjectModelAdapter());

  await Hive.openBox('patterns');
  await Hive.openBox('projects');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CrochApp',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
