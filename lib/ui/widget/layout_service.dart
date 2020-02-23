import 'package:flutter/material.dart';
import 'package:honpass/db/service.dart';

class ServiceLayout extends StatelessWidget {

  final Service service;

  const ServiceLayout({Key key, this.service}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    List<Service> services = [
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

    return DropdownButton<Service>(
      value: services[2],
      onChanged: (Service newValue) {

      },
      items: services.map<DropdownMenuItem<Service>>((Service value) {

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

        return DropdownMenuItem(
            value: value,
            child: Row(
              children: widgets,
            )
        );
      }).toList(),
    );
  }
}