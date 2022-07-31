import 'package:apitesting/model/crypto.dart';
import 'package:apitesting/view/Blocs/cryptoFetchBloc/crypto_bloc.dart';
import 'package:apitesting/view/widgets/cryptomarket.dart';
import 'package:apitesting/view/favourite_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CryptoPage extends StatefulWidget {
  CryptoPage({Key? key}) : super(key: key);

  @override
  State<CryptoPage> createState() => _CryptoPageState();
}

class _CryptoPageState extends State<CryptoPage> with TickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "CryptoMarket",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: BlocConsumer<AlbumBloc, AlbumState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          if (state is AlbumLoadingState) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is AlbumErrorState) {
            return Center(child: Text(state.message));
          }

          if (state is AlbumSuccessState) {
            return Column(
              children: [
                TabBar(
                  controller: tabController,
                  tabs: const [
                    Tab(
                      child: Text(
                        "Markets",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 18),
                      ),
                    ),
                    Tab(

                      child: Text(
                        "Favourites",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 18),
                      ),
                    ),
                  ],
                ),
                Expanded(
                    child: TabBarView(
                        physics: const BouncingScrollPhysics(
                            parent: AlwaysScrollableScrollPhysics()),
                        controller: tabController,
                        children: [CryptoMarket(state,null,false), Favourite()]))
              ],
            );
          }
          return Container();
        },
      ),
    );
  }
}
