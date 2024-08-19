import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}
class User {
  final String name;
  final String location;
  final String profilePicture;
  final int followers;
  final int following;

  User({
    required this.name,
    required this.location,
    required this.profilePicture,
    required this.followers,
    required this.following,
  });
}
final firstUser = User(
  name: 'Bruno Pham',
  location: 'Da Nang, Vietnam',
  profilePicture: 'assets/profile_picture.jpg',
  followers: 220,
  following: 150,
);


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProfilePage(),
    );
  }
}
