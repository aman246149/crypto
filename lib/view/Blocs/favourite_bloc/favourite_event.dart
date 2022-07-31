part of 'favourite_bloc.dart';

@immutable
abstract class FavouriteEvent {}

class AddFavourite extends FavouriteEvent {
  final CryptoModel data;

  AddFavourite({required this.data});

}

class FetchFavourite extends FavouriteEvent{
  
}
