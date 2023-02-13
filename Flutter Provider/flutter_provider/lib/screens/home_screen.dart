import "package:flutter/material.dart";
import 'package:flutter_provider/provider/home_screen_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter Provider"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ChangeNotifierProvider<HomeScreenProvider>(
            create: (context) {
              return HomeScreenProvider();
            },
            child: Consumer<HomeScreenProvider>(
              builder: (context, provider, child) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(provider.eligibleMsg,style: TextStyle(color: (provider.isEligible == false )? Colors.red : Colors.green),),
                    TextFormField(
                      onChanged: (val){
                        provider.checkEligibility(val);
                      },
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: "Enter your age",
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 1, color: Colors.blueGrey[500]!),
                        ),
                      ),
                    )
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
