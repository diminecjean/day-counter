import 'package:demo/date-picker.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  // final date1 = DateTime(2023, 01, 03);
  DateTime date1 = DateTime.now();
  final date2 = DateTime.now();
  int _difference = 0;

  void _dayCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.

      int daysBetween(DateTime from, DateTime to) {
        from = DateTime(from.year, from.month, from.day);
        to = DateTime(to.year, to.month, to.day);
        return (to.difference(from).inHours / 24).round();
      }

      date1 = DateTime.parse("${selectedDate.toLocal()}".split(' ')[0]);
      _difference = daysBetween(date1, date2);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Day Counter'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have been together for:',
            ),
            Text(
              '$_difference days',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            ElevatedButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(
                    Color.fromARGB(255, 134, 134, 134)),
                backgroundColor: MaterialStateProperty.all<Color>(
                    Color.fromARGB(1, 255, 208, 0)),
              ),
              onPressed: () => _selectDate(context),
              child: Text('Select Date'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _dayCounter,
        tooltip: 'Refresh the day counter',
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
