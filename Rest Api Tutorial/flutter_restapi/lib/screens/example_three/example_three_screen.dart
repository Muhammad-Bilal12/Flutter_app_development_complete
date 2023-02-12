import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../models/users_model.dart';
import 'details_screen.dart'; // for http request

class ExampleThreeScreen extends StatefulWidget {
  const ExampleThreeScreen({super.key});

  @override
  State<ExampleThreeScreen> createState() => _ExampleThreeScreenState();
}

class _ExampleThreeScreenState extends State<ExampleThreeScreen> {
  List<UserModel> userList = [];
  Future<List<UserModel>> getUserData() async {
    userList.clear(); // so that it not be reload again and again

    final response =
        await http.get(Uri.parse("https://jsonplaceholder.typicode.com/users"));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (Map<String, dynamic> i in data) {
        userList.add(UserModel.fromJson(i));
      }

      return userList;
    }

    return userList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Api Course || Complex Json"),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
              future: getUserData(),
              builder: (context, AsyncSnapshot<List<UserModel>> snapshot) {
                if (!snapshot.hasData) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                              return DetailsScreen(data: snapshot.data![index],);
                            },));
                          },
                          leading: checkEvenColor(
                              snapshot.data![index].id.toString()),
                          title: Text(snapshot.data![index].name.toString()),
                          subtitle:
                              Text(snapshot.data![index].email.toString()),
                          trailing: Text(
                              snapshot.data![index].address!.city.toString()),
                        );
                      },
                    ),
                  );
                }
              },
            ),
          )
        ],
      ),
    );
  }

  Widget checkEvenColor(String id) {
    if (int.parse(id) % 2 == 0) {
      return CircleAvatar(
        backgroundColor: Colors.blueGrey,
        child: Text(
          id,
          style: const TextStyle(color: Colors.white),
        ),
      );
    }

    return CircleAvatar(
        backgroundColor: Colors.purple,
        child: Text(
          id,
          style: const TextStyle(color: Colors.white),
        ));
  }
}
