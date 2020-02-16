import 'package:flutter/material.dart';
import 'package:honpass/db/account.dart';
import 'package:honpass/db/database.dart';

class AccountListView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final database = HonPassDatabase();

    return FutureBuilder(
      future: database.accounts(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {

        switch (snapshot.connectionState) {

          case ConnectionState.none:
          case ConnectionState.waiting:
            return Center(child: CircularProgressIndicator());
          default:
            if (snapshot.hasError) {
              return Center(child: Text('${snapshot.error}'));
            } else {

              List<Account> accounts = snapshot.data;

              return ListView.separated(
                  itemCount: accounts.length,
                  itemBuilder: (BuildContext context, int index) {

                    final account = accounts.elementAt(index);

                    return Column(
                      children: <Widget>[
                        ListTile(
                            title: Text(account.name),
                        ),
                        Divider(height: 2.0)
                      ],
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) => const Divider()
              );
            }
        }

      },
    );
  }

}