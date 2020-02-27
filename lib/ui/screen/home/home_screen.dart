import 'package:flutter/material.dart';
import 'package:honpass/db/database.dart';
import 'package:honpass/repository/account_repository.dart';
import 'package:honpass/repository/service_repository.dart';
import 'package:honpass/ui/screen/account/account_screen.dart';
import 'package:honpass/ui/screen/home/accounts_view_model.dart';
import 'package:honpass/ui/widget/accounts_widget.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {

  static const _TITLE = 'honpass';

  @override
  Widget build(BuildContext context) {

    _addAccount() {
      Navigator.pushNamed(
          context,
          AccountScreen.ROUTE,
          arguments: AccountScreenArguments(null)
      );
    }

    HonpassDatabase _db = HonpassDatabase();

    return Scaffold(
      key: Key('home_screen'),
      appBar: AppBar(
        title: Text(_TITLE),
      ),
      // TODO: 後からログイン・バージョン・ライセンス情報などを追加する
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
      body: ChangeNotifierProvider(
        create: (context) => AccountsViewModel(AccountRepository(_db), ServiceRepository(_db)),
        child: AccountsWidget(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addAccount,
        key: Key('floating_action_button'),
        child: Icon(Icons.add),
      )
    );
  }
}