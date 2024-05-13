import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Profile extends StatefulWidget {
  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String name = '';
  String email = '';
  String age = '';
  String phone = '';
  String gender = '';
  String medication = '';

  @override
  void initState() {
    super.initState();
    fetchUserData();
  }

  void fetchUserData() async {
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      try {
        QuerySnapshot<Map<String, dynamic>> querySnapshot =
            await FirebaseFirestore.instance
                .collection('users')
                .where('authId', isEqualTo: user.uid)
                .get();

        if (querySnapshot.docs.isNotEmpty) {
          // Assuming there's only one document matching the user's UID
          DocumentSnapshot<Map<String, dynamic>> snapshot =
              querySnapshot.docs.first;

          // Access data from the snapshot
          String name = snapshot.data()?['name'] ?? '';
          String email = snapshot.data()?['email'] ?? '';
          String age = snapshot.data()?['age'] ?? '';
          String gender = snapshot.data()?['gender'] ?? '';
          String phone = snapshot.data()?['phone'] ?? '';
          String medication = snapshot.data()?['medication'] ?? '';

          // Update the UI or do further processing with the fetched data
          setState(() {
            this.name = name;
            this.email = email;
            this.age = age;
            this.gender = gender;
            this.phone = phone;
            this.medication = medication;
          });
        } else {
          print('User document not found');
          // Handle the case where the user document is not found
        }
      } catch (e) {
        print('Error fetching user data: $e');
        // Handle the error, such as displaying a message to the user
      }
    } else {
      print('No user is signed in');
      // Handle the case where no user is signed in
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFE5E7),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Align(alignment: Alignment.topRight),
            const CircleAvatar(
              radius: 40.0,
              backgroundColor: Color(0xFFFFE5E7),
              backgroundImage: AssetImage('assets/avatar.png'),
            ),
            const SizedBox(height: 10),
            Column(
              children: [
                Text(name,
                    style: const TextStyle(
                        color: Color(0xFF7E1D19),
                        fontSize: 20,
                        fontWeight: FontWeight.w900)),
                const SizedBox(height: 30),
                Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  width: 300,
                  height: 50,
                  child: Text(email,
                      style: const TextStyle(
                          color: Color(0xFF7E1D19), fontSize: 16)),
                ),
                const SizedBox(height: 20),
                Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  width: 300,
                  height: 50,
                  child: Text(age,
                      style: TextStyle(color: Color(0xFF7E1D19), fontSize: 16)),
                ),
                const SizedBox(height: 20),
                Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  width: 300,
                  height: 50,
                  child: Text(phone,
                      style: const TextStyle(
                          color: Color(0xFF7E1D19), fontSize: 16)),
                ),
                const SizedBox(height: 20),
                Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  width: 300,
                  height: 50,
                  child: Text(gender,
                      style: TextStyle(color: Color(0xFF7E1D19), fontSize: 16)),
                ),
                const SizedBox(height: 20),
                Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  width: 300,
                  height: 50,
                  child: Text(medication,
                      style: const TextStyle(
                          color: Color(0xFF7E1D19), fontSize: 16),
                      textAlign: TextAlign.center),
                ),
                const SizedBox(height: 50),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
