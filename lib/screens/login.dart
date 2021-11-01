import 'package:daom/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class LoginPage extends GetWidget<AuthController> {
  LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text("Login Page"),
            SizedBox(height: _height * 0.075),
            GestureDetector(
              onTap: () => {controller.signInWithGoogle()},
              child: Container(
                margin: EdgeInsets.only(left: 8, bottom: 16),
                padding: EdgeInsets.all(6),
                height: 35,
                width: 35,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(17.5),
                ),
                child: SvgPicture.asset(
                  'assets/images/googleIcon.svg',
                  fit: BoxFit.contain,
                ),
              ),
            ),
            SizedBox(height: _height * 0.15),
          ],
        ),
      ),
    );
  }
}