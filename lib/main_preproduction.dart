import 'package:template/app_config.dart';
import 'package:template/firebase_options_preproduction.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> main() async {
  try {
    appConfig();
    await dotenv.load(fileName: '.env.preproduction');
    await Firebase.initializeApp(
      options: DefaultFirebaseOptionsPreProduction.currentPlatform,
    );
  } catch (_) {}
  runApp(const MyApp(title: 'PREPROD - Template App'));
}
