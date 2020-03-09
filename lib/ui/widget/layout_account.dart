import 'package:flutter/material.dart';
import 'package:honpass/db/entity/account.dart';
import 'package:honpass/repository/account_repository.dart';
import 'package:provider/provider.dart';

class AccountLayout extends StatelessWidget {

  final Account account;

  const AccountLayout({Key key, this.account}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final String name = account?.name ?? '';
    final String password = account?.password ?? '';

    return Consumer<AccountViewModel>(builder: (context, viewModel, _) {

      viewModel
        ..user = name
        ..password = password;

      return Column(
        children: <Widget>[
          TextField(
            key: Key('user_text_field'),
            obscureText: false,
            controller: TextEditingController(
                text: viewModel.user
            ),
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'User',
                hintText: 'Enter user name.'
            ),
            onChanged: (changed) => viewModel.user = changed,
            onSubmitted: (submitted) => viewModel.user = submitted,
          ),
          TextField(
            key: Key('password_text_field'),
            obscureText: true,
            controller: TextEditingController(
                text: viewModel.password
            ),
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Password',
                hintText: 'Enter password.'
            ),
            onChanged: (changed) => viewModel.password = changed,
            onSubmitted: (submitted) => viewModel.password = submitted,
          ),
        ],
      );
    });
  }
}

class AccountViewModel with ChangeNotifier {

  final AccountRepository _accountRepository;

  AccountViewModel(this._accountRepository);

  String user;
  String password;
}