import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app_final/Model/task.dart';
import 'package:to_do_app_final/app_colors.dart';
import 'package:to_do_app_final/firebase_utils.dart';
import 'package:to_do_app_final/provider/list_provider.dart';

class TaskListItem extends StatefulWidget {
  Task task;
  TaskListItem({required this.task});

  @override
  State<TaskListItem> createState() => _TaskListItemState();
}

class _TaskListItemState extends State<TaskListItem> {
  @override
  Widget build(BuildContext context) {
    var listProvider = Provider.of<ListProvider>(context);
    return Container(
      margin: EdgeInsets.all(12),
      child: Slidable(
        startActionPane: ActionPane(
          extentRatio: 0.25,
          motion: const ScrollMotion(),
          children: [
            // Edit Action
            SlidableAction(
              borderRadius: BorderRadius.circular(15),
              onPressed: (context) {
                _showEditDialog(context);
              },
              backgroundColor:
                  AppColors.redColor, // Change color for edit action
              foregroundColor: AppColors.whiteColor,
              icon: Icons.edit,
              label: 'Edit',
            ),
            // Delete Action
            SlidableAction(
              borderRadius: BorderRadius.circular(15),
              onPressed: (context) {
                FirebaseUtils.deleteTaskFromFireStore(widget.task)
                    .timeout(Duration(seconds: 1), onTimeout: () {
                  print('Task deleted successfully');
                  listProvider.getAllTasksFromFireStore();
                });
              },
              backgroundColor: AppColors.redColor,
              foregroundColor: AppColors.whiteColor,
              icon: Icons.delete,
              label: 'Delete',
            ),
          ],
        ),
        child: Container(
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: BorderRadius.circular(25),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: EdgeInsets.all(15),
                height: MediaQuery.of(context).size.height * 0.1,
                width: 4,
                color: widget.task.isDone
                    ? AppColors.greenColor
                    : AppColors.primaryColor,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      widget.task.title,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: widget.task.isDone
                                ? AppColors.greenColor
                                : AppColors.primaryColor,
                          ),
                    ),
                    Text(
                      widget.task.description,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
              ),
              widget.task.isDone
                  ? Text(
                      'Done!',
                      style: TextStyle(
                        color: AppColors.greenColor,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  : Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: AppColors.primaryColor,
                      ),
                      child: IconButton(
                        onPressed: () {
                          setState(() {
                            widget.task.isDone = true;
                            print(widget.task.isDone);
                            FirebaseUtils.isDone(widget.task);
                          });
                        },
                        icon: Icon(Icons.check, size: 35),
                        color: AppColors.whiteColor,
                        alignment: Alignment.center,
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }

  void _showEditDialog(BuildContext context) {
    final titleController = TextEditingController(text: widget.task.title);
    final descriptionController =
        TextEditingController(text: widget.task.description);
    DateTime selectedDate = widget.task.dateTime;

    void _selectDate(BuildContext context) async {
      final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2000),
        lastDate: DateTime(2101),
      );
      if (picked != null && picked != selectedDate) {
        setState(() {
          selectedDate = picked;
        });
      }
    }

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Center(child: Text('Edit Task')),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: titleController,
                decoration: InputDecoration(labelText: 'Title'),
              ),
              TextField(
                controller: descriptionController,
                decoration: InputDecoration(labelText: 'Description'),
              ),
              SizedBox(height: 16),
              GestureDetector(
                onTap: () => _selectDate(context),
                child: AbsorbPointer(
                  child: TextField(
                    controller: TextEditingController(
                        text: "${selectedDate.toLocal()}".split(' ')[0]),
                    decoration: InputDecoration(
                      labelText: 'Date',
                      suffixIcon: Icon(Icons.calendar_today),
                    ),
                  ),
                ),
              ),
            ],
          ),
          actions: [
          
            Center(
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(AppColors.primaryColor),
                ),
                onPressed: () {
                  setState(() {
                    widget.task.title = titleController.text;
                    widget.task.description = descriptionController.text;
                    widget.task.dateTime = selectedDate;
                    FirebaseUtils.updateTask(
                        widget.task); // Update the task in Firebase
                  });
                  Navigator.of(context).pop();
                },
                child:
                    Text('Save Changes', style: TextStyle(color: Colors.white)),
              ),
            ),
          ],
        );
      },
    );
  }
}
