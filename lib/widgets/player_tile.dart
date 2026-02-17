import 'package:flutter/material.dart';
import '../models/jucator.dart';

class PlayerTile extends StatelessWidget {
  final Jucator jucator;
  final int position;
  final ValueChanged<int> onChange;

  const PlayerTile({Key? key, required this.jucator, required this.position, required this.onChange}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: ListTile(
        leading: CircleAvatar(child: Text('$position')),
        title: Text(jucator.nume, style: TextStyle(fontWeight: FontWeight.bold)),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('${jucator.puncte} pct', style: TextStyle(fontSize: 18)),
            SizedBox(width: 8),
            ElevatedButton(
              onPressed: () => onChange(1),
              child: Text('1'),
            ),
            SizedBox(width: 6),
            ElevatedButton(
              onPressed: () => onChange(3),
              child: Text('3'),
            ),
            SizedBox(width: 6),
            ElevatedButton(
              onPressed: () => onChange(-1),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              child: Text('-1'),
            ),
          ],
        ),
      ),
    );
  }
}
