import 'package:flutter/material.dart';
import 'package:mobile_teori_kuis2/profile/homePage.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: Container(
        color: Colors.grey.shade400,
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Home',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(width: 8),
                    Icon(Icons.home),
                  ],
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Profile',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(width: 8),
                    Icon(Icons.person),
                  ],
                ),
              ),
            ))
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.only(top: 30.0),
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
                        "Luthfi Ardinata Firman",
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "124220140",
                        style: TextStyle(fontSize: 18),
                      ),
                      SizedBox(height: 12),
                      Text(
                        "Batam, 30 Agustus 2004",
                        style: TextStyle(fontSize: 14),
                      ),
                      Text(
                        "Suka Ngoding",
                        style: TextStyle(fontSize: 14),
                      )
                    ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
