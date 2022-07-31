import 'package:apitesting/model/crypto.dart';
import 'package:apitesting/view/Blocs/cryptoFetchBloc/crypto_bloc.dart';
import 'package:apitesting/view/Blocs/favourite_bloc/favourite_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CryptoMarket extends StatelessWidget {
  final AlbumSuccessState? state;
  final FavouriteSuccessState? favstate;
  final bool isFavourite;
  const CryptoMarket(this.state, this.favstate, this.isFavourite, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(isFavourite);
    return RefreshIndicator(
      onRefresh: () async {
        BlocProvider.of<AlbumBloc>(context).add(AlbumFetchEvent());
      },
      child: ListView.builder(
        itemCount:
            isFavourite == true ? favstate!.list.length : state!.data.length,
        itemBuilder: (context, index) {
          CryptoModel data =
              isFavourite == true ? favstate!.list[index] : state!.data[index];

          print(data);
          return AbsorbPointer(
            absorbing: isFavourite,
            child: InkWell(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (_) {
                      return AlertDialog(
                        title: Center(child: Text("Add To Favourites")),
                        content: Padding(
                          padding: const EdgeInsets.all(38.0),
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.green),
                              child: const Text(
                                "Add",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                              onPressed: () {
                                BlocProvider.of<FavouriteBloc>(context)
                                    .add(AddFavourite(data: data));

                                Navigator.pop(context);
                              }),
                        ),
                      );
                    });
              },
              child: ListTile(
                title: Text(data.symbol),
                leading:
                    CircleAvatar(backgroundImage: NetworkImage(data.image)),
                subtitle: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("marketcap"),
                    Text(data.marketcap.toString()),
                  ],
                ),
                trailing: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "24hour change",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      data.hour24pricechange.toStringAsFixed(3),
                      style: TextStyle(
                          color: data.hour24pricechange > 0
                              ? Colors.green
                              : Colors.red),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
