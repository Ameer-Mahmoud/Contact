import 'package:contact/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      title: "Contact",
      debugShowCheckedModeBanner: false,
      routes:{
        HomeScreen.routeName:(context) => HomeScreen(),
      },
      initialRoute:HomeScreen.routeName ,
    );
  }
}
