import 'package:flutter/material.dart';
class NewTasksScreen extends StatefulWidget {
  const NewTasksScreen({Key? key}) : super(key: key);

  @override
  State<NewTasksScreen> createState() => _NewTasksScreenState();
}

class _NewTasksScreenState extends State<NewTasksScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            ProfileSummaryCard(),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  SummaryCard(
                    count: '92',
                    title: 'New',
                  ),
                  SummaryCard(
                    count: '92',
                    title: 'In progress',
                  ),
                  SummaryCard(
                    count: '92',
                    title: 'Completed',
                  ),
                  SummaryCard(
                    count: '92',
                    title: 'Cancelled',
                  ),

                ],
              ),
            ),

          ],
        ),
      )
    );
  }
}

class ProfileSummaryCard extends StatelessWidget {
  const ProfileSummaryCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const ListTile(
      leading: CircleAvatar(
        child: Icon(Icons.person),
      ),
      title: Text('Rabbil Hasan', style: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w700
      ),),
      subtitle: Text('rabbil@gmail.com', style: TextStyle(
        color: Colors.white
      ),),
      trailing: Icon(Icons.arrow_forward_outlined),
      tileColor: Colors.green,
    );
  }
}

class SummaryCard extends StatelessWidget {
  final String count, title;
  const SummaryCard({
    super.key, required this.count, required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32),
        child: Column(
          children: [
            Text(count, style: Theme.of(context).textTheme.titleLarge,),

            Text(title)
          ],
        ),
      ),
    );
  }
}
