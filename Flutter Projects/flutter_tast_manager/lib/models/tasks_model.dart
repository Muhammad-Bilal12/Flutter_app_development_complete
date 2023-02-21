import 'package:flutter/material.dart';
import 'package:flutter_tast_manager/constants/colors.dart';

class TasksModel {
  final IconData? icon;
  final String? title;
  final Color? bgColor;
  final Color? iconColor;
  final Color? btnColor;
  final num? tasksLeft;
  List<Map<String, dynamic>>? desc;
  final num? tasksDone;

  bool isLast;

  TasksModel(
      {this.icon,
      this.title,
      this.bgColor,
      this.iconColor,
      this.btnColor,
      this.tasksLeft,
      this.tasksDone,
      this.desc,
      this.isLast = false});

  static List<TasksModel> generateList() {
    return [
      TasksModel(
          icon: Icons.person_rounded,
          title: "Personal",
          bgColor: kYellowLight,
          iconColor: kYellowDark,
          btnColor: kYellow,
          tasksLeft: 3,
          desc: [
            {
              'title': "Go to walk with dog",
              'time': "9:00 am",
              'slot': '9:00 - 10:00 am',
              'tlColor': kRedDark,
              'bgColor': kRedLight,
            },
            {
              'title': "Share on Dribble",
              'time': "10:00 am",
              'slot': '10:00 - 12:00 pm',
              'tlColor': kBlueDark,
              'bgColor': kBlueLight,
            },
            {
              'title': "",
              'time': "11:00 am",
              'slot': '',
              'tlColor': kBlueDark,
            },
            {
              'title': "",
              'time': "12:00 am",
              'slot': '',
              'tlColor': Colors.grey.withOpacity(0.3),
            },
            {
              'title': "Call with Clients",
              'time': "1:00 pm",
              'slot': '1:00 to 2:00 pm',
              'tlColor': kYellowDark,
              'bgColor': kYellowLight,
            },

            {
              'title': "",
              'time': "2:00 pm",
              'slot': '',
              'tlColor': kBlueDark,
            },
            {
              'title': "",
              'time': "3:00 pm",
              'slot': '',
              'tlColor': Colors.grey.withOpacity(0.3),
            },
          ],
          tasksDone: 1),
      TasksModel(
          icon: Icons.work_outlined,
          title: "Work",
          bgColor: kRedLight,
          iconColor: kRedDark,
          btnColor: kRed,
          tasksLeft: 0,
          tasksDone: 0),
      TasksModel(
          icon: Icons.medical_services,
          title: "Health",
          bgColor: kBlueLight,
          iconColor: kBlueDark,
          btnColor: kBlue,
          tasksLeft: 0,
          tasksDone: 0),
      TasksModel(isLast: true),
    ];
  }
}
