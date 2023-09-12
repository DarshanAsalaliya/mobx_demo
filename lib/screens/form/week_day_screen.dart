import 'package:flutter/material.dart';

class WeekDayScreen extends StatefulWidget {
  const WeekDayScreen({Key? key}) : super(key: key);

  @override
  State<WeekDayScreen> createState() => _WeekDayScreenState();
}

class _WeekDayScreenState extends State<WeekDayScreen> {
  int maxSelection = 4; // Set the maximum number of views you can select
  List<bool> isSelectedList = List.generate(
      7, (index) => false); // Initialize with 7 views and all unselected

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('View Selection'),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, // Adjust the number of columns as needed
        ),
        itemCount: 7, // Total number of views
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              setState(() {
                if (isSelectedList[index]) {
                  // Deselect the view
                  isSelectedList[index] = false;
                } else if (isSelectedList
                        .where((isSelected) => isSelected)
                        .length <
                    maxSelection) {
                  // Select the view if the maximum selection count is not reached
                  isSelectedList[index] = true;
                }
              });
            },
            child: Container(
              decoration: BoxDecoration(
                border: isSelectedList[index]
                    ? Border.all(color: Colors.blue, width: 2.0)
                    : null,
              ),
              child: Center(
                child: Text(
                  'View $index',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
