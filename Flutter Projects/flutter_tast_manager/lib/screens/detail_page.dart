import 'package:flutter/material.dart';
import 'package:flutter_tast_manager/models/tasks_model.dart';

import '../widgets/date_picker.dart';
import '../widgets/task_timeline.dart';
import '../widgets/task_title.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key, required this.tasks});

  final TasksModel tasks;

  @override
  Widget build(BuildContext context) {
    final List<Map<String,dynamic>>? detailList = tasks.desc;
    return Scaffold(
      backgroundColor: Colors.black,
      body: CustomScrollView(
        slivers: [
          _buildSliverAppBar(context),
          SliverToBoxAdapter(
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const DatePicker(),
                  TaskTitle(),
                ],
              ),
            ),
          ),
          detailList == null
              ? SliverFillRemaining(
                  child: Container(
                      color: Colors.white,
                      child: Center(
                          child: Text(
                        "No Tasks Today!",
                        style: TextStyle(color: Colors.grey),
                      ))),
                )
              : SliverList(
                
                delegate: SliverChildBuilderDelegate(
                  childCount: detailList.length,
                  (context, index) {
               return  TaskTimeLine(details: detailList[index],) ;
              }))
        ],
      ),
    );
  }

  Widget _buildSliverAppBar(BuildContext context) {
    return SliverAppBar(
        backgroundColor: Colors.black,
        expandedHeight: 90,
        actions: const [
          Icon(Icons.more_vert),
        ],
        automaticallyImplyLeading: false,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios)),
        flexibleSpace: FlexibleSpaceBar(
          title: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${tasks.title} Tasks",
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 5),
              Text(
                "you have ${tasks.tasksLeft} Tasks for today",
                style: TextStyle(fontSize: 12, color: Colors.grey[700]),
              ),
            ],
          ),
        ));
  }
}
