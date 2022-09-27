import 'dart:developer';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../core/utils/utils.dart';

class Calender extends StatefulWidget {
  const Calender({super.key});

  @override
  State<Calender> createState() => _CalenderState();
}

class _CalenderState extends State<Calender> {
   final ValueNotifier<DateTime> listnerDate = ValueNotifier(DateTime.now());

  late final ValueNotifier<List<Event>> _selectedEvents;
  CalendarFormat _calendarFormat = CalendarFormat.month;
  RangeSelectionMode _rangeSelectionMode = RangeSelectionMode
      .toggledOff; // Can be toggled on/off by longpressing a date
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  DateTime? _rangeStart;
  DateTime? _rangeEnd;
  late final PageController _pageController;

  @override
  void initState() {
    super.initState();

    _selectedDay = _focusedDay;
    _selectedEvents = ValueNotifier(_getEventsForDay(_selectedDay!));
  }

  @override
  void dispose() {
    _selectedEvents.dispose();
    super.dispose();
  }

  List<Event> _getEventsForDay(DateTime day) {
    // Implementation example
    return kEvents[day] ?? [];
  }

  List<Event> _getEventsForRange(DateTime start, DateTime end) {
    // Implementation example
    final days = daysInRange(start, end);

    return [
      for (final d in days) ..._getEventsForDay(d),
    ];
  }

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    if (!isSameDay(_selectedDay, selectedDay)) {
      setState(() {
        _selectedDay = selectedDay;
        _focusedDay = focusedDay;
        _rangeStart = null; // Important to clean those
        _rangeEnd = null;
        _rangeSelectionMode = RangeSelectionMode.toggledOff;
      });

      _selectedEvents.value = _getEventsForDay(selectedDay);
    }
  }

  void _onRangeSelected(DateTime? start, DateTime? end, DateTime focusedDay) {
    setState(() {
      _selectedDay = null;
      _focusedDay = focusedDay;
      _rangeStart = start;
      _rangeEnd = end;
      _rangeSelectionMode = RangeSelectionMode.toggledOn;
    });

    // `start` or `end` could be null
    if (start != null && end != null) {
      _selectedEvents.value = _getEventsForRange(start, end);
    } else if (start != null) {
      _selectedEvents.value = _getEventsForDay(start);
    } else if (end != null) {
      _selectedEvents.value = _getEventsForDay(end);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: HexColor("#1F2137"),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ValueListenableBuilder<DateTime>(
                valueListenable: listnerDate,
                builder: (context, value, _) {
                  return _CalendarHeader(
                    focusedDay: value,
                    onLeftArrowTap: () {
                      _pageController.previousPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeOut,
                      );
                    },
                    onRightArrowTap: () {
                      _pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeOut,
                      );
                    },
                  );
                },
              ),
              TableCalendar<Event>(
                firstDay: kFirstDay,
                lastDay: kLastDay,
                focusedDay: _focusedDay,
                selectedDayPredicate: (day) => isSameDay(
                  _selectedDay,
                  day,
                ),
                rangeStartDay: _rangeStart,
                headerVisible: false,
                rangeEndDay: _rangeEnd,
                calendarFormat: _calendarFormat,
                rangeSelectionMode: _rangeSelectionMode,
                eventLoader: _getEventsForDay,
                startingDayOfWeek: StartingDayOfWeek.monday,
                calendarStyle: CalendarStyle(
                  markerDecoration: BoxDecoration(
                      color: HexColor("#7560E3"), shape: BoxShape.circle),
                  weekendTextStyle: const TextStyle(color: Colors.white),
                  holidayTextStyle: const TextStyle(color: Colors.white),
                  outsideTextStyle: const TextStyle(color: Colors.white),
                  defaultTextStyle: const TextStyle(color: Colors.white),
                  // Use `CalendarStyle` to customize the UI
                  outsideDaysVisible: false,
                ),
                onDaySelected: _onDaySelected,
                onRangeSelected: _onRangeSelected,
                onCalendarCreated: (controller) => _pageController = controller,
                onFormatChanged: (format) {
                  if (_calendarFormat != format) {
                    setState(() {
                      _calendarFormat = format;
                    });
                  }
                },
                onPageChanged: (focusedDay) {
                  _focusedDay = focusedDay;
                },
              ),
              const SizedBox(height: 8.0),
              Expanded(
                child: ValueListenableBuilder<List<Event>>(
                  valueListenable: _selectedEvents,
                  builder: (context, value, _) {
                    return ListView.builder(
                      itemCount: value.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: const EdgeInsets.symmetric(
                            horizontal: 12.0,
                            vertical: 4.0,
                          ),
                          decoration: BoxDecoration(
                            color: HexColor("#050B18"),
                            border: Border.all(),
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          child: ListTile(
                            onTap: () => log('${value[index]}'),
                            title: Text(
                              '${value[index]}',
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CalendarHeader extends StatelessWidget {
  final DateTime focusedDay;
  final VoidCallback onLeftArrowTap;
  final VoidCallback onRightArrowTap;

  const _CalendarHeader({
    Key? key,
    required this.focusedDay,
    required this.onLeftArrowTap,
    required this.onRightArrowTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final headerText = DateFormat.yMMMM().format(focusedDay);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(width: 16.0),
          SizedBox(
            width: 120.0,
            child: Text(
              headerText,
              style:
                  const TextStyle(color: Colors.white, fontFamily: "Josefin"),
            ),
          ),
          const SizedBox(
            width: 100,
          ),
          Row(
            children: [
              IconButton(
                icon: const Icon(
                  Icons.chevron_left,
                  color: Colors.white,
                ),
                onPressed: onLeftArrowTap,
              ),
              IconButton(
                icon: const Icon(
                  Icons.chevron_right,
                  color: Colors.white,
                ),
                onPressed: onRightArrowTap,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
