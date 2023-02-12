import "dart:convert";

import "package:flutter/material.dart";
import "package:http/http.dart" as http;

import "../models/photo_model.dart";

class ExampleTwoScreen extends StatefulWidget {
  const ExampleTwoScreen({super.key});

  @override
  State<ExampleTwoScreen> createState() => _ExampleTwoScreenState();
}

class _ExampleTwoScreenState extends State<ExampleTwoScreen> {


List<PhotosModel> photoList = [];
Future<List<PhotosModel>> getPhotoData() async{
final response = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/photos"));
var data = jsonDecode(response.body.toString());

if(response.statusCode ==200 ){

  for(Map i in data ){
    PhotosModel photo = PhotosModel(id: i['id'], title: i['title'], url: i['url']);
    photoList.add(photo);
  }
  return photoList;
}else{

  return photoList;
}
}

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Custom Model"),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
              future: getPhotoData(),
              builder: (BuildContext context,AsyncSnapshot<List<PhotosModel>> snapshot){
             if (!snapshot.hasData) {
               return const Center(
                child: Padding(
                  padding: EdgeInsets.all(20.0),
                  child: LinearProgressIndicator(),
                ),
               );
             } else {
               
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                return Card(child: ListTile(
                  leading: CircleAvatar(backgroundImage: NetworkImage(snapshot.data![index].url.toString()),),
                  title: Text(snapshot.data![index].title.toString()),
                  subtitle: Text(snapshot.data![index].id.toString()),
                ),);
              },); 
             }
            }),
          ),
        ],
      ),
    );
  }
}
