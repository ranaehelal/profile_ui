import 'package:flutter/material.dart';
import 'package:profile_ui/profile_page.dart';
import 'constvar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:profile_ui/notification_page.dart';
import 'package:profile_ui/theme/dark_theme.dart';
import 'package:profile_ui/theme/light_theme.dart';
ValueNotifier<ThemeMode> themeNotifier = ValueNotifier(ThemeMode.light);

void main() {
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: themeNotifier,
      builder: (context, themeMode, child) {
        return MaterialApp(

          debugShowCheckedModeBanner: false,
          home: NotificationPage(),
          themeMode: themeMode,
          theme: ThemeData(
            colorScheme: lightColorScheme,
            appBarTheme: appBarTheme,
            textTheme: textTheme,

            scaffoldBackgroundColor: Color(0xDAF3EFEF),

          ),
          darkTheme: ThemeData(
            colorScheme: darkColorScheme,
            appBarTheme: appBarThemeDark,
            textTheme: textThemeDark,
            scaffoldBackgroundColor: Colors.grey[900]!,
          ),
        );
      },
    );
  }
}


class MyApp2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProfilePage( user: firstUser,),
    );
  }
}

