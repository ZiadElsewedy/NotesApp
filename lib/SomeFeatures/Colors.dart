import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

String getCurrentFormattedDateTime() {
  return DateFormat('yyyy-MM-dd – kk:mm').format(DateTime.now());
}

class Coloritem extends StatelessWidget {
  const Coloritem({super.key});

  @override
  Widget build(BuildContext context) {
    return const CircleAvatar(
      radius: 20,
      backgroundColor: Colors.blue,
    );
  }
}
class ColorListView extends StatelessWidget {
  const ColorListView({super.key});

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: 50,
      child: ListView.builder(
        itemCount: 10,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              radius: 20,
              backgroundColor: Colors.primaries[index],
            ),
          );
        },
      ),
    );
  }
}