import 'package:flutter/material.dart';
import 'package:svnit_101/pages/canteen.dart';
import 'package:svnit_101/pages/curriculum.dart';
import 'package:svnit_101/pages/events.dart';
import 'package:svnit_101/pages/home.dart';
import 'package:svnit_101/pages/map.dart';
import 'package:dynamic_theme/dynamic_theme.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DynamicTheme(
      defaultBrightness: Brightness.light,
      data: (brightness) => ThemeData(
          primarySwatch: colorCustom,
          accentColor: Colors.deepOrange,
          fontFamily: 'Oswald',
          brightness: brightness),
      themedWidgetBuilder: (context, theme) {
        return MaterialApp(title: 'SVNIT 101', theme: theme, routes: {
          '/': (BuildContext context) => HomePage(context),
          '/canteen': (BuildContext context) => CanteenPage(),
          '/map': (BuildContext context) => MapPage(),
          '/curriculum': (BuildContext context) => CurriculumPage(),
          '/updates': (BuildContext context) => EventsPage()
        });
      },
    );
  }
}

Map<int, Color> color = {
  50: Color.fromRGBO(53, 34, 69, .1),
  100: Color.fromRGBO(53, 34, 69, .2),
  200: Color.fromRGBO(53, 34, 69, .3),
  300: Color.fromRGBO(53, 34, 69, .4),
  400: Color.fromRGBO(53, 34, 69, .5),
  500: Color.fromRGBO(53, 34, 69, .6),
  600: Color.fromRGBO(53, 34, 69, .7),
  700: Color.fromRGBO(53, 34, 69, .8),
  800: Color.fromRGBO(53, 34, 69, .9),
  900: Color.fromRGBO(53, 34, 69, 1),
};

MaterialColor colorCustom = MaterialColor(0xFF880E4F, color);

//Stuff to work on:
// 1. Dark Mode
// 2. Canteen X
// 3. Curriculum
// 4. Map? X
// 5. Splash Screen
