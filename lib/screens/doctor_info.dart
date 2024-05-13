import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Doctor extends StatefulWidget {
  @override
  State<Doctor> createState() => _DoctorState();
}

class _DoctorState extends State<Doctor> {
  String doctorName = '';
  String doctorPhone = '';

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
          String doctorName = snapshot.data()?['doctorName'] ?? '';
          String doctorPhone = snapshot.data()?['doctorPhone'] ?? '';
          // Update the UI or do further processing with the fetched data
          setState(() {
            this.doctorName = doctorName;
            this.doctorPhone = doctorPhone;
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
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text("Doctor Information",
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w900,
                    color: Color(0xFF7E1D19))),
            const SizedBox(height: 80),
            Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              width: 300,
              height: 50,
              child: Text(doctorName,
                  style: TextStyle(color: Color(0xFF7E1D19), fontSize: 16)),
            ),
            const SizedBox(height: 30),
            Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              width: 300,
              height: 50,
              child: Text(doctorPhone,
                  style: TextStyle(color: Color(0xFF7E1D19), fontSize: 16)),
            ),
            const SizedBox(height: 80),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () {},
                    child: const Text(
                      "Call via Phone",
                      style: TextStyle(color: Color(0xFF7E1D19), fontSize: 16),
                    )),
                const SizedBox(
                  width: 10,
                ),
                ElevatedButton(
                    onPressed: () {},
                    child: const Text("Send via Phone",
                        style:
                            TextStyle(color: Color(0xFF7E1D19), fontSize: 16)))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
