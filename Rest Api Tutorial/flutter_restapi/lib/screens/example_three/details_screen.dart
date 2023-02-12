import "package:flutter/material.dart";

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key, required this.data});
  final data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Details")),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              width: double.infinity,
              color: Colors.blueGrey,
              padding: EdgeInsets.all(10),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Basic Detail",
                        style: TextStyle(fontSize: 24),
                      ),
                      Text(data.name.toString()),
                      Text(data.username.toString()),
                      Text(data.email.toString()),
                      Text(data.phone.toString()),
                      Text(data.website.toString()),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              color: Colors.deepPurple,
              padding: EdgeInsets.all(10),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Address",
                        style: TextStyle(fontSize: 24),
                      ),
                      Text(data.address.city.toString()),
                      Text(data.address.street.toString()),
                      Text(data.address.suite.toString()),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              color: Colors.indigo,
              padding: EdgeInsets.all(10),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Geo Location",
                        style: TextStyle(fontSize: 24),
                      ),
                      Text(data.address.geo.lat.toString()),
                      Text(data.address.geo.lng.toString()),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
