import 'package:drinks/const.dart';
import 'package:flutter/material.dart';
import 'package:drinks/view/home.dart';
import 'package:provider/provider.dart';
import 'controller/controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData().copyWith(
          colorScheme:
          ThemeData().colorScheme.copyWith(primary: yellowColor),
        ),
        home: const Home(),
      ),
    );
  }
}

