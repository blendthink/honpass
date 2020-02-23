import 'package:flutter/material.dart';
import 'package:honpass/db/account.dart';

class AccountLayout extends StatelessWidget {

  final Account account;

  const AccountLayout({Key key, this.account}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TextField(
          obscureText: false,
          controller: TextEditingController(
              text: account == null ? '' : account.name == null ? '' : account.name
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
              text: account == null ? '' : account.password == null ? '' : account.password
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