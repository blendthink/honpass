import 'package:flutter/material.dart';
import 'package:honpass/db/account.dart';

class AccountLayout extends StatelessWidget {

  final Account account;

  const AccountLayout({Key key, this.account}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final String name = account?.name ?? '';
    final String password = account?.password ?? '';

    return Column(
      children: <Widget>[
        TextField(
          obscureText: false,
          controller: TextEditingController(
              text: name
          ),
          decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'User',
              hintText: 'Enter user name.'
          ),
        ),
        TextField(
          obscureText: true,
          controller: TextEditingController(
              text: password
          ),
          decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Password',
              hintText: 'Enter password.'
          ),
        ),
      ],
    );
  }
}