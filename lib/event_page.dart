import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:lottie/lottie.dart'; 
import 'custom_app_bar.dart';

class EventsPage extends StatefulWidget {
  final Function(bool) onThemeChanged;

  const EventsPage({super.key, required this.onThemeChanged});

  @override
  _EventsPageState createState() => _EventsPageState();
}

class _EventsPageState extends State<EventsPage> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  bool _isEventDay = false;
  bool _hasCelebrationPlayed = false; 

  final Map<DateTime, Map<String, dynamic>> _events = {
    DateUtils.dateOnly(DateTime.utc(2024, 10, 17)): {
      'title': 'GDSC Meeting',
      'icon': Icons.group,
      'color': Colors.blueAccent,
      'registrations': 0,
      'isRegistered': false,
      'shape': BoxShape.circle,
      'time': '4:30 PM',
      'place': 'Science Hall 118',
    },
    DateUtils.dateOnly(DateTime.utc(2024, 10, 31)): {
      'title': 'GDSC Meeting',
      'icon': Icons.group,
      'color': Colors.blueAccent,
      'registrations': 0,
      'isRegistered': false,
      'shape': BoxShape.circle,
      'time': '4:30 PM',
      'place': 'Science Hall 118',
    },
    DateUtils.dateOnly(DateTime.utc(2024, 11, 15)): {
      'title': 'Programming Competition',
      'icon': Icons.code,
      'color': Colors.redAccent,
      'registrations': 0,
      'isRegistered': false,
      'shape': BoxShape.rectangle,
      'time': '4:30 PM',
      'place': 'Science Hall 118',
    },
  };


  List<Map<String, dynamic>> _getEventsForDay(DateTime day) {
    DateTime onlyDate = DateUtils.dateOnly(day);
    if (_events.containsKey(onlyDate)) {
      return [_events[onlyDate]!];
    }
    return [];
  }

  void _showRegistrationDialog(String eventTitle, DateTime eventDate) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        DateTime key = DateUtils.dateOnly(eventDate);
        bool isRegistered = _events[key]!['isRegistered'];
        String eventTime = _events[key]!['time'];
        String eventPlace = _events[key]!['place'];

        return AlertDialog(
          title: Text('Register for $eventTitle'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Time: $eventTime'),
              Text('Place: $eventPlace'),
              const SizedBox(height: 10),
              isRegistered
                ? const Text('You have already registered for this event.')
                : const Text('Would you like to register for this event?'),
            ],
          ),
          actions: isRegistered
              ? [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('OK'),
                  ),
                ]
              : [
                  TextButton(
                    onPressed: () {
                      setState(() {
                        _events[key]!['registrations'] += 1;
                        _events[key]!['isRegistered'] = true;
                      });
                      Navigator.of(context).pop();
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Registration confirmed!')));
                    },
                    child: const Text('Yes'),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('No'),
                  ),
                ],
        );
      },
    );
  }



  Widget _celebrateEventDay() {
    if (_hasCelebrationPlayed) return Container();

    _hasCelebrationPlayed = true;
    return Lottie.asset(
      'celebration.json',
      repeat: false, 
      onLoaded: (composition) {
        Future.delayed(composition.duration, () {
          setState(() {
            _hasCelebrationPlayed = true;
          });
        });
      },
    );
  }


  DateTime? _getNextEventDate() {
    DateTime now = DateTime.now();
    for (DateTime date in _events.keys) {
      if (date.isAfter(now)) {
        return date;
      }
    }
    return null;
    }

  Widget _buildCountdownTimer() {
    DateTime? nextEventDate = _getNextEventDate();
    DateTime today = DateUtils.dateOnly(DateTime.now());


    if (_events.containsKey(today)) {
      String eventTitle = _events[today]!['title'];
      return Text(
        '$eventTitle is happening today!',
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      );
    }


    if (nextEventDate != null) {
      int endTime = nextEventDate.millisecondsSinceEpoch;
      return CountdownTimer(
        endTime: endTime,
        widgetBuilder: (_, time) {
          if (time == null) {
            return const Text(
              'Next event has started!',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            );
          }
          return Text(
            'Next event in: ${time.days ?? 0}d ${time.hours ?? 0}h ${time.min ?? 0}m',
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          );
        },
      );
    }
    return const Text('No upcoming events', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold));
  }

  @override
  Widget build(BuildContext context) {
    DateTime today = DateUtils.dateOnly(DateTime.now());

    _isEventDay = _events.containsKey(today);

    return Scaffold(
      appBar: customAppBar(context, "Google Developers Student Club", widget.onThemeChanged),

      body: Stack(
        children: [
          Column(
            children: [
              TableCalendar(
                locale: "en_US",
                headerStyle: const HeaderStyle(formatButtonVisible: false, titleCentered: true),
                availableGestures: AvailableGestures.all,
                firstDay: DateTime.utc(2023, 1, 1),
                lastDay: DateTime.utc(2030, 12, 31),
                focusedDay: _focusedDay,
                selectedDayPredicate: (day) {
                  return isSameDay(_selectedDay, day);
                },
                onDaySelected: (selectedDay, focusedDay) {
                  setState(() {
                    _selectedDay = selectedDay;
                    _focusedDay = focusedDay;
                  });

                  final events = _getEventsForDay(selectedDay);
                  if (events.isNotEmpty) {
                    _showRegistrationDialog(events.first['title'], DateUtils.dateOnly(selectedDay));
                  }
                },
                eventLoader: (day) => _getEventsForDay(day).map((event) => event['title']).toList(),
                calendarStyle: CalendarStyle(
                  todayDecoration: BoxDecoration(
                    color: Theme.of(context).brightness == Brightness.dark
                        ? Colors.lightBlueAccent
                        : Colors.blueAccent,
                    shape: BoxShape.circle,
                  ),
                  selectedDecoration: BoxDecoration(
                    color: Theme.of(context).brightness == Brightness.dark ? Colors.lightBlue : Colors.blue,
                    shape: BoxShape.circle,
                  ),
                ),
                calendarBuilders: CalendarBuilders(
                  markerBuilder: (context, day, events) {
                    if (events.isNotEmpty) {
                      final event = _getEventsForDay(day);
                      return Positioned(
                        bottom: 1,
                        child: Container(
                          width: 8.0,
                          height: 8.0,
                          decoration: BoxDecoration(
                            color: event.first['color'],
                            shape: event.first['shape'],
                          ),
                        ),
                      );
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: _buildCountdownTimer(),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('Upcoming Events', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ),
              Expanded(
                child: ListView(
                  children: _events.entries.map((entry) {
                    DateTime eventDate = entry.key;
                    Map<String, dynamic> event = entry.value;
                    return ListTile(
                      leading: Icon(event['icon']),
                      title: Text("${event['title']} on ${eventDate.month}/${eventDate.day}"),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Time: ${event['time']}"),
                          Text("Place: ${event['place']}"),
                          Text("Registrations: ${event['registrations']}"),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              ),

            ],
          ),
          if (_isEventDay && !_hasCelebrationPlayed)
            Center(
              child: Opacity(
                opacity: 0.7, 
                child: _celebrateEventDay(),
              ),
            ),
        ],
      ),
    );
  }
}
