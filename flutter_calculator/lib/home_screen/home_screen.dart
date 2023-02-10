import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

import 'button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String question = "";
  String ans = "";

  @override
  void initState() {
    super.initState();
  }

  void equalPress() {
    String finalExpression = question;
    finalExpression = question.replaceAll("X", "*");
    Parser p = Parser();
    Expression exp = p.parse(finalExpression);
    double eval = exp.evaluate(EvaluationType.REAL, ContextModel());
    ans = eval.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        centerTitle: true,
        title: const Text(
          "Calculator",
          style: TextStyle(color: Colors.white),
        ),
      ),
      backgroundColor: Colors.grey.shade700,
      body: Align(
        alignment: Alignment.bottomRight,
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.75,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                ans,
                style: const TextStyle(fontSize: 36, color: Colors.white),
              ),
              Text(
                question == "" ? "0" : question,
                style: const TextStyle(fontSize: 30, color: Colors.white),
              ),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CustomBtn(
                            text: "AC",
                            press: () {
                              ans = "";
                              question = "0";
                              setState(() {});
                            }),
                        CustomBtn(text: "+/-", press: () {}),
                        CustomBtn(
                            text: "%",
                            press: () {
                              question += "%";
                              setState(() {});
                            }),
                        CustomBtn(
                            text: "/",
                            color: Colors.yellow,
                            press: () {
                              question += "/";
                              setState(() {});
                            }),
                      ],
                    ),
                    const SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CustomBtn(
                            text: "7",
                            press: () {
                              question += "7";
                              setState(() {});
                            }),
                        CustomBtn(
                            text: "8",
                            press: () {
                              question += "8";
                              setState(() {});
                            }),
                        CustomBtn(
                            text: "9",
                            press: () {
                              question += "9";
                              setState(() {});
                            }),
                        CustomBtn(
                            text: "X",
                            color: Colors.yellow,
                            press: () {
                              question += "X";
                              setState(() {});
                            }),
                      ],
                    ),
                    const SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CustomBtn(
                            text: "4",
                            press: () {
                              question += "4";
                              setState(() {});
                            }),
                        CustomBtn(
                            text: "5",
                            press: () {
                              question += "5";
                              setState(() {});
                            }),
                        CustomBtn(
                            text: "6",
                            press: () {
                              question += "6";
                              setState(() {});
                            }),
                        CustomBtn(
                            text: "-",
                            color: Colors.yellow,
                            press: () {
                              question += "-";
                              setState(() {});
                            }),
                      ],
                    ),
                    const SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CustomBtn(
                            text: "1",
                            press: () {
                              question += "1";
                              setState(() {});
                            }),
                        CustomBtn(
                            text: "2",
                            press: () {
                              question += "2";
                              setState(() {});
                            }),
                        CustomBtn(
                            text: "3",
                            press: () {
                              question += "3";
                              setState(() {});
                            }),
                        CustomBtn(
                            text: "+",
                            color: Colors.yellow,
                            press: () {
                              question += "+";
                              setState(() {});
                            }),
                      ],
                    ),
                    const SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CustomBtn(
                            text: "0",
                            press: () {
                              question += "0";
                              setState(() {});
                            }),
                        CustomBtn(
                            text: ".",
                            press: () {
                              question += ".";
                              setState(() {});
                            }),
                        CustomBtn(
                            text: "Del",
                            press: () {
                              question =
                                  question.substring(0, question.length - 1);
                              setState(() {});
                            }),
                        CustomBtn(
                            text: "=",
                            color: Colors.yellow,
                            press: () {
                              equalPress();
                              setState(() {});
                            }),
                      ],
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
