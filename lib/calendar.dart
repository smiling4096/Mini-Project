import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CalendarPage(),
    );
  }
}

class CalendarPage extends StatefulWidget {
  @override
  _CalendarPageState createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  Map<DateTime, List<String>> _events = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Event Calendar'),
      ),
      body: Column(
        children: [
          TableCalendar(
            focusedDay: _focusedDay,
            firstDay: DateTime.utc(2020, 1, 1),
            lastDay: DateTime.utc(2030, 12, 31),
            calendarFormat: _calendarFormat,
            selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                _selectedDay = selectedDay;
                _focusedDay = focusedDay;
              });
            },
            onFormatChanged: (format) {
              setState(() {
                _calendarFormat = format;
              });
            },
            eventLoader: (day) => _events[day] ?? [],
          ),
          const SizedBox(height: 10),
          if (_selectedDay != null)
            Expanded(
              child: ListView(
                children: (_events[_selectedDay] ?? [])
                    .map((event) => ListTile(title: Text(event)))
                    .toList(),
              ),
            ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _addEvent(),
        child: const Icon(Icons.add),
      ),
    );
  }

  void _addEvent() {
    if (_selectedDay == null) return;

    showDialog(
      context: context,
      builder: (context) {
        final TextEditingController eventController =
            TextEditingController();
        return AlertDialog(
          title: const Text('Add Event'),
          content: TextField(
            controller: eventController,
            decoration: const InputDecoration(hintText: 'Enter event'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                final event = eventController.text;
                if (event.isNotEmpty) {
                  setState(() {
                    if (_events[_selectedDay!] == null) {
                      _events[_selectedDay!] = [];
                    }
                    _events[_selectedDay!]!.add(event);
                  });
                }
                Navigator.pop(context);
              },
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
  }
}