import 'package:flutter/material.dart';
import 'package:mobile_teori_kuis2/profile/homePage.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: Container(
        color: Colors.lightBlue,
        child: Row(
          children: [
            Expanded(
                child: InkWell(
              onTap: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Homepage(),
                    ));
              },
              child: Container(
                height: 80,
                child: Center(
                  child: Text(
                    'Home',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            )),
            Expanded(
                child: InkWell(
              onTap: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProfilePage(),
                    ));
              },
              child: Container(
                height: 80,
                child: Center(
                  child: Text(
                    'Profile',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ))
          ],
        ),
      ),
      appBar: AppBar(
        title: Text('Profile'),
        centerTitle: true,
        backgroundColor: Colors.lightBlue,
      ),
      body: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.only(top: 30.0),
          child: Center(
            child: Card(
              color: Colors.lightBlue,
              child: SizedBox(
                height: 500,
                child: Padding(
                  padding: const EdgeInsets.only(top: 24.0),
                  child: Column(
                    children: [
                      Container(
                        width: 300,
                        height: 300,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(16)),
                            image: DecorationImage(
                                image: AssetImage('assets/profile.jpeg'),
                                fit: BoxFit.cover)),
                      ),
                      Padding(
                        padding: EdgeInsets.all(30),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "Putri Auliya' Nugraheni ",
                                style: TextStyle(
                                    fontSize: 25, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "124220137",
                                style: TextStyle(fontSize: 18),
                              ),
                              SizedBox(height: 12),
                              Text(
                                "Klaten, 14 Februari 2004",
                                style: TextStyle(fontSize: 14),
                              ),
                              Text(
                                "Dancer",
                                style: TextStyle(fontSize: 14),
                              )
                            ]),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
