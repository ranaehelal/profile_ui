import 'package:flutter/material.dart';

import 'main.dart';

class NotificationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: 'Activity ',
                style: TextStyle( fontWeight: FontWeight.bold, fontSize: 24,color: theme.appBarTheme.foregroundColor),
              ),
              const TextSpan(
                text: '(03)',
                style: TextStyle(color: Color(0xFF0B65EB), fontSize: 24,fontFamily: 'Poppins', fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        //backgroundColor: theme.appBarTheme.backgroundColor,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
        //    color: theme.appBarTheme.foregroundColor, // Use the theme color
            onPressed: () { print('Settings'); },
          ),
          IconButton(
            icon: Icon(Icons.brightness_6),
          //  color: theme.appBarTheme.foregroundColor,
            onPressed: () {
              // Toggle theme
              themeNotifier.value = themeNotifier.value == ThemeMode.light
                  ? ThemeMode.dark
                  : ThemeMode.light;
            },
          ),
        ],
      ),
      body: buildNotificationList(context),
      bottomNavigationBar: buildBottomNavigationBar(),



    );
  }
}

Widget buildNotificationList(BuildContext context) {
  return ListView.builder(
    itemCount: 10, // Number of notifications
    itemBuilder: (context, index) {
      return buildNotificationItem(context,'Bruno Pham');
    },
  );
}

Widget buildNotificationItem(BuildContext context, String userName) {
  final theme = Theme.of(context); // Get the theme context

  return Container(
    padding: const EdgeInsets.all(9.0),

    child: Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: AssetImage('images/pfp.webp'),
        ),
        title: Text(
          'Bruno Pham',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'liked ',
                    style: TextStyle(
                      color: theme.brightness == Brightness.dark
                          ? Colors.white // Color for dark theme
                          : Colors.black, // Color for light theme
                    ),
                  ),
                  const TextSpan(
                    text: '“clouds in my heart”',
                    style: TextStyle(color: Colors.blueAccent),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Text(
              '2 minutes ago',
              style: TextStyle(color: Colors.grey, fontSize: 12),
            ),
          ],
        ),
        trailing:
        TextButton(
          onPressed: () {
            print('$userName follow');
          },
          child: Text('Follow'),
        ),
        onTap: () {
          print(userName);
        },
      ),
    ),
  );}

Widget buildBottomNavigationBar() {
  return BottomNavigationBar(
    type: BottomNavigationBarType.fixed,
    selectedItemColor: Color(0xFF0B65EB), // Color for the selected item
    unselectedItemColor: Colors.grey,      // Color for the unselected items
    items: <BottomNavigationBarItem>[
      const BottomNavigationBarItem(
        icon: Icon(Icons.home_filled),
        label: '',
      ),
      const BottomNavigationBarItem(
        icon: Icon(Icons.grid_view_rounded),
        label: '',
      ),
      const BottomNavigationBarItem(
        icon: CircleAvatar(
          backgroundColor: Color(0xFF0B65EB),
          child: Icon(Icons.add, color: Colors.white),
        ),
        label: '',
      ),
      BottomNavigationBarItem(
        icon: Stack(
          children: <Widget>[
            const Icon(Icons.notifications),
            Positioned(
              right: 0,
              child: Container(
                width: 12,
                height: 12,
                padding: EdgeInsets.all(1),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: const Text(
                  '1',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 9,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            )
          ],
        ),
        label: '',
      ),
      const BottomNavigationBarItem(
        icon: Icon(Icons.person),
        label: '',
      ),
    ],
  );
}
