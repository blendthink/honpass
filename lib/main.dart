import 'package:flutter/material.dart';
import 'package:honpass/db/account.dart';
import 'package:honpass/db/database.dart';
import 'package:honpass/theme.dart';
import 'package:honpass/ui/account_detail.dart';
import 'package:honpass/ui/account_list.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  static const title = 'ほんパス';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      theme: lightAppTheme,
      darkTheme: darkAppTheme,
      routes: <String, WidgetBuilder> {
        '/account': (_) => AccountDetail(null)
      },
      home: MyHomePage(title: title,),
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

  AccountListView _listView = AccountListView();

  void _addAccount() {
    Navigator.of(context).pushReplacementNamed('/account');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.menu),
        title: Text(widget.title),
      ),
      body: _listView,
      floatingActionButton: FloatingActionButton(
        onPressed: _addAccount,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
