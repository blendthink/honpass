import 'package:flutter/material.dart';
import 'package:honpass/initialize.dart';
import 'package:honpass/theme.dart';
import 'package:honpass/ui/screen/account/account_screen.dart';
import 'package:honpass/ui/screen/home/home_screen.dart';

void main() {

  Initialize().init();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: lightAppTheme,
      darkTheme: darkAppTheme,
      routes: <String, WidgetBuilder> {
        AccountScreen.ROUTE: (_) => AccountScreen()
      },
      home: HomeScreen(),
    );
  }
}
