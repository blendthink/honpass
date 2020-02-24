import 'package:flutter/material.dart';
import 'package:honpass/db/account.dart';
import 'package:provider/provider.dart';

import 'widget/layout_account.dart';
import 'widget/layout_service.dart';

class AccountDetail extends StatelessWidget {

  final Account account;

  const AccountDetail({Key key, this.account}) : super(key: key);

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
            AccountLayout(account: account,)
          ],
        ),
      ),
    );
  }
}



