import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app_final/Model/task.dart';
import 'package:to_do_app_final/firebase_utils.dart';
import 'package:to_do_app_final/home/task/task_list_item.dart';
import 'package:to_do_app_final/provider/list_provider.dart';

class TaskListTap extends StatefulWidget {
  @override
  State<TaskListTap> createState() => _TaskListTapState();
}

class _TaskListTapState extends State<TaskListTap> {
  @override
  Widget build(BuildContext context) {
    var listProvider = Provider.of<ListProvider>(context);

    if (listProvider.tasksList.isEmpty) {
      listProvider.getAllTasksFromFireStore();
    }

    return Container(
      child: Column(
        children: [
          EasyDateTimeLine(
            initialDate: DateTime.now(),
            onDateChange: (selectedDate) {
              listProvider.changeSelectDate(selectedDate);
            },
            headerProps: const EasyHeaderProps(
              monthPickerType: MonthPickerType.dropDown,
              dateFormatter: DateFormatter.fullDateMDY(),
            ),
            dayProps: const EasyDayProps(
              dayStructure: DayStructure.dayStrDayNum,
              activeDayStyle: DayStyle(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xff3371FF),
                      Color.fromARGB(255, 177, 148, 203),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: listProvider.tasksList.isEmpty
                ? Text('No Tasks Added')
                : ListView.builder(
                    itemBuilder: (context, index) {
                      return TaskListItem(task: listProvider.tasksList[index]);
                    },
                    itemCount: listProvider.tasksList.length,
                  ),
          )
        ],
      ),
    );
  }
}
