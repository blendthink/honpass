import 'package:flutter/material.dart';
import 'package:honpass/db/account.dart';
import 'package:honpass/db/database.dart';
import 'package:honpass/theme.dart';
import 'package:honpass/ui/account_listview.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  static const title = 'ほんパス';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      theme: lightAppTheme,
      darkTheme: darkAppTheme,
      home: MyHomePage(title: title),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  List<Account> accounts = [];

  void _incrementCounter() {
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.menu),
        title: Text(widget.title),
      ),
      body: AccountListView(),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
