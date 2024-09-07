import 'package:flutter/material.dart';
import 'package:to_do_app_final/home/settings/settings.dart';
import 'package:to_do_app_final/home/task/add_task_bottom_sheet.dart';
import 'package:to_do_app_final/home/task/task_list.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class HomeScreen extends StatefulWidget {
  static const String routeName = 'home_screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: MediaQuery.of(context).size.height * .1,
        title: Text(
          selectedIndex == 0 ? AppLocalizations.of(context)!.app_title : 
          AppLocalizations.of(context)!.settings,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
      bottomNavigationBar: Container(
        decoration: const ShapeDecoration(
          color: Colors.white,
          shape: StadiumBorder(),
        ),
        child: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          notchMargin: 8.0,
          child: BottomNavigationBar(
            backgroundColor: Colors.transparent,
            elevation: 0, // Remove shadow
            currentIndex: selectedIndex,
            onTap: (index) {
              setState(() {
                selectedIndex = index;
              });
            },
            items:  [
              BottomNavigationBarItem(
                icon: Icon(Icons.list),
                label:     AppLocalizations.of(context)!.task_list,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label:     AppLocalizations.of(context)!.settings,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showTaskBottomSheet();
        },
        child: const Icon(Icons.add, size: 35),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: selectedIndex == 0 ? TaskListTap() : SettingsTab(),
    );
  }
  void showTaskBottomSheet() {
  showModalBottomSheet(
      context: context, builder: (context) => AddTaskBottomSheet());
}


}
