import 'package:cr_calendar/cr_calendar.dart';
import 'color.dart';
import 'const.dart';
import 'extensions.dart';
import 'widgets/create_event.dart';
import 'widgets/day_item.dart';
import 'widgets/events_box.dart';
import 'widgets/week_days.dart';
import 'widgets/event.dart';
import 'package:flutter/material.dart';
import 'package:easy_search_bar/easy_search_bar.dart';
import 'package:hive_flutter/adapters.dart';

/// Main calendar page.
class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});

  @override
  _CalendarPageState createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  final _currentDate = DateTime.now();
  String searchValue = '';
  //late final Box box;

  late CrCalendarController _calendarController;
  late String _appbarTitle;
  late String _monthName;

  @override
  void initState() {
    _setTexts(_currentDate.year, _currentDate.month);
    _createExampleEvents();
    //box = Hive.box('events');
    super.initState();
  }

  @override
  void dispose() {
    _calendarController.dispose();
    Hive.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: EasySearchBar(
          title: Text(_appbarTitle),
          iconTheme: const IconThemeData(color: black),
          onSearch: (value) => setState(() => searchValue = value)),
      floatingActionButton: FloatingActionButton(
        onPressed: _addEvent,
        child: const Icon(Icons.add),
      ),
      body: Column(
        children: [
          /// Calendar control row.
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back_ios),
                onPressed: () {
                  _changeCalendarPage(showNext: false);
                },
              ),
              Text(
                _monthName,
                style: const TextStyle(
                    fontSize: 16, color: violet, fontWeight: FontWeight.w600),
              ),
              IconButton(
                icon: const Icon(Icons.arrow_forward_ios),
                onPressed: () {
                  _changeCalendarPage(showNext: true);
                },
              ),
            ],
          ),

          /// Calendar view.
          Expanded(
            child: CrCalendar(
              firstDayOfWeek: WeekDay.sunday,
              eventsTopPadding: 32,
              initialDate: _currentDate,
              maxEventLines: 3,
              controller: _calendarController,
              forceSixWeek: false,
              dayItemBuilder: (builderArgument) =>
                  DayItemWidget(properties: builderArgument),
              weekDaysBuilder: (day) => WeekDaysWidget(day: day),
              eventBuilder: (drawer) => EventWidget(drawer: drawer),
              onDayClicked: _showDayEventsInModalSheet,
              minDate: DateTime.now().subtract(const Duration(days: 1000)),
              maxDate: DateTime.now().add(const Duration(days: 180)),
            ),
          ),
        ],
      ),
    );
  }

  /// Control calendar with arrow buttons.
  void _changeCalendarPage({required bool showNext}) => showNext
      ? _calendarController.swipeToNextMonth()
      : _calendarController.swipeToPreviousPage();

  void _onCalendarPageChanged(int year, int month) {
    setState(() {
      _setTexts(year, month);
    });
  }

  /// Set app bar text and month name over calendar.
  void _setTexts(int year, int month) {
    final date = DateTime(year, month);
    _appbarTitle = date.format(kAppBarDateFormat);
    _monthName = date.format(kMonthFormat);
  }

  /// Show current month page.
  void _showCurrentMonth() {
    _calendarController.goToDate(_currentDate);
  }

  /// Show [CreateEventDialog] with settings for new event.
  Future<void> _addEvent() async {
    final event = await showDialog(
        context: context, builder: (context) => const CreateEventDialog());
    if (event != null) {
      _calendarController.addEvent(event);
      //box.add(event);
      //print('Event added: $event');
      //print(box.values.toList());
    }
  }

  void _createExampleEvents() {
    final now = _currentDate;
    _calendarController = CrCalendarController(
      onSwipe: _onCalendarPageChanged,
      events: [
        CalendarEventModel(
          name: '1 event',
          begin: DateTime(now.year, now.month, (now.day).clamp(1, 28)),
          end: DateTime(now.year, now.month, (now.day).clamp(1, 28)),
          eventColor: eventColors[0],
        ),
        CalendarEventModel(
          name: '2 event',
          begin: DateTime(now.year, now.month - 1, (now.day - 2).clamp(1, 28)),
          end: DateTime(now.year, now.month, (now.day + 2).clamp(1, 28)),
          eventColor: eventColors[1],
        ),
        CalendarEventModel(
          name: '3 event',
          begin: DateTime(now.year, now.month, (now.day - 3).clamp(1, 28)),
          end: DateTime(now.year, now.month + 1, (now.day + 4).clamp(1, 28)),
          eventColor: eventColors[2],
        ),
        CalendarEventModel(
          name: '4 event',
          begin: DateTime(now.year, now.month - 1, (now.day).clamp(1, 28)),
          end: DateTime(now.year, now.month + 1, (now.day + 5).clamp(1, 28)),
          eventColor: eventColors[3],
        ),
        CalendarEventModel(
          name: '5 event',
          begin: DateTime(now.year, now.month + 1, (now.day + 1).clamp(1, 28)),
          end: DateTime(now.year, now.month + 2, (now.day + 7).clamp(1, 28)),
          eventColor: eventColors[4],
        ),
      ],
    );
  }

  void _showDayEventsInModalSheet(
      List<CalendarEventModel> events, DateTime day) {
    showModalBottomSheet(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(8))),
        isScrollControlled: true,
        context: context,
        builder: (context) => DayEventsBottomSheet(
              events: events,
              day: day,
              screenHeight: MediaQuery.of(context).size.height,
            ));
  }
}
