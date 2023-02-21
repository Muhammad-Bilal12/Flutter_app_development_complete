import "package:dotted_border/dotted_border.dart";
import "package:flutter/material.dart";
import "package:flutter_tast_manager/constants/colors.dart";
import "package:flutter_tast_manager/models/tasks_model.dart";
import "package:flutter_tast_manager/screens/detail_page.dart";
import "package:flutter_tast_manager/screens/home_screen.dart";

class Tasks extends StatelessWidget {
  const Tasks({super.key});

  @override
  Widget build(BuildContext context) {
    final List tasksList = TasksModel.generateList();
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      height: MediaQuery.of(context).size.height * 0.6,
      child: GridView.builder(
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: tasksList.length,
        itemBuilder: (context, index) {
          return tasksList[index].isLast
              ? _buildAddTask()
              : _buildTask(context: context, task: tasksList[index]);
        },
      ),
    );
  }
}

Widget _buildAddTask() {
  return DottedBorder(
    borderType: BorderType.RRect,
    radius: const Radius.circular(20),
    dashPattern: [10, 10],
    strokeWidth: 2,
    color: Colors.grey,
    child: const Center(
      child: Text(
        "+ Add",
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    ),
  );
}

Widget _buildTask({required BuildContext context, required TasksModel task}) {
  return GestureDetector(
    onTap: () => Navigator.push(context,
        MaterialPageRoute(builder: (context) => DetailPage(tasks: task))),
    child: Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: task.bgColor, borderRadius: BorderRadius.circular(20)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(task.icon, size: 30, color: task.iconColor),
          const SizedBox(height: 30),
          Text(task.title!,
              style:
                  const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 20),
          Row(
            children: [
              _buildTaskStatus(
                  task.btnColor, task.iconColor, "${task.tasksLeft} left"),
              const SizedBox(width: 10),
              _buildTaskStatus(
                  Colors.white, task.iconColor, "${task.tasksDone} done"),
            ],
          )
        ],
      ),
    ),
  );
}

Widget _buildTaskStatus(bgColor, txtColor, String? text) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
    decoration:
        BoxDecoration(borderRadius: BorderRadius.circular(20), color: bgColor),
    child: Text(
      text!,
      style: TextStyle(color: txtColor),
    ),
  );
}
