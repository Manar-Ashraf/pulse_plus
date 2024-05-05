import 'package:flutter/material.dart';

class Doctor extends StatelessWidget {
  const Doctor({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFE5E7),
      appBar: AppBar(
        toolbarHeight: 30,
        backgroundColor: const Color(0xFFFFE5E7),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text("Doctor Information",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w900)),
            const SizedBox(height: 80),
            Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              width: 300,
              height: 50,
              child: const Text('Doctor Name',
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
              child: const Text('Phone number',
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
              child: const Text('Email',
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
              child: const Text('Address',
                  style: TextStyle(color: Color(0xFF7E1D19), fontSize: 16)),
            ),
            const SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () {},
                    child: const Text(
                      "Send via Phone",
                      style: TextStyle(color: Color(0xFF7E1D19), fontSize: 16),
                    )),
                const SizedBox(
                  width: 10,
                ),
                ElevatedButton(
                    onPressed: () {},
                    child: const Text("Send via Email",
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
