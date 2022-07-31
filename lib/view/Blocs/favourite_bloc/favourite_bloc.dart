import 'package:apitesting/model/crypto.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'favourite_event.dart';
part 'favourite_state.dart';

class FavouriteBloc extends Bloc<FavouriteEvent, FavouriteState> {
  List<CryptoModel> list = [];
  FavouriteBloc() : super(FavouriteInitial()) {
    print("Called");
    on<FavouriteEvent>((event, emit) {});

    on<AddFavourite>((event, emit) {
      list.add(event.data);

      emit(FavouriteSuccessState(list: list));
    });

    on<FetchFavourite>((event, emit) {
      emit(FavouriteSuccessState(list: list));
    });
  }
}
