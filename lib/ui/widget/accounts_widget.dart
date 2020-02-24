import 'package:flutter/material.dart';
import 'package:honpass/ui/screen/home/accounts_view_model.dart';
import 'package:provider/provider.dart';

class AccountsWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Consumer<AccountsViewModel>(builder: (context, provider, _) {
      return ListView.separated(
          itemBuilder: (BuildContext context, int index) {

            final accountMap = provider.accountMaps[index];

            final account = accountMap.keys.first;
            final service = accountMap.values.first;

            return Column(
              children: <Widget>[
                ListTile(
                  leading: CircleAvatar(
                    child: Image.network(
                      'https://api.statvoo.com/favicon/?url=${service.url}',
                      width: 24,
                      height: 24,
                    ),
                    backgroundColor: Colors.transparent,
                  ),
                  title: Text(service.name),
                  subtitle: Text(account.name),
                ),
              ],
            );
          },
          separatorBuilder: (BuildContext context, int index) => const Divider(),
          itemCount: provider.accountMaps.length
      );
    },);
  }
}