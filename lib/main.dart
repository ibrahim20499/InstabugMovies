import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instabug_movies/screens/homePage/HomePage.dart';
import 'package:instabug_movies/screens/homePage/homepageHelpers.dart';
import 'package:provider/provider.dart';

import 'provider/moviesProvider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //ConstantColors colors = ConstantColors();
    return MultiProvider(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
        theme: ThemeData(
          accentColor: Colors.blue,
          fontFamily: 'Poppins',
          canvasColor: Colors.transparent,
        ),
      ),
      providers: [
        ChangeNotifierProvider<FetchData>(create: (_) => FetchData()),
        ChangeNotifierProvider<HomePageHelper>(create: (_) => HomePageHelper()),
      ],
    );
  }
}