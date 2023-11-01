import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'services/local_db_handler.dart';
import 'src/auth/provider/auth_provider.dart';
import 'src/home/provider/home_provider.dart';
import 'src/splash/splash.dart';

Future<void> main() async {

  
  WidgetsFlutterBinding.ensureInitialized();
  await LocalDBHandler().hiveInit();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MainScreen();
  }
}

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AuthProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => HomeProvider(),
        ),
      ],
      child: const MaterialApp(
        title: 'Lost & Found',
        // theme: AppTheme.appTheme,
        home: SplashPage(),
      ),
    );
  }
}
