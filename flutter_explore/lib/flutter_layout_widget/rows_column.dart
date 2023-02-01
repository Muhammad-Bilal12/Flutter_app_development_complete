import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class RowsAndColumn extends StatelessWidget {
  const RowsAndColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.yellow,

        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.ideographic,
          children: [
            Text("UpperLine", style: TextStyle(fontSize: 18)),
            Text("BaselineLine", style: TextStyle(fontSize: 8)),
          ],
        ),

        // Main Axis Alignment
        // child: Row(
        // mainAxisAlignment: MainAxisAlignment.start,
        // mainAxisAlignment: MainAxisAlignment.center,
        // mainAxisAlignment: MainAxisAlignment.end,
        // mainAxisAlignment: MainAxisAlignment.spaceAround,
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //   children: const <Widget>[
        //     Icon(Icons.star, size: 50),
        //     Icon(Icons.star, size: 50),
        //     Icon(Icons.star, size: 50),
        //   ],
        // ),
        //   // ******************* Column
        //  child: Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        // mainAxisAlignment: MainAxisAlignment.center,
        // mainAxisAlignment: MainAxisAlignment.end,
        // mainAxisAlignment: MainAxisAlignment.spaceAround,
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //   children: const <Widget>[
        //     Icon(Icons.star, size: 50),
        //     Icon(Icons.star, size: 50),
        //     Icon(Icons.star, size: 50),
        //   ],
        // ),
      ),
    );
  }
}
