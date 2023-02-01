import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class HeightandWidth extends StatelessWidget {
  const HeightandWidth({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Intrisinic Height and Width"),
      ),
      body: Center(
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                width: 100,
                height: 50,
                color: Colors.red,
              ),
              Container(
                width: 100,
                height: 150,
                color: Colors.yellow,
              ),
              Container(
                width: 100,
                height: 100,
                color: Colors.green,
              ),
            ],
          ),
        ),
        // child: IntrinsicWidth(
        //   child: Column(
        //     mainAxisAlignment: MainAxisAlignment.center,
        //     crossAxisAlignment: CrossAxisAlignment.stretch,
        //     children: <Widget>[
        //       ElevatedButton(
        //         onPressed: () {},
        //         child: Text('Short'),
        //       ),
        //       ElevatedButton(
        //         onPressed: () {},
        //         child: Text('A bit Longer'),
        //       ),
        //       ElevatedButton(
        //         onPressed: () {},
        //         child: Text('The Longest text button'),
        //       ),
        //     ],
        //   ),
        // ),
      ),
    );
  }
}
