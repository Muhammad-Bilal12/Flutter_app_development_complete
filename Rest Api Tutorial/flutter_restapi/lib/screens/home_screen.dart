import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http; // for http request
import 'package:http/http.dart%20';

import '../models/posts_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<PostModel> postList = [];
  Future<List<PostModel>> getPostData() async {
    postList.clear(); // so that it not be reload again and again

    final response =
        await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (Map<String, dynamic> i in data) {
        postList.add(PostModel.fromJson(i));
      }

      return postList;
    }

    return postList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Api Course || Get Request"),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
              future: getPostData(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: ListView.builder(
                      itemCount: postList.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Colors.green,
                            child: Text(
                              postList[index].id.toString(),
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                          title: Text(postList[index].title.toString()),
                          subtitle: Text(postList[index].userId.toString()),
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
}
