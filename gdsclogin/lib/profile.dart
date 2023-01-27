import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:gdsclogin/main.dart';
import 'package:gdsclogin/signupscreen.dart';
import 'package:gdsclogin/loginscreen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Center(
            child: Column(children: [
          CircleAvatar(
            backgroundImage:
                NetworkImage(FirebaseAuth.instance.currentUser!.photoURL ?? ""),
            radius: 100,
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            "Welcome",
            style: TextStyle(
              fontFamily: 'Inria_Serif',
              fontSize: 40.0,
              fontWeight: FontWeight.bold,
              letterSpacing: 2.0,
              color: Colors.black,
            ),
          ),
          Text("${FirebaseAuth.instance.currentUser!.displayName}"),
          Text("${FirebaseAuth.instance.currentUser!.email}"),
          SizedBox(
            height: 30,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => signupscreen(),
                  ));
              return;
            },
            child: Text("LogOut"),
          ),
        ])));
  }
}
