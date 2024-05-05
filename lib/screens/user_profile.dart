import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFFFE5E7),
        appBar: AppBar(
          toolbarHeight: 30,
          backgroundColor: const Color(0xFFFFE5E7),
        ),
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
              const Text('Name',
                  style: TextStyle(
                      color: Color(0xFF7E1D19),
                      fontSize: 20,
                      fontWeight: FontWeight.w600)),
              const SizedBox(height: 30),
              Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                width: 300,
                height: 50,
                child: const Text('Email',
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
                child: const Text('Age',
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
                child: const Text('Phone number',
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
                child: const Text('Gender',
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
                child: const Text('Medications that Affect Heart Rate',
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
                child: const Text('Emergency Name',
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
                child: const Text('Emergency Contact',
                    style: TextStyle(color: Color(0xFF7E1D19), fontSize: 16)),
              ),
            ],
          ),
        ));
  }
}
