import 'package:flutter/material.dart';
import 'package:flutter_application_1/screen/tabs.dart';
import 'package:google_fonts/google_fonts.dart';


final theme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    seedColor: const Color.fromARGB(255, 34, 156, 23),
    brightness: Brightness.dark,
  ),
  textTheme: GoogleFonts.latoTextTheme()
);

void main() {
  return runApp(
    const App(),
  );
}

class App extends StatelessWidget {
  const App({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme,
      home: const TabsScreen(),
    );
  }
}
