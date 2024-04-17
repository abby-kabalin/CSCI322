import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import '../color.dart';
import 'calendar.dart';
import 'list.dart';
import 'list2.dart';
import 'calendar_event_model.dart';

main() async => {
      // Initialize hive
      await Hive.initFlutter(),

      // Register the adapter
      Hive.registerAdapter(CalendarEventModelAdapter()),

      // Open the box
      await Hive.openBox<CalendarEventModelAdapter>('events'),
      runApp(const MyApp()),
    };

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calendar App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      darkTheme: ThemeData.dark(useMaterial3: true),
      themeMode: ThemeMode.light,
      home: const Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          floatingActionButtonTheme:
              const FloatingActionButtonThemeData(backgroundColor: violet),
          primaryColor: violet,
          colorScheme: ColorScheme.fromSwatch().copyWith(secondary: violet),
          iconTheme: const IconThemeData(color: violet),
          outlinedButtonTheme: OutlinedButtonThemeData(
            style: OutlinedButton.styleFrom(
              textStyle: const TextStyle(
                color: violet,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
              foregroundColor: violet,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8))),
            ),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              textStyle: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
              shadowColor: Colors.transparent,
              elevation: 0,
              foregroundColor: violet,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8))),
            ),
          ),
          dialogTheme: const DialogTheme(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(12))),
          ),
        ),
        home: Scaffold(
          body: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(children: [
                SizedBox(
                  height: 564,
                  width: 800,
                  child: const CalendarPage(),
                )
              ]),
              Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(children: [
                      SizedBox(
                        height: 278,
                        width: 420,
                        child: const AnimatedListSample2(),
                      ),
                    ]),
                    Row(children: [
                      SizedBox(
                        height: 278,
                        width: 420,
                        child: const AnimatedListSample(),
                      ),
                    ]),
                  ]),
            ],
          ),
        ));
  }
}
