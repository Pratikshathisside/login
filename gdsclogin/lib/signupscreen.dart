import 'package:gdsclogin/main.dart';
import 'package:gdsclogin/profile.dart';
import 'package:flutter/material.dart';
import 'package:gdsclogin/profile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:gdsclogin/services/firebase_services.dart';
import 'package:gdsclogin/signupscreen.dart';

class signupscreen extends StatefulWidget {
  const signupscreen({Key? key}) : super(key: key);
  @override
  _signupscreenState createState() => _signupscreenState();
  // This widget is the root of your application.
}

class _signupscreenState extends State<signupscreen> {
  static Future<User?> loginUsingEmailPassword(
      {required String email,
      required String password,
      required BuildContext context}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      user = userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found") {
        print("No user found for that email");
      }
    }

    return user;
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController _emailController = TextEditingController();
    TextEditingController _passwordController = TextEditingController();

    return Scaffold(
        body: Container(
            child: Padding(
      padding: EdgeInsets.all(16),
      //padding: EdgeInsets.fromLTRB(
      //    20, MediaQuery.of(context).size.height * 0.15, 20, 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //Text(
          //  "",
          //  style: TextStyle(
          //      color: Colors.black, fontSize: 23, fontWeight: FontWeight.bold),
          //),

          Text(
            "Login ",
            style: TextStyle(
              fontFamily: 'Inria_Serif',
              fontSize: 40.0,
              fontWeight: FontWeight.bold,
              letterSpacing: 2.0,
              color: Colors.black,
            ),
          ),
          SizedBox(
            height: 46,
          ),
          reusableTextField(
              "Enter Email", Icons.email_outlined, false, _emailController),

          //TextField(
          //  controller: _emailController,
          //  keyboardType: TextInputType.emailAddress,
          //  decoration: const InputDecoration(
          //      hintText: "User Email",
          //      prefixIcon: Icon(
          //        Icons.email,
          //        color: Colors.black54,
          //      )),
          //),
          SizedBox(
            height: 30,
          ),
          reusableTextField(
              "Enter Password", Icons.lock_outline, true, _passwordController),
          //TextField(
          //  controller: _passwordController,
          //  obscureText: true,
          //  decoration: InputDecoration(
          //      hintText: "Enter Your Password",
          //      prefixIcon: Icon(
          //        Icons.lock,
          //        color: Colors.black54,
          //      )),
          //),
          SizedBox(
            height: 10,
          ),
          //Text(
          //  "Dont remember password?",
          //  style: TextStyle(color: Colors.blue),
          //),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Text("",
                  style: TextStyle(
                      color: Colors.black, fontFamily: 'Inria Serif')),
              GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => signupscreen()));
                  },
                  child: const Text(
                    " Forgot password?",
                    style: TextStyle(
                      color: Color.fromARGB(255, 99, 101, 103),
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Inria Serif',
                      decoration: TextDecoration.underline,
                    ),
                  ))
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 50,
            margin: const EdgeInsets.fromLTRB(0, 10, 0, 5),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
            child: ElevatedButton(
              //fillColor: Color.fromARGB(0, 24, 24, 25),
              //elevation: 0.0,
              //padding: EdgeInsets.symmetric(vertical: 20.0),
              //shape: RoundedRectangleBorder(
              //    borderRadius: BorderRadius.circular(12.0)),
              onPressed: () async {
                User? user = await loginUsingEmailPassword(
                    email: _emailController.text,
                    password: _passwordController.text,
                    context: context);
                print(user);
                if (user != null) {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => ProfileScreen(),
                  ));
                }
              },
              child: Text(
                "Login",
                style: const TextStyle(
                    color: Color.fromARGB(255, 247, 245, 245),
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    fontFamily: 'Inria_Serif'),
              ),
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith((states) {
                    if (states.contains(MaterialState.pressed)) {
                      return Color.fromARGB(197, 68, 68, 68);
                    }
                    return Color.fromARGB(255, 28, 118, 160);
                  }),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)))),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Don't have a account?",
                  style: TextStyle(
                      color: Colors.black, fontFamily: 'Inria Serif')),
              GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => signupscreen()));
                  },
                  child: const Text(
                    " Sign Up",
                    style: TextStyle(
                      color: Color.fromARGB(255, 32, 134, 229),
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Inria Serif',
                      decoration: TextDecoration.underline,
                    ),
                  ))
            ],
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 50,
            margin: const EdgeInsets.fromLTRB(0, 10, 0, 5),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
            child: ElevatedButton(
              //fillColor: Color.fromARGB(0, 24, 24, 25),
              //elevation: 0.0,
              //padding: EdgeInsets.symmetric(vertical: 20.0),
              //shape: RoundedRectangleBorder(
              //    borderRadius: BorderRadius.circular(12.0)),
              onPressed: () async {
                await FirebaseServices().signInWithGoogle();
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ProfileScreen()));

                User? user = await loginUsingEmailPassword(
                    email: _emailController.text,
                    password: _passwordController.text,
                    context: context);
                print(user);
                if (user != null) {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => ProfileScreen(),
                  ));
                }
              },
              child: Row(children: <Widget>[
                new Image.asset(
                  'images/google.png',
                  height: 30.0,
                ),
                SizedBox(
                  width: 10,
                ),
                new Expanded(
                  child: Text(
                    textAlign: TextAlign.center,
                    "SignIn With Google",
                    style: const TextStyle(
                        color: Color.fromARGB(255, 69, 68, 68),
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                        fontFamily: 'Inria_Serif'),
                  ),
                ),
              ]),

              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith((states) {
                    if (states.contains(MaterialState.pressed)) {
                      return Color.fromARGB(197, 87, 86, 86);
                    }
                    return Color.fromARGB(255, 183, 186, 186);
                  }),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)))),
            ),
          ),
        ],
      ),
    )));
  }
}

