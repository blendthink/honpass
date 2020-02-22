import 'package:flutter/material.dart';
import 'package:honpass/db/account.dart';

class AccountDetail extends StatelessWidget {

  Account _account;

  AccountDetail(Account account) {
    _account = account;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.close),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            ServiceLayout(
                Icon(Icons.account_circle),
                _account == null ? null : _account.name
            ),
            AccountLayout(account: _account,)
          ],
        ),
      ),
    );
  }
}

class ServiceLayout extends StatelessWidget {

  Icon _icon;
  String _name;

  ServiceLayout(Icon icon, String name) {
    _icon = icon;
    _name = name;
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: _icon,
      title: TextField(
        obscureText: false,
        controller: TextEditingController(
            text: _name == null ? '' : _name
        ),
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Service',
          hintText: 'Enter service name.'
        ),
      ),
    );
  }
}

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
        )
      ],
    );
  }
}