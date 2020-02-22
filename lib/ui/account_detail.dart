import 'package:flutter/material.dart';
import 'package:honpass/db/account.dart';
import 'package:honpass/db/service.dart';

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
            ServiceLayout(service: null),
            AccountLayout(account: _account,)
          ],
        ),
      ),
    );
  }
}

class ServiceLayout extends StatelessWidget {

  final Service service;

  const ServiceLayout({Key key, this.service}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    String name = service == null ? '' : service.name;
    String url = service == null ? '' : service.url;
    String iconPath = service == null ? '' : service.iconPath;

    return ListTile(
      leading: CircleAvatar(
        child: url.isEmpty ? Icon(Icons.language) : Image.network("https://api.statvoo.com/favicon/?url=$url"),
        backgroundColor: Colors.white,
      ),
      title: TextField(
        obscureText: false,
        controller: TextEditingController(
            text: name
        ),
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Service',
          hintText: 'Enter service name.'
        ),
      ),
      subtitle: TextField(
        obscureText: false,
        controller: TextEditingController(
            text: url
        ),
        decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'URL',
            hintText: 'Enter service url.'
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
        ),
      ],
    );
  }
}