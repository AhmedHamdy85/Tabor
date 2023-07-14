import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../../model/google_map/location_details.dart';
import '../../../../../shared/network/repository/maps_repo.dart';

part 'map_state.dart';

class MapsCubit extends Cubit<MapsState> {
  final MapsRepository mapsRepository;

  MapsCubit(this.mapsRepository) : super(MapsInitial());

  void emitPlaceLocation(String placeId, String sessionToken) {
    mapsRepository.getPlaceLocation(placeId, sessionToken).then((place) {
      emit(PlaceLocationLoaded(place));
    });
  }

  /*   void emitPlaceDirections(LatLng origin, LatLng destination) {
    mapsRepository.getDirections(origin, destination).then((directions) {
      emit(DirectionsLoaded(directions));
    });
  }*/
}
