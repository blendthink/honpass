import 'package:flutter/cupertino.dart';
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

    final db = HonpassDatabase();

    final serviceRepository = ServiceRepository(db);
    final accountRepository = AccountRepository(db);

    final serviceViewModel = ServiceViewModel(serviceRepository);
    final accountViewModel = AccountViewModel(accountRepository);

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

              final selectedServiceId = serviceViewModel.selected?.id;

              if (selectedServiceId == null) {
                showDialog(
                    context: context,
                    builder: (_) {
                      return CupertinoAlertDialog(
                        content: Text('サービスを選択してください'),
                        actions: <Widget>[
                          CupertinoDialogAction(
                            child: Text('OK'),
                            onPressed: () => Navigator.pop(context),
                          )
                        ],
                      );
                    }
                );
                return;
              }

              final newAccount = Account(
                  serviceId: selectedServiceId,
                  name: accountViewModel.user,
                  password: accountViewModel.password
              );

              accountRepository.insertAccount(newAccount)
                  .then((content) => print(content))
                  .catchError((error) => print(error))
                  .whenComplete(() => Navigator.of(context).pop());
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            ChangeNotifierProvider.value(
              value: serviceViewModel,
              child: serviceLayout,
            ),
            ChangeNotifierProvider.value(
              value: accountViewModel,
              child: accountLayout,
            )
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



