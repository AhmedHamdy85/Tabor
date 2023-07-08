import '../../../model/google_map/location_details.dart';
import '../remote/dio_place.dart';

class MapsRepository {

  MapsRepository();

  

  Future<Place> getPlaceLocation(String placeId, String sessionToken) async {
    PlacesWebservices webservises=PlacesWebservices();
    final place =
        await webservises.getPlaceLocation(placeId, sessionToken);
    // var readyPlace = Place.fromJson(place);
    return Place.fromJson(place);
  }

  /*Future<PlaceDirections> getDirections(
      LatLng origin, LatLng destination) async {
    final directions =
        await placesWebservices.getDirections(origin, destination);

    return PlaceDirections.fromJson(directions);
  }*/
}