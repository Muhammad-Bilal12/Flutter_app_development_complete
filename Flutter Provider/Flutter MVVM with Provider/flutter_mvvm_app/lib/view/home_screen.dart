import 'package:flutter/material.dart';
import 'package:flutter_mvvm_app/data/response/status.dart';
import 'package:flutter_mvvm_app/utils/routes/routes_name.dart';
import 'package:flutter_mvvm_app/view_model/home_view_model.dart';
import 'package:flutter_mvvm_app/view_model/user_view_model.dart';
import 'package:provider/provider.dart';

import '../utils/utils.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeViewViewModel homeViewModel = HomeViewViewModel();

  @override
  void initState() {
    homeViewModel.fetchMovieListApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final userPrefrences = Provider.of<UserViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Screen"),
        actions: [
          SizedBox(
            child: InkWell(
              onTap: () {
                userPrefrences.removeUser().then((value) => {
                      Navigator.pushReplacementNamed(context, RoutesName.login)
                    });
              },
              child: const Center(child: Text("Logout",style: TextStyle(fontSize: 12),)),
            ),
          ),
        ],
      ),
      body: ChangeNotifierProvider<HomeViewViewModel>(
        create: (context) => homeViewModel,
        builder: (context, child) {
          return Consumer<HomeViewViewModel>(
            builder: (context, value, child) {
              switch (value.movieList.stauts) {
                case Stauts.LOADING:
                  return const Center(child: CircularProgressIndicator());

                case Stauts.ERROR:
                  return Center(
                      child: Text(value.movieList.message.toString()));
                case Stauts.COMPLETED:
                  return ListView.builder(
                    itemCount: value.movieList.data!.movies!.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: ListTile(
                          leading: Image.network(
                            value.movieList.data!.movies![index].posterurl
                                .toString(),
                            errorBuilder: (context, error, stackTrace) {
                              return const Icon(Icons.error, color: Colors.red);
                            },
                            height: 40,
                            width: 40,
                            fit: BoxFit.cover,
                          ),
                          title: Text(value.movieList.data!.movies![index].title
                              .toString()),
                          subtitle: Text(value
                              .movieList.data!.movies![index].year
                              .toString()),
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(Utils.averageRating(value.movieList.data!.movies![index].ratings!).toString()),
                                Icon(Icons.star,color: Colors.yellow,)
                                ],
                              ),
                        ),
                      );
                    },
                  );
                default:
                  return Container();
              }
            },
          );
        },
      ),
    );
  }
}
