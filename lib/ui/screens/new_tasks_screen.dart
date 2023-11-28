import 'package:flutter/material.dart';
import 'package:task_manager/data/models/task_list_model.dart';
import 'package:task_manager/data/network_caller/network_caller.dart';
import 'package:task_manager/data/network_caller/network_response.dart';
import 'package:task_manager/ui/screens/add_new_task_screen.dart';
import 'package:task_manager/ui/widgets/task_item_card.dart';

import '../../data/utility/urls.dart';
import '../widgets/profile_summary_card.dart';
import '../widgets/summary_card.dart';

class NewTasksScreen extends StatefulWidget {
  const NewTasksScreen({Key? key}) : super(key: key);

  @override
  State<NewTasksScreen> createState() => _NewTasksScreenState();
}

class _NewTasksScreenState extends State<NewTasksScreen> {
  bool getNewTaskInProgress = false;
  TaskListModel taskListModel = TaskListModel();

  Future<void> getNewTaskList() async {
    bool getNewTaskInProgress = true;
    if (mounted) {
      setState(() {});
    }
    final NetworkResponse response =
        await NetworkCaller().getRequest(Urls.getNewTasks);
    if (response.isSuccess) {
      taskListModel = TaskListModel.fromJson(response.jsonResponse);
    }
    getNewTaskInProgress = false;
    if (mounted) {
      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();
    getNewTaskList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (BuildContext context) {
              return AddNewTaskScreen();
            }));
          },
          child: const Icon(Icons.add),
        ),
        body: SafeArea(
          child: Column(
            children: [
              ProfileSummaryCard(),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                  child: Row(
                    children: [
                      SummaryCard(
                        count: '50',
                        title: 'New',
                      ),
                      SummaryCard(
                        count: '30',
                        title: 'In progress',
                      ),
                      SummaryCard(
                        count: '12',
                        title: 'Completed',
                      ),
                      SummaryCard(
                        count: '18',
                        title: 'Cancelled',
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Visibility(
                  visible: getNewTaskInProgress == false,
                  replacement: const Center(child: const CircularProgressIndicator()),
                  child: taskListModel.taskList != null
                      ? ListView.builder(
                    itemCount: taskListModel.taskList!.length,
                    itemBuilder: (context, index) {
                      return TaskItemCard(
                        task: taskListModel.taskList![index],
                      );
                    },
                  )
                      : const Center(child: Text('No tasks available')),
                ),
              ),
            ],
          ),
        ));
  }
}
