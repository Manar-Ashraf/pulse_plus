import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pulse_plus/screens/doctor_info.dart';
import 'package:pulse_plus/screens/user_profile.dart';
import 'package:semicircle_indicator/semicircle_indicator.dart';
import 'package:pulse_plus/screens/sign_in_screen.dart';

import 'home_screen.dart';

class TabBarr extends StatefulWidget {
  const TabBarr({Key? key}) : super(key: key);

  @override
  _TabBarrState createState() => _TabBarrState();
}

class _TabBarrState extends State<TabBarr>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  bool _isLoggedIn = false;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    _checkLoggedIn();
  }

  // Check if the user is logged in
  void _checkLoggedIn() {
    if (FirebaseAuth.instance.currentUser != null) {
      setState(() {
        _isLoggedIn = true;
      });
    }
  }

  // Sign out the user and navigate to the sign-in screen
  void _signOutUser() async {
    await FirebaseAuth.instance.signOut();
    setState(() {
      _isLoggedIn = false;
    });
    Get.off(()=>SignInScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFE5E7),
      body: SafeArea(
        child: _isLoggedIn
            ? Column(
          children: [
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  HomeScreen(),
                  Profile(),
                  Doctor(),
                  SignInScreen(),
                ],
              ),
            ),
          ],
        )
            : SignInScreen(), // Show SignInScreen if not logged in
      ),
      bottomNavigationBar: _isLoggedIn
          ? WillPopScope(
        // Intercept back button press
        onWillPop: () async {
          // Navigate to sign-in screen if back button is pressed
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => SignInScreen(),
            ),
          );
          return true;
        },
        child: BottomAppBar(
          child: TabBar(
            controller: _tabController,
            labelColor: Colors.red[200],
            unselectedLabelColor: Colors.grey,
            indicatorColor: Colors.red[200],
            tabs: [
              Tab(
                icon: Image.asset("assets/home.png",height: 22),
                text: 'Home',
              ),
              Tab(
                icon: Image.asset("assets/profile.png",height: 24),
                text: 'Profile',
              ),
              Tab(
                icon: Image.asset("assets/doctor.png",height: 22),
                text: 'Report Doctor',
              ),
              Tab(
                icon: Image.asset("assets/signout.png",height: 22),
                text: 'Sign Out',
              ),
            ],
            onTap: (index) {
              if (index == 3) {
                // Sign out the user when "Sign Out" tab is tapped
                _signOutUser();
              }
            },
          ),
        ),
      )
          : null, // Hide bottom navigation if not logged in
    );
  }
}