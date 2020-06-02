import 'dart:collection';

import 'package:flutter/foundation.dart';

import 'notifications.dart';

class NotificationsModel extends ChangeNotifier {

  final List<Notification> _notifications = [];

  UnmodifiableListView<Notification> get notifications => UnmodifiableListView(_notifications);

  void add(Notification notification) {
    
    _notifications.add(notification);
    
    notifyListeners();
  }
}