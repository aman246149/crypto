part of 'favourite_bloc.dart';

@immutable
abstract class FavouriteState {}

class FavouriteInitial extends FavouriteState {}

class FavouriteLoading extends FavouriteState {}

class FavouriteError extends FavouriteState {
  final String message;

  FavouriteError({required this.message});
}

class FavouriteSuccessState extends FavouriteState {
  final List<CryptoModel> list;

  FavouriteSuccessState({required this.list});
}
