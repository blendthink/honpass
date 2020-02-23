import 'package:flutter/material.dart';
import 'package:honpass/db/service.dart';
import 'package:provider/provider.dart';

class ServiceLayout extends StatelessWidget {

  final Service service;

  const ServiceLayout({Key key, this.service}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Consumer<ServiceProvider>(builder: (context, provider, _) {
      return DropdownButton<Service>(
          value: provider.selected,
          items: provider
              .items
              .map<DropdownMenuItem<Service>>((Service value) {

                List<Widget> widgets;
                if (value == null) {
                  widgets = <Widget> [
                    CircleAvatar(
                      child: Icon(Icons.add),
                      backgroundColor: Colors.transparent,
                    ),
                    Text('New Service')
                  ];
                } else {
                  widgets = <Widget> [
                    CircleAvatar(
                      child: Image.network(
                        "https://api.statvoo.com/favicon/?url=${value.url}",
                        height: 24,
                        width: 24,
                      ),
                      backgroundColor: Colors.transparent,
                    ),
                    Text(value.name)
                  ];
                }

                return DropdownMenuItem<Service>(
                  value: value,
                  child: Row(
                    children: widgets,
                  )
                );
              })
              .toList(),
          onChanged: (Service newValue) {
            provider.onChange(newValue);
          }
      );
    });
  }
}

class ServiceProvider with ChangeNotifier {

  List<Service> _items = [
    null,
    Service(
        url: 'google.com',
        name: 'Google'
    ),
    Service(
        url: 'twitter.com',
        name: 'Twitter'
    ),
  ];

  Service _selectedItem;

  List<Service> get items => _items;
  Service get selected => _selectedItem;

  void onChange(Service service) {
    _selectedItem = service;
    notifyListeners();
  }
}