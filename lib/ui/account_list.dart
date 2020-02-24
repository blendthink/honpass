import 'package:flutter/material.dart';
import 'package:honpass/db/entity/account.dart';
import 'package:honpass/db/database.dart';
import 'package:honpass/repository/account_repository.dart';

class AccountListView extends StatelessWidget {

  Future<List<Account>> _futureAccounts() async {
    return AccountRepository(HonpassDatabase()).accounts();
  }

  update() {

  }

  @override
  Widget build(BuildContext context) {

    return FutureBuilder(
      future: _futureAccounts(),
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
                            leading: FaviconWidget(),
                        )
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


class FaviconWidget extends StatelessWidget {

  static Icon icon = Icon(Icons.account_circle);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 32,
      height: 32,
      child: Image.network(
        "https://cdn.qiita.com/assets/favicons/public/production-c620d3e403342b1022967ba5e3db1aaa.ico",
      ),
    );
  }
}