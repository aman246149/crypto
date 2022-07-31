import 'package:apitesting/model/crypto.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/favourite.dart';

part 'favourite_event.dart';
part 'favourite_state.dart';

class FavouriteBloc extends Bloc<FavouriteEvent, FavouriteState> {
  // List<CryptoModel> list = [];
  FavouriteBloc() : super(FavouriteInitial()) {
    print("Called");
    on<FavouriteEvent>((event, emit) {});

    on<AddFavourite>((event, emit) async {
      emit(FavouriteLoading()); 
      List<CryptoModel> list = await FavouriteStorage.addData(event.data);
      emit(FavouriteSuccessState(list: list));
    });

    on<FetchFavourite>((event, emit) async {
      emit(FavouriteLoading());
      List<CryptoModel> list = await FavouriteStorage.getData();
      emit(FavouriteSuccessState(list: list));
    });
  }
}
