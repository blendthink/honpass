import 'package:flutter/material.dart';
import 'package:honpass/initialize.dart';
import 'package:honpass/theme.dart';
import 'package:honpass/ui/screen/account/account_screen.dart';
import 'package:honpass/ui/screen/home/home_screen.dart';

void main() {

  runApp(HonpassApp());

  Initialize().init();
}

class HonpassApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: HomeScreen.ROUTE,
      theme: lightAppTheme,
      darkTheme: darkAppTheme,
      routes: <String, WidgetBuilder> {
        HomeScreen.ROUTE: (_) => HomeScreen(),
        AccountScreen.ROUTE: (_) => AccountScreen()
      },
    );
  }
}
