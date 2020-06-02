import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import "package:google_maps_webservice/places.dart";
import 'package:provider/provider.dart';

import '../../services/google-service.dart';
import '../../models/notifications-model/notifications-model.dart';
import '../../models/notifications-model/notifications.dart' as not;

const double CAMERA_ZOOM = 16;

class _MapState extends State<Map> {
  final Geolocator geolocator = Geolocator();
  final LocationOptions locationOptions =
      LocationOptions(accuracy: LocationAccuracy.best, distanceFilter: 10);

  GoogleMapController mapController;

  LatLng currentLocation;
  Set<PlacesSearchResult> nearbyPlaces;

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  void setPosition() async {
    Position position = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

    setState(() {
      currentLocation = new LatLng(position.latitude, position.longitude);
    });
  }

  void updatePosition(Position position) {
    setState(() {
      currentLocation = new LatLng(position.latitude, position.longitude);
    });
  }

  void updateMarkers(Position position) async {
    final notifications =
        Provider.of<NotificationsModel>(context, listen: false);

    List<PlacesSearchResult> results = await getPlaces(position, 10.0);
    results.forEach((element) {
      if (element.types.contains('establishment') && element.name != null)
        notifications.add(new not.Notification(not.Type.shop, element.name));
    });

    showSnackBar();
  }

  void showSnackBar() {
    Scaffold.of(context).showSnackBar(new SnackBar(
      content: Text('You are near a shop, please wear mask.'),
    ));
  }

  @override
  void initState() {
    super.initState();

    setPosition();

    geolocator.getPositionStream(locationOptions).listen((Position position) {
      if (position != null) {
        updatePosition(position);
        updateMarkers(position);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Map'),
        ),
        body: currentLocation != null
            ? GoogleMap(
                onMapCreated: _onMapCreated,
                myLocationEnabled: true,
                initialCameraPosition:
                    CameraPosition(target: currentLocation, zoom: CAMERA_ZOOM),
              )
            : Container());
  }
}

class Map extends StatefulWidget {
  @override
  _MapState createState() => _MapState();
}
