part of 'crypto_bloc.dart';

@immutable
abstract class AlbumState {}

class AlbumInitial extends AlbumState {}

class AlbumLoadingState extends AlbumState {}

class AlbumErrorState extends AlbumState {
  final String message;

  AlbumErrorState({required this.message});
}

class AlbumSuccessState extends AlbumState {
  final List<CryptoModel> data;

  AlbumSuccessState({required this.data});
}
