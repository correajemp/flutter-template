import 'package:template/app_config.dart';
import 'package:template/firebase_options_production.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> main() async {
  try {
    appConfig();
    await dotenv.load(fileName: '.env.production');
    await Firebase.initializeApp(
      options: DefaultFirebaseOptionsProduction.currentPlatform,
    );
  } catch (_) {}
  runApp(const MyApp(title: 'Template App'));
}
