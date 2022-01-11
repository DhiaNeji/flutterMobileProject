import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Login/login_screen.dart';
import 'package:flutter_auth/Screens/Signup/signup_screen.dart';
import 'package:flutter_auth/Screens/Welcome/components/background.dart';
import 'package:flutter_auth/components/rounded_button.dart';
import 'package:flutter_auth/constants.dart';
import 'package:flutter_svg/svg.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // This size provide us total height and width of our screen
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            SizedBox(height: size.height * 0.05),
            Image.asset(
              "assets/images/img.png",
              height: size.height * 0.45,
            ),
            Text(
              "Just Trade It",
              style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.05),

            Text(
              "Our Trade application allows",
              style: TextStyle(fontSize: 20),textAlign: TextAlign.center,
            ),
            Text(
              "users to trade their own items",
              style: TextStyle(fontSize: 20),textAlign: TextAlign.center,
            ),
            Text(
              "via internet",
              style: TextStyle(fontSize: 20),textAlign: TextAlign.center,
            ),
            SizedBox(height: size.height * 0.05),
            RoundedButton(
              color: const Color(0xFF50C2C9),
              text: "Get Started",
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LoginScreen();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
