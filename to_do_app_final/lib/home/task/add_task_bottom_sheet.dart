import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app_final/Model/task.dart';
import 'package:to_do_app_final/firebase_utils.dart';
import 'package:to_do_app_final/provider/list_provider.dart';

class AddTaskBottomSheet extends StatefulWidget {
  @override
  State<AddTaskBottomSheet> createState() => _AddTaskBottomSheetState();
}

class _AddTaskBottomSheetState extends State<AddTaskBottomSheet> {
  String title = '';

  String description = '';
  var selectDate = DateTime.now();
  late ListProvider listProvider;

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    listProvider = Provider.of<ListProvider>(context, listen: false);

    return Container(
      padding: const EdgeInsets.all(16), // Padding around the content
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min, // Adjust the height based on content
          children: [
            Text(
              AppLocalizations.of(context)!.add_new_task,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 16), // Space between the text and form
            Form(
              key: formKey,
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.stretch, // Stretch to full width
                children: [
                  TextFormField(
                    onChanged: (text) {
                      title = text;
                    },
                    validator: (text) {
                      if (text == null || text.isEmpty) {
                        return 'please enter task title'; //invalid
                      }
                      return null; //valid
                    },
                    decoration:
                        const InputDecoration(labelText: 'Enter task title'),
                  ),
                  const SizedBox(height: 16), // Space between form fields
                  TextFormField(
                    onChanged: (text) {
                      description = text;
                    },
                    validator: (text) {
                      if (text == null || text.isEmpty) {
                        return 'please enter task description';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      labelText: 'Enter task description',
                    ),
                    maxLines: 4,
                  ),
                  const SizedBox(height: 13),
                  Text(
                    AppLocalizations.of(context)!.select_date,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: InkWell(
                      onTap: () {
                        showCalender();
                      },
                      child: Text(
                        '${selectDate.day}/${selectDate.month}/${selectDate.year}',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16), // Space before the button
                  ElevatedButton(
                    onPressed: () {
                      addTask();
                    },
                    child: Text(
                      AppLocalizations.of(context)!.add,
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall
                          ?.copyWith(color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          vertical: 16), // Button padding
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void addTask() {
    if (formKey.currentState?.validate() == true) {
      Task task = Task(
        dateTime: selectDate,
        title: title,
        description: description,
      );
      FirebaseUtils.addTaskToFireStore(task).timeout(Duration(seconds: 1),
          onTimeout: () {
        print('task added successfully!');
        listProvider.getAllTasksFromFireStore();
        Navigator.pop(context);
      });
    }
  }

  void showCalender() async {
    var chosenDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(Duration(days: 365)));
    selectDate = chosenDate ?? selectDate;
    setState(() {});
  }
}
