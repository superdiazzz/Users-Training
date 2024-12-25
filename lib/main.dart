import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:personal_training/firebase_options.dart';
import 'package:personal_training/repositories/apps_repository.dart';
import 'package:personal_training/screens/home/home.dart';
import 'package:personal_training/screens/sign_in/signin.dart';
import 'package:personal_training/screens/welcome/welcome.dart';
import 'package:toastification/toastification.dart';
import 'package:personal_training/router.dart' as router;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (context) => AppsRepository(),)
      ],
      child: ToastificationWrapper(
          child: MaterialApp(
            title: 'Personal Training',
            theme: ThemeData(
              textTheme: TextTheme(
                  bodyMedium: TextStyle(color: Colors.black)),
              fontFamily: 'Raleway',
              scaffoldBackgroundColor: Colors.white,
            ),
            initialRoute: HomePage.id,
            onGenerateRoute: router.generateRoute,
          )
      )
    );
  }
}
