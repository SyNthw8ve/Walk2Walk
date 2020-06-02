enum Type {
  shop,
  group,
  zone,
}

class Notification {

  Type notificationType;
  String place;

  Notification(Type notification, String place) {

    this.notificationType = notification;
    this.place = place;
  }
}
