import 'package:dhanda_app/routes/app_route.dart';
import 'package:dhanda_app/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(ProviderScope(child: Dhanda()));
}

class Dhanda extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Dhanda',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(fontFamily: 'Roboto'),
        initialRoute: AppRoute.home,
        routes: AppRoute.routeInfo);
  }
}
//C:\Users\Admin\OneDrive\Dhanda-studio\6thMay\dhanda_flutter