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
        title: Text(widget.title),
      ),
      drawer: Drawer(
        child: ListView.separated(
            itemCount: 4,
            itemBuilder: (BuildContext context, int index) {

              if (index == 0) {
                return  DrawerHeader(
                  child: Text('Drawer Header'),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                  ),
                );
              }

              final String title = 'version';

              return Column(
                children: <Widget>[
                  ListTile(
                    title: Text(title)
                  )
                ],
              );
            },
            separatorBuilder: (BuildContext context, int index) => const Divider()
        ),
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
