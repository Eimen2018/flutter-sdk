import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:onfido_sdk_example/classic.dart';
import 'package:onfido_sdk_example/devtools.dart';
import 'package:onfido_sdk_example/studio.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  await dotenv.load();

  runApp(const MaterialApp(
    title: 'Onfido',
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('en'), // English
        Locale('de'), // German
        Locale('ru'), // Russian
        Locale('es'), // Spanish
        Locale('ar'), // Arabic
      ],
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            bottom: const TabBar(
              tabs: [
                Tab(text: "Classic"),
                Tab(text: "Studio"),
                Tab(text: "DevTools"),
              ],
            ),
            title: const Text('Flutter SDK'),
          ),
          body: const TabBarView(
            children: [OnfidoClassic(), OnfidoStudio(), Devtools()],
          ),
        ),
      ),
    );
  }
}
