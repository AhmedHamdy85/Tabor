part of 'map_cubit.dart';

@immutable
abstract class MapsState {}

class MapsInitial extends MapsState {}

class PlaceLocationLoaded extends MapsState {
  final Place place;

  PlaceLocationLoaded(this.place);
}

/*class DirectionsLoaded extends MapsState {
  final PlaceDirections placeDirections;

  DirectionsLoaded(this.placeDirections);

}*/
