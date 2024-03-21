import 'package:flutter/material.dart';
import 'package:iphone_dial_pad/ui/dial_pad/dial_pad_ui.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: DialPadUi.routeName,
      routes: route,
    );
  }

  Map<String, WidgetBuilder> get route => <String, WidgetBuilder>{
    DialPadUi.routeName:DialPadUi.builder
  };


}
