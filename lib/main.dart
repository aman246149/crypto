import 'package:apitesting/view/Blocs/cryptoFetchBloc/crypto_bloc.dart';
import 'package:apitesting/view/Blocs/favourite_bloc/favourite_bloc.dart';
import 'package:apitesting/view/cryptopage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AlbumBloc()..add(AlbumFetchEvent()),
        ),
        BlocProvider(
          create: (context) => FavouriteBloc(),
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          useMaterial3: true,
          primarySwatch: Colors.blue,
        ),
        home: CryptoPage(),
      ),
    );
  }
}
