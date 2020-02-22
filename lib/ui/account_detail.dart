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
        child: ServiceLayout(
            Icon(Icons.account_circle),
            _account.name
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
            text: _name
        ),
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Service',
          hintText: 'Enter Service Name.'
        ),
      ),
    );
  }

}