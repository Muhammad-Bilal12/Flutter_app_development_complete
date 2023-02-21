import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:timeline_tile/timeline_tile.dart';

class TaskTimeLine extends StatelessWidget {
  const TaskTimeLine({super.key, required this.details});
  final Map<String, dynamic> details;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      color: Colors.white,
      child: Row(
        children: [
          _buildTimeline(details['tlColor']),
          Expanded(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(details['time']),
              details['title'].isEmpty
                  ? const SizedBox()
                  : _buildCard(
                      details['tlColor'], details['title'], details['slot']),
            ],
          ))
        ],
      ),
    );
  }

  Widget _buildCard(Color color, String? title, String? slot) {
    return Container(
      width: 200,
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
            topRight: Radius.circular(10),
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10)),
        color: color,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title!,style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
          SizedBox(height: 5),
          Text(slot!,style: TextStyle(color: Colors.grey[900]),),
        ],
      ),
    );
  }

  // Timeline tile

  Widget _buildTimeline(Color color) {
    return Container(
      height: 80,
      width: 20,
      child: TimelineTile(
        alignment: TimelineAlign.manual,
        isFirst: true,
        lineXY: 0,
        indicatorStyle: IndicatorStyle(
          width: 15,
          indicatorXY: 0,
          indicator: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                border: Border.all(width: 5, color: color)),
          ),
        ),
        afterLineStyle: LineStyle(thickness: 2, color: color),
      ),
    );
  }
}
