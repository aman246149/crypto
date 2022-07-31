import 'package:apitesting/view/Blocs/favourite_bloc/favourite_bloc.dart';
import 'package:apitesting/view/widgets/cryptomarket.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Favourite extends StatelessWidget {
  const Favourite({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("favourite");
    BlocProvider.of<FavouriteBloc>(context).add(FetchFavourite());
    return Scaffold(
      body: BlocConsumer<FavouriteBloc, FavouriteState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          if (state is FavouriteError) {
            return Center(
              child: Text(state.message),
            );
          }

          if (state is FavouriteLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state is FavouriteSuccessState) {
            print("favourite success state");
            return state.list.isEmpty
                ? const Center(child: Text("add favourite first"))
                : CryptoMarket(null, state, true);
          }
          return Center(
            child: Text("No favourites Right Now"),
          );
        },
      ),
    );
  }
}