TextField reusableTextField(String text, IconData icon, bool isPasswordType,
    TextEditingController controller) {
  return TextField(
    controller: controller,
    obscureText: isPasswordType,
    autocorrect: !isPasswordType,
    cursorColor: Color.fromARGB(255, 32, 31, 31),
    style: TextStyle(color: Color.fromARGB(255, 47, 46, 46)),
    decoration: InputDecoration(
      prefixIcon: Icon(
        icon,
        color: Color.fromARGB(255, 47, 46, 46),
      ),
      labelText: text,
      labelStyle: TextStyle(
          color: Color.fromARGB(255, 52, 52, 52), fontFamily: 'Inria_Serif'),
      filled: true,
      floatingLabelBehavior: FloatingLabelBehavior.never,
      fillColor: Colors.white,
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
              width: 2, style: BorderStyle.none, color: Colors.black)),
    ),
    keyboardType: isPasswordType
        ? TextInputType.visiblePassword
        : TextInputType.emailAddress,
  );
}

Container Signinsignupbutton(
    BuildContext context, bool islogin, Function onTap) {
  return Container(
    width: MediaQuery.of(context).size.width,
    height: 50,
    margin: const EdgeInsets.fromLTRB(0, 10, 0, 5),
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
    child: ElevatedButton(
      onPressed: () {
        onTap();
      },
      child: Text(
        islogin ? 'Login' : 'Sign Up',
        style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18,
            fontFamily: 'Inria_Serif'),
      ),
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.pressed)) {
              return Color.fromARGB(198, 84, 142, 181);
            }
            return Color.fromARGB(255, 32, 134, 229);
          }),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)))),
    ),
  );
}

Container googlebutton(BuildContext context, bool islogin, Function onTap) {
  return Container(
    width: MediaQuery.of(context).size.width / 2.4,
    height: 50,
    margin: const EdgeInsets.fromLTRB(0, 5, 0, 30),
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
    child: ElevatedButton(
      onPressed: () {
        onTap();
      },
      child: Row(
        children: <Widget>[
          new Image.asset(
            'images/google.png',
            height: 30.0,
          ),
          SizedBox(
            width: 10,
          ),
          new Expanded(
            child: Text(
              islogin ? 'Google' : 'Google',
              style: const TextStyle(
                  color: Color.fromARGB(255, 57, 57, 57),
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  fontFamily: 'Inria_Serif'),
            ),
          ),
        ],
      ),
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.pressed)) {
              return Color.fromARGB(184, 213, 226, 214);
            }
            return Color.fromARGB(246, 213, 226, 214);
          }),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)))),
    ),
  );
}

Container Facebookbutton(BuildContext context, bool islogin, Function onTap) {
  return Container(
    width: MediaQuery.of(context).size.width / 2.2,
    height: 50,
    margin: const EdgeInsets.fromLTRB(0, 5, 0, 30),
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
    child: ElevatedButton(
      onPressed: () {
        onTap();
      },
      child: new Row(
        children: <Widget>[
          Image.asset(
            'images/fb.png',
            height: 30.0,
          ),
          SizedBox(
            width: 10,
          ),
          new Expanded(
            child: Text(
              islogin ? 'Facebook' : 'Facebook',
              style: const TextStyle(
                  color: Color.fromARGB(255, 57, 57, 57),
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  fontFamily: 'Inria_Serif'),
            ),
          ),
        ],
      ),
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.pressed)) {
              return Color.fromARGB(184, 213, 226, 214);
            }
            return Color.fromARGB(246, 213, 226, 214);
          }),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)))),
    ),
  );
}
