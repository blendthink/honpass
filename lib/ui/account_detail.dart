import 'package:flutter/material.dart';
import 'package:honpass/db/account.dart';
import 'package:provider/provider.dart';

import 'widget/layout_account.dart';
import 'widget/layout_service.dart';

class AccountDetail extends StatelessWidget {

  Account _account;

  AccountDetail(Account account) {
    _account = account;
  }

  @override
  Widget build(BuildContext context) {
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
            AccountLayout(account: _account,)
          ],
        ),
      ),
    );
  }
}



