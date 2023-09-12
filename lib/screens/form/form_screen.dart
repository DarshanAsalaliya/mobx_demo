import 'package:flutter/material.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({Key? key}) : super(key: key);

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  // DateTime? selectedDate;
  // TimeOfDay? selectedTime;
  // String? errorText;

  // Future<void> _selectDate() async {
  //   final DateTime pickedDate = (await showDatePicker(
  //     context: context,
  //     initialDate: selectedDate ?? DateTime.now(),
  //     firstDate: DateTime.now(),
  //     lastDate: DateTime(DateTime.now().year + 1),
  //   ))!;

  //   if (pickedDate != null && pickedDate != selectedDate) {
  //     setState(() {
  //       selectedDate = pickedDate;
  //       errorText = null; // Reset validation error when date changes
  //     });
  //   }
  // }

  // Future<void> _selectTime() async {
  //   final TimeOfDay pickedTime = (await showTimePicker(
  //     context: context,
  //     initialTime: selectedTime ?? TimeOfDay.now(),
  //   ))!;

  //   if (pickedTime != null && pickedTime != selectedTime) {
  //     setState(() {
  //       selectedTime = pickedTime;
  //       errorText = null; // Reset validation error when time changes
  //     });
  //   }
  // }

  // void _validateDateTime() {
  //   if (selectedDate == null || selectedTime == null) {
  //     setState(() {
  //       errorText = 'Please select both date and time.';
  //     });
  //   } else {
  //     // Perform validation logic here if needed
  //     // Example: Check if selectedDateTime is in the future
  //     final selectedDateTime = DateTime(
  //       selectedDate!.year,
  //       selectedDate!.month,
  //       selectedDate!.day,
  //       selectedTime!.hour,
  //       selectedTime!.minute,
  //     );

  //     if (selectedDateTime.isBefore(DateTime.now())) {
  //       setState(() {
  //         errorText = 'Selected date and time must be in the future.';
  //       });
  //     } else {
  //       // Validation successful, you can use selectedDate and selectedTime
  //       print('Selected Date and Time: $selectedDateTime');
  //     }
  //   }
  // }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //       title: Text('Date and Time Picker'),
  //     ),
  //     body: Padding(
  //       padding: const EdgeInsets.all(16.0),
  //       child: Column(
  //         mainAxisAlignment: MainAxisAlignment.center,
  //         children: <Widget>[
  //           ElevatedButton(
  //             onPressed: _selectDate,
  //             child: Text(selectedDate == null
  //                 ? 'Select Date'
  //                 : 'Selected Date: ${selectedDate!.toLocal()}'),
  //           ),
  //           SizedBox(height: 16),
  //           ElevatedButton(
  //             onPressed: _selectTime,
  //             child: Text(selectedTime == null
  //                 ? 'Select Time'
  //                 : 'Selected Time: ${selectedTime!.format(context)}'),
  //           ),
  //           SizedBox(height: 16),
  //           ElevatedButton(
  //             onPressed: _validateDateTime,
  //             child: Text('Validate and Use Date and Time'),
  //           ),
  //           if (errorText != null)
  //             Padding(
  //               padding: const EdgeInsets.all(16.0),
  //               child: Text(
  //                 errorText!,
  //                 style: TextStyle(
  //                   color: Colors.red,
  //                   fontWeight: FontWeight.bold,
  //                 ),
  //               ),
  //             ),
  //         ],
  //       ),
  //     ),
  //   );

  DateTime? startDate;
  DateTime? endDate;
  TimeOfDay? startTime;
  TimeOfDay? endTime;
  String? errorText;

  Future<void> _selectStartDate() async {
    final DateTime pickedDate = (await showDatePicker(
      context: context,
      initialDate: startDate ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(DateTime.now().year + 1),
    ))!;

    if (pickedDate != null) {
      setState(() {
        startDate = pickedDate;
        endDate = null; // Reset end date when start date changes
        errorText = null; // Reset validation error
      });
    }
  }

  Future<void> _selectEndDate() async {
    if (startDate == null) {
      // Show error if start date is not selected
      setState(() {
        errorText = 'Please select a start date first.';
      });
      return;
    }

    final DateTime pickedDate = (await showDatePicker(
      context: context,
      initialDate: endDate ?? startDate!,
      firstDate: startDate!,
      lastDate: DateTime(DateTime.now().year + 1),
    ))!;

    if (pickedDate != null) {
      setState(() {
        endDate = pickedDate;
        errorText = null; // Reset validation error
      });
    }
  }

  Future<void> _selectStartTime() async {
    final TimeOfDay pickedTime = (await showTimePicker(
      context: context,
      initialTime: startTime ?? TimeOfDay.now(),
    ))!;

    if (pickedTime != null) {
      setState(() {
        startTime = pickedTime;
        endTime = null; // Reset end time when start time changes
        errorText = null; // Reset validation error
      });
    }
  }

  Future<void> _selectEndTime() async {
    if (startTime == null) {
      // Show error if start time is not selected
      setState(() {
        errorText = 'Please select a start time first.';
      });
      return;
    }

    final TimeOfDay pickedTime = (await showTimePicker(
      context: context,
      initialTime: endTime ?? startTime!,
    ))!;

    if (pickedTime != null) {
      setState(() {
        endTime = pickedTime;
        errorText = null; // Reset validation error
      });
    }
  }

  void _validateDateTimeRange() {
    if (startDate == null ||
        endDate == null ||
        startTime == null ||
        endTime == null) {
      setState(() {
        errorText = 'Please select both start and end date/time.';
      });
      return;
    }

    final startDateTime = DateTime(startDate!.year, startDate!.month,
        startDate!.day, startTime!.hour, startTime!.minute);
    final endDateTime = DateTime(endDate!.year, endDate!.month, endDate!.day,
        endTime!.hour, endTime!.minute);

    if (endDateTime.isBefore(startDateTime)) {
      setState(() {
        errorText = 'End date/time cannot be earlier than start date/time.';
      });
      return;
    }

    // Validation successful, you can use startDateTime and endDateTime
    print('Selected Start Date/Time: $startDateTime');
    print('Selected End Date/Time: $endDateTime');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Date and Time Range Picker'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: _selectStartDate,
              child: Text(startDate == null
                  ? 'Select Start Date'
                  : 'Start Date: ${startDate!.toLocal()}'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _selectStartTime,
              child: Text(startTime == null
                  ? 'Select Start Time'
                  : 'Start Time: ${startTime!.format(context)}'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _selectEndDate,
              child: Text(endDate == null
                  ? 'Select End Date'
                  : 'End Date: ${endDate!.toLocal()}'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _selectEndTime,
              child: Text(endTime == null
                  ? 'Select End Time'
                  : 'End Time: ${endTime!.format(context)}'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _validateDateTimeRange,
              child: Text('Validate and Use Date and Time Range'),
            ),
            if (errorText != null)
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  errorText!,
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

// extension TimeOfDayFormatting on TimeOfDay {
//   String format(BuildContext context) {
//     final timeFormat = MaterialLocalizations.of(context).timeOfDayFormat(this);
//     return timeFormat;
//   }
// }
