import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:internshala_search/constants/colors.dart';
import 'package:internshala_search/providers/data_provider.dart';
import 'package:internshala_search/screens/search.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => DataProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Internshala Search',
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData.dark().copyWith(
        textTheme: GoogleFonts.urbanistTextTheme(
          ThemeData.dark().textTheme,
        ),
        appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData(color: Colors.white),
          backgroundColor: ConstantColors.darkBackgroundColor,
          actionsIconTheme: IconThemeData(color: Colors.white),
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
        scaffoldBackgroundColor: ConstantColors.darkBackgroundColor,
        cardTheme: const CardTheme(
          color: ConstantColors.darkBackgroundColor,
        ),
        colorScheme: ColorScheme.fromSeed(
          seedColor: ConstantColors.primaryColor,
          primary: ConstantColors.primaryColor,
        ),
        drawerTheme: const DrawerThemeData(
          backgroundColor: ConstantColors.darkBackgroundColor,
        ),
        listTileTheme: const ListTileThemeData(
          textColor: Colors.white,
        ),
      ),
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        scaffoldBackgroundColor: ConstantColors.lightBackgroundColor,
        appBarTheme: const AppBarTheme(
          backgroundColor: ConstantColors.lightBackgroundColor,
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 20,
          ),
        ),
        colorScheme: ColorScheme.fromSeed(
          seedColor: ConstantColors.primaryColor,
          primary: ConstantColors.primaryColor,
        ),
        useMaterial3: true,
      ),
      home: const SearchScreen(),
    );
  }
}
