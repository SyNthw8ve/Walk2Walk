import "package:google_maps_webservice/places.dart";
import 'package:geolocator/geolocator.dart';

const String API_KEY = "AIzaSyAnsoEEhETLl2Vn5ilE5av5-udXVnK_LwE";

Future<List<PlacesSearchResult>> getPlaces(Position positition, double radius) async {
  final GoogleMapsPlaces places = new GoogleMapsPlaces(apiKey: API_KEY);

  Location loc = new Location(positition.latitude, positition.longitude);

  PlacesSearchResponse response =
      await places.searchNearbyWithRadius(loc, radius);

  return response.results;
}
