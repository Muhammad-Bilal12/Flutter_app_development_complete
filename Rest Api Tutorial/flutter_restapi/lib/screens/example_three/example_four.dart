import 'dart:convert';

import "package:flutter/material.dart";
import 'package:http/http.dart' as http;

class ExampleFour extends StatefulWidget {
  const ExampleFour({super.key});

  @override
  State<ExampleFour> createState() => _ExampleFourState();
}

class _ExampleFourState extends State<ExampleFour> {
  var data;
  Future<void> getUserApi() async {
    final res =
        await http.get(Uri.parse("https://jsonplaceholder.typicode.com/users"));
    if (res.statusCode == 200) {
      data = jsonDecode(res.body.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Api without model")),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: FutureBuilder(
                  future: getUserApi(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: LinearProgressIndicator(),
                      );
                    } else {
                      return ListView.builder(
                        itemCount: data.length,

                        itemBuilder: (context, index) {
                          return Card(
                            child: ListTile(title: Text(data[index]['name'].toString())),
                          );
                        },
                      );
                    }
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
