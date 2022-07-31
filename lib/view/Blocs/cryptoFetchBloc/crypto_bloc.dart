import 'package:apitesting/data/api.dart';
import 'package:apitesting/model/crypto.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'crypto_event.dart';
part 'crypto_state.dart';

class AlbumBloc extends Bloc<AlbumEvent, AlbumState> {
  AlbumBloc() : super(AlbumInitial()) {
    on<AlbumEvent>((event, emit) {});

    on<AlbumFetchEvent>((event, emit) async {
      emit(AlbumLoadingState());

      Api api = Api();

      final res = await api.fetchAlbum();

      res.fold((left) => emit(AlbumErrorState(message: left.errorMsg)),
          (right) => emit(AlbumSuccessState(data: right)));
    });
  }
}
