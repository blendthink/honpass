import 'package:flutter/material.dart';
import 'package:honpass/db/database.dart';
import 'package:honpass/db/entity/account.dart';
import 'package:honpass/repository/account_repository.dart';
import 'package:honpass/repository/service_repository.dart';
import 'package:provider/provider.dart';

import '../../widget/layout_account.dart';
import '../../widget/layout_service.dart';

class AccountScreen extends StatelessWidget {

  static const ROUTE = '/account';

  @override
  Widget build(BuildContext context) {

    final AccountScreenArguments args = ModalRoute.of(context).settings.arguments;

    final Account account = args.account;

    final ServiceLayout serviceLayout = ServiceLayout(service: null);
    final AccountLayout accountLayout = AccountLayout(account: account,);

    return Scaffold(
      key: Key('account_screen'),
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: <Widget>[
          IconButton(
            key: Key('done'),
            icon: Icon(Icons.done),
            onPressed: () {
              HonpassDatabase db = HonpassDatabase();
              AccountRepository(db).insertAccount(Account(serviceId: 0, name: '', password: ''));

              Navigator.of(context).pop();
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            ChangeNotifierProvider(
              create: (context) => ServiceViewModel(ServiceRepository(HonpassDatabase())),
              child: serviceLayout,
            ),
            accountLayout
          ],
        ),
      ),
    );
  }
}

class AccountScreenArguments {
  final Account account;

  AccountScreenArguments(this.account);
}



