import 'package:flutter/material.dart';

class TaskItemCard extends StatelessWidget {



  const TaskItemCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Title will be here', style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500

            ),),
            Text('Description'),
            Text('Date: 12-12-2020'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Chip(label: Text('New', style: TextStyle(color: Colors.white),), backgroundColor: Colors.blue,),
                Wrap(
                  children: [
                    IconButton(onPressed: (){}, icon: Icon(Icons.delete_forever_outlined)),
                    IconButton(onPressed: (){}, icon: Icon(Icons.edit))
                  ],
                )
              ],
            )
          ],

        ),
      ),
    );
  }
}