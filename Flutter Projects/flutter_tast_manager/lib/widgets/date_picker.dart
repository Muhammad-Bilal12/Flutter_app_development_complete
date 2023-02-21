import "package:flutter/material.dart";

class DatePicker extends StatefulWidget {
  const DatePicker({super.key});

  @override
  State<DatePicker> createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  final weekList = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"];
  final dayList = ["24", "25", "26", "27", "28", "29", "30"];
  var selectedIndex = 4;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 100,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        )),
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: weekList.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex = index;
                });
              },
              child: Container(
                padding: const EdgeInsets.all(8),
                margin: const EdgeInsets.symmetric(horizontal: 5),
                decoration:  BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  color:selectedIndex == index ? Colors.grey[300] :Colors.white,
                ),
                child: Column(
                  children: [
                    Text(
                      weekList[index],
                      style:  TextStyle(
                        fontWeight: FontWeight.bold,
                      color: selectedIndex == index ? Colors.black:Colors.grey ,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      dayList[index],
                      style:  TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: selectedIndex == index ? Colors.black:Colors.grey ,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
          separatorBuilder: (context, index) {
            return const SizedBox(width: 5);
          },
        ));
  }
}
