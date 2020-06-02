import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/notifications-model/notifications-model.dart';

class Notifications extends StatefulWidget {
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Notifications")),
        body: Consumer<NotificationsModel>(
            builder: (context, notifications, child) {
          return new ListView.builder(
            itemCount: notifications.notifications.length,
            itemBuilder: (context, index) {
              var item = notifications.notifications[index];

              return new ListTile(title: Text(item.place));
            },
          );
        }));
  }
}
