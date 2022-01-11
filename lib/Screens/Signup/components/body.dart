import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Login/login_screen.dart';
import 'package:flutter_auth/Screens/Signup/components/background.dart';
import 'package:flutter_auth/Screens/Signup/components/or_divider.dart';
import 'package:flutter_auth/Screens/Signup/components/social_icon.dart';
import 'package:flutter_auth/components/already_have_an_account_acheck.dart';
import 'package:flutter_auth/components/rounded_button.dart';
import 'package:flutter_auth/components/rounded_input_field.dart';
import 'package:flutter_auth/components/rounded_password_field.dart';
import 'dart:developer';
import 'package:http/http.dart' as http;
import '../../../constants.dart';
import 'dart:convert';


class Body extends StatelessWidget {

  Future<int> attemptSignUp(String username, String password,String email) async {
    var map = new Map<String, dynamic>();
    map["username"]=username;
    map["password"]=password;
    map["email"]=email;
    var res = new http.MultipartRequest("POST",Uri.parse("http://192.168.1.16:8080/user/signup"));
    res.fields['fullName']=username;
    res.fields['email']=email;
    res.fields['password']=password;
    res.send().then((response) {
      log(response.statusCode.toString());
    });
  }

  void displayDialog(context, title, text) => showDialog(
    context: context,
    builder: (context) =>
        AlertDialog(
            title: Text(title),
            content: Text(text)
        ),
  );

  final TextEditingController _usernameController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            SizedBox(height: size.height * 0.13),
            Text(
              "Welcome On Board",
              style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),
            ),
            SizedBox(height: size.height * 0.03),
            Text(
              "Let's help you meet your tasks",
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: size.height * 0.03),
            RoundedInputField(
              hintText: "Full name",
              onChanged: (value) {
                _usernameController.text=value;
              },
            ),
            RoundedInputField(
              hintText: "Your Email",
              onChanged: (value) {
                _emailController.text=value;
              },
            ),
            RoundedPasswordField(
              onChanged: (value) {
                _passwordController.text=value;
              },
            ),
            RoundedButton(
              color: const Color(0xFF50C2C9),
              text: "SIGNUP",
              press: () async {
                var username = _usernameController.text;
                var password = _passwordController.text;
                var email = _emailController.text;

                var res = await attemptSignUp(username, password, email);
              }
            ),
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
              login: false,
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
            OrDivider(),
          ],
        ),
      ),
    );
  }
}
