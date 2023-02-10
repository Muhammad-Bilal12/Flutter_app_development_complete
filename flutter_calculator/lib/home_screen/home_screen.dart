import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String exp = "";
  String ans = "";

  @override
  void initState() {
    super.initState();
  }

  void equalPress() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                exp == "" ? "0" : exp,
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
                              exp = "0";
                              setState(() {});
                            }),
                        CustomBtn(text: "+/-", press: () {}),
                        CustomBtn(
                            text: "%",
                            press: () {
                              exp += "%";
                              setState(() {});
                            }),
                        CustomBtn(
                            text: "/",
                            color: Colors.yellow,
                            press: () {
                              exp += "/";
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
                              exp += "7";
                              setState(() {});
                            }),
                        CustomBtn(
                            text: "8",
                            press: () {
                              exp += "8";
                              setState(() {});
                            }),
                        CustomBtn(
                            text: "9",
                            press: () {
                              exp += "9";
                              setState(() {});
                            }),
                        CustomBtn(
                            text: "X",
                            color: Colors.yellow,
                            press: () {
                              exp += "X";
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
                              exp += "4";
                              setState(() {});
                            }),
                        CustomBtn(
                            text: "5",
                            press: () {
                              exp += "5";
                              setState(() {});
                            }),
                        CustomBtn(
                            text: "6",
                            press: () {
                              exp += "6";
                              setState(() {});
                            }),
                        CustomBtn(
                            text: "-",
                            color: Colors.yellow,
                            press: () {
                              exp += "-";
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
                              exp += "1";
                              setState(() {});
                            }),
                        CustomBtn(
                            text: "2",
                            press: () {
                              exp += "2";
                              setState(() {});
                            }),
                        CustomBtn(
                            text: "3",
                            press: () {
                              exp += "3";
                              setState(() {});
                            }),
                        CustomBtn(
                            text: "+",
                            color: Colors.yellow,
                            press: () {
                              exp += "+";
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
                              exp += "0";
                              setState(() {});
                            }),
                        CustomBtn(
                            text: ".",
                            press: () {
                              exp += ".";
                              setState(() {});
                            }),
                        CustomBtn(
                            text: "Del",
                            press: () {
                              exp = exp.substring(0, exp.length - 1);
                              setState(() {});
                            }),
                        CustomBtn(
                            text: "=", color: Colors.yellow, press: () {}),
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

class CustomBtn extends StatelessWidget {
  const CustomBtn({
    Key? key,
    required this.text,
    this.color = Colors.grey,
    required this.press,
  }) : super(key: key);

  final String text;
  final Color color;
  final Function()? press;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height * 1;
    double width = MediaQuery.of(context).size.width * 1;

    return InkWell(
      radius: width * 0.1,
      onTap: press,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 5),
        height: height * 0.1,
        width: width * 0.2,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color,
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
