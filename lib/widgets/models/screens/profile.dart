import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      backgroundColor: Colors.black,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Profile Image or Netflix Logo
          Padding(
            padding: const EdgeInsets.only(top: 34),
            child: Container(
              height: 120,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/Netflix.jpeg'),
                ),
              ),
            ),
          ),
          SizedBox(height: 20), // Add space between elements

          // Welcome Text and Info
          Column(
            children: [
              Text(
                'Welcome To Netflix',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                "A top streaming service with a wide range of movies,",
                style: TextStyle(color: Color.fromARGB(255, 156, 156, 156), fontSize: 15),
                textAlign: TextAlign.center,
              ),
              Text(
                "shows, and original content like Stranger Things and",
                style: TextStyle(color: Color.fromARGB(255, 156, 156, 156), fontSize: 15),
                textAlign: TextAlign.center,
              ),
              Text(
                "Squid Game, serving millions globally.",
                style: TextStyle(color: Color.fromARGB(255, 156, 156, 156), fontSize: 15),
                textAlign: TextAlign.center,
              ),
            ],
          ),
          SizedBox(height: 30),

          // 4 Containers with Icon and Text
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView(
                children: createContainers(),
              ),
            ),
          ),

          
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: TextButton(
              onPressed: () {
          
                print("Sign Out tapped");
              },
              child: Text(
                "Sign Out",
                style: TextStyle(
                  color: Colors.red, 
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> createContainers() {
    List<Map<String, dynamic>> data = [
      {'icon': Icons.list, 'text': 'My List'},
      {'icon': Icons.person, 'text': 'Account'},
      {'icon': Icons.settings, 'text': 'Settings'},
      {'icon': Icons.info, 'text': 'About'},
    ];

    return data.map((item) {
      return Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 83, 83, 83),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          children: [
            Icon(item['icon'], color: Colors.white),
            SizedBox(width: 10),
            Text(
              item['text'],
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ],
        ),
      );
    }).toList();
  }
}
