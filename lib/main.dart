//
// Daniel Valencia
// CS 378, Fall 2022
// Project 4: Package Exploration
//
// This project incorporates the Google Maps API and the fl_chart packages
// to create an app that displays information about the soccer players Lionel
// Messi and Cristiano Ronaldo. Clicking the Ronaldo image will take the user
// to a second screen that uses Google Maps to display his hometown of Funchal,
// Portugal. Similarly, clicking the Messi image will take the user to a third
// screen that also uses Google Maps to display his hometown of Rosario,
// Argentina. Each maps screen also has toggles in the upper corners to change
// how the map is displayed.
// Finally, clicking the trophy image will take the user to a fourth
// screen that displays a bar chart featuring a comparison of stats between the
// two players. The app was tested using a Pixel 4 running API 33. The standard
// Pixel 3 XL we've been using doesn't work because it doesn't have the Google
// Play Services needed to display the Google Maps.
//
// Just in case its needed even though its already included in the files:
// API KEY: AIzaSyCLI15iEO1frUAHiaypjRdVvsSed8-ugoQ
//
// References used:
// https://blog.logrocket.com/google-maps-flutter/
// https://pub.dev/packages/fl_chart
//
import 'package:flutter/material.dart';
import 'RonaldoScreen.dart';
import 'MessiScreen.dart';
import 'StatsScreen.dart';
//ignore_for_file: prefer_const_constructors

// runs the app and holds the route information
void main() {
  runApp(
    MaterialApp(
      title: 'Package Exploration',
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/second': (context) => const FunchalMap(),
        '/third': (context) => const RosarioMap(),
        '/fourth': (context) => const StatsChart(),
      },
    ),
  );
}

// this class implements the content for the Ronaldo visual. it uses a circle
// avatar with a border that when tapped, takes the user to the corresponding
// Google Maps screen. the text to the right of the image is bolded to improve
// readability.
class RonaldoContent extends StatelessWidget {
  const RonaldoContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.redAccent,
      child: Row(
        children: <Widget> [
          SizedBox(
            width: 125,
            height: 100,
            // makes image clickable and able to navigate to new screen
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/second');
              },
              // nested a circle avatar inside of another one to give the
              // image a border
              child: CircleAvatar(
                backgroundColor: Colors.black,
                radius: 50.0,
                child: CircleAvatar(
                    backgroundImage: AssetImage('images/ronaldo.jpg'),
                    radius: 47.0,
                ),
              ),
            ),
          ),
          // expanded widget used to fill rest of space in the row
          Expanded(
            child: Text("See Ronaldo's Hometown", textAlign: TextAlign.left,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 22.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// this class implements the content for the Messi visual. it uses a circle
// avatar with a border that when tapped, takes the user to the corresponding
// Google Maps screen. the text to the right of the image is bolded to improve
// readability.
class MessiContent extends StatelessWidget {
  const MessiContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.lightBlueAccent,
      child: Row(
        children: <Widget> [
          SizedBox(
            width: 125,
            height: 100,
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/third');
              },
              child: CircleAvatar(
                backgroundColor: Colors.black,
                radius: 50.0,
                child: CircleAvatar(
                  backgroundImage: AssetImage('images/messi.png'),
                  radius: 47.0,
                ),
              ),
            ),
          ),
          Expanded(
            child: Text("See Messi's Hometown", textAlign: TextAlign.left,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 22.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// this class implements the content for the trophy visual. it uses a circle
// avatar with a border that when tapped, takes the user to the stats screen
// the text to the right of the image is bolded to improve readability.
class TrophyContent extends StatelessWidget {
  const TrophyContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber,
      child: Row(
        children: <Widget> [
          SizedBox(
            width: 125,
            height: 100,
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/fourth');
              },
              child: CircleAvatar(
                backgroundColor: Colors.black,
                radius: 50.0,
                child: CircleAvatar(
                  backgroundImage: AssetImage('images/trophy.jpg'),
                  radius: 47.0,
                ),
              ),
            ),
          ),
          Expanded(
            child: Text("See Career Stats", textAlign: TextAlign.left,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 22.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// this class implements the home screen of the app. it uses a bigger appbar to
// display an image and places the title at the bottom to improve readability.
// the three visuals are placed in a column with adequate spacing in between.
class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        toolbarHeight: 180,
        // set appbar background to flag image
        flexibleSpace: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/flags.jpg'),
              fit: BoxFit.cover
            ),
          ),
        ),
        // used to be able to set text at bottom of appbar
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(48.0),
          child: Text(
            "Messi vs Ronaldo",
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 50),
            RonaldoContent(),
            SizedBox(height: 50),
            MessiContent(),
            SizedBox(height: 50),
            TrophyContent(),
          ],
        ),
      ),
    );
  }
}




