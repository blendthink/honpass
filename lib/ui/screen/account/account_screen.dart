import 'package:flutter/material.dart';
import 'package:honpass/db/entity/account.dart';
import 'package:provider/provider.dart';

import '../../widget/layout_account.dart';
import '../../widget/layout_service.dart';

class AccountScreen extends StatelessWidget {

  static const ROUTE = '/account';

  @override
  Widget build(BuildContext context) {

    final AccountScreenArguments args = ModalRoute.of(context).settings.arguments;

    final Account account = args.account;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.done),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            ChangeNotifierProvider(
              create: (context) => ServiceProvider(),
              child: ServiceLayout(service: null),
            ),
            AccountLayout(account: account,)
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



