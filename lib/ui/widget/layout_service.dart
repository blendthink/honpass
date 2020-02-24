import 'package:flutter/material.dart';
import 'package:honpass/db/entity/service.dart';
import 'package:honpass/repository/service_repository.dart';
import 'package:provider/provider.dart';

class ServiceLayout extends StatelessWidget {

  final Service service;

  const ServiceLayout({Key key, this.service}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Consumer<ServiceViewModel>(builder: (context, provider, _) {
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
                    Padding(
                        padding: EdgeInsets.only(left: 12.0),
                        child: Text(value.name,)
                    )
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

class ServiceViewModel with ChangeNotifier {

  final ServiceRepository _serviceRepository;

  ServiceViewModel(this._serviceRepository) {
    _fetchAll();
  }

  List<Service> _items = [];

  void _fetchAll() async {
    _items.clear();
    _items.add(null);
    _items.addAll(await _serviceRepository.services());
    notifyListeners();
  }

  Service _selectedItem;

  List<Service> get items => _items;
  Service get selected => _selectedItem;

  void onChange(Service service) {
    _selectedItem = service;
    notifyListeners();
  }
}