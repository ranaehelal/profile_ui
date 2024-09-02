import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class User {

  final String name;
  final String username;
  final String location;
  final String profilePicture;
  final int followers;
  final int following;
  final int shots;
  final int collections;



  User({
    required this.name,
    required this.username,
    required this.location,
    required this.profilePicture,
    required this.followers,
    required this.following,
    required this.shots,
    required this.collections,

  });
}
final firstUser = User(
  name: 'Bruno Pham',
  username: 'brunopham',
  location: 'Da Nang, Vietnam',
  profilePicture: 'images/pfp.webp',
  followers: 220,
  following: 150,
  shots: 100,
  collections: 10,
);

class ProfilePage extends StatelessWidget {
  final User user;

  ProfilePage({required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('@' + user.username),
        leading: IconButton(
          padding: EdgeInsets.only(left: 10),
          icon: Icon(Icons.arrow_back, color: Colors.black, size: 40),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.more_vert, color: Colors.black, size: 30),
            onPressed: () {},
          ),
        ],
      ),
      body: ProfileContent(user: user),
    );
  }
}

class ProfileContent extends StatelessWidget {
  final User user;

  ProfileContent({required this.user});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(child: CircleAvatar(
          radius: 50,
          backgroundImage: AssetImage(user.profilePicture),
        ),
        )
        ,
        SizedBox(height: 12),
        Text(
          user.name,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            fontFamily:'Montserrat', // Font family

          ),
        ),
        // SizedBox(height: 5),
        Text(
          user.location,
          style: const TextStyle(
            color: Colors.grey,
            fontSize: 16,
          ),
        ),
        SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: ProfileStat(label: 'Followers', count: user.followers.toString()),
              margin: EdgeInsets.symmetric(horizontal: 25),
            ),
            Container(
              width: 1, // Width of the line
              height: 30, // Height of the line
              color: Colors.grey, // Color of the line
            ),
            Container(

              child: ProfileStat(label: 'Following', count: user.following.toString()),
              margin: EdgeInsets.symmetric(horizontal: 25),),
          ],
        ),
        SizedBox(height: 12),
        ElevatedButton(
          onPressed: () {},
          child: Text('Follow',style: TextStyle(color: Colors.white,fontSize: 18)),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30), // Adjust padding

            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            elevation: 5, // Shadow elevation

          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            IconButton(
              padding: EdgeInsets.only(left: 10),
              icon: FaIcon(FontAwesomeIcons.xTwitter, color: Colors.black, size: 30),
              onPressed: () {},
            ),
            Icon(Icons.circle, size: 7, color: Colors.black),

            IconButton(
              icon: FaIcon(FontAwesomeIcons.instagram, color: Colors.purple, size: 30),
              onPressed: () {},
            ),
            Icon(Icons.circle, size: 7, color: Colors.black),

            IconButton(
              icon: FaIcon(FontAwesomeIcons.facebook, color: Colors.blueAccent, size: 30),
              onPressed: () {},
            ),

          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: Colors.blue, // Border color
                  width: 2.5, // Border width
                ),
              ),// Set the background color here
              child: ProfileStat(label: 'Shots', count: user.shots.toString(),color:Colors.black,),
              margin: EdgeInsets.symmetric(horizontal: 0),
              padding: EdgeInsets.symmetric(horizontal: 25 ,vertical: 7),
              width: 200, // Width of the line


            ),
            Container(
              width: 1, // Width of the line
              height: 30, // Height of the line
              color: Colors.grey, // Color of the line
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.blue.withOpacity(0.8),
                borderRadius: BorderRadius.circular(8),
              ),
              child: ProfileStat(label: 'Collections', count: user.collections.toString(),color:Colors.white,),
              margin: EdgeInsets.symmetric(horizontal: 5),
              padding: EdgeInsets.symmetric(horizontal: 25,vertical: 7),
              width: 200, // Width of the line

            ),
          ],
        ),
        Image.asset("images/THINKING-MAN.png"),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.blue.withOpacity(0.8),
                borderRadius: BorderRadius.circular(20),
              ),// Set the background color here
              child: Text('Donate',style: TextStyle(color: Colors.white,fontSize: 18),  textAlign: TextAlign.center, ),
              margin: EdgeInsets.symmetric(horizontal: 10),
              padding: EdgeInsets.symmetric(horizontal: 25 ,vertical: 7),
              width: 200, // Width of the line


            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.blue.withOpacity(0.8),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text('Message',style: TextStyle(color: Colors.white,fontSize: 18),  textAlign: TextAlign.center, // Align the text to center
              ),

              margin: EdgeInsets.symmetric(horizontal: 10),
              padding: EdgeInsets.symmetric(horizontal: 25,vertical: 7),
              width: 200, // Width of the line

            ),
          ],
        ),

      ],
    );
  }

}
class ProfileStat extends StatelessWidget {
  final String label;
  final String count;
  final Color? color; // Nullable color property

  const ProfileStat({
    required this.label,
    required this.count,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          count,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: color??Colors.black, // Use the color passed in
          ),
        ),
        SizedBox(width: 8), // Spacing between count and label

        Text(
          label,
          style: TextStyle(
            color: color??Colors.grey, // Use the color passed in
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}
