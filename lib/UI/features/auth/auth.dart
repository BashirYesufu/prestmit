import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:prestmit/UI/features/dashboard/landing.dart';
import 'package:prestmit/UI/widgets/primary_button.dart';
import 'package:prestmit/constants/color_path.dart';
import 'package:prestmit/constants/image_path.dart';

class Auth extends StatefulWidget {
  const Auth({super.key});
  static const routeName = '/auth';

  @override
  State<Auth> createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPath.yellow,
      body: Stack(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Image.asset(
                  ImagePath.lines,
                fit: BoxFit.fill,
                height: 181.5,
                width: 187,
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(ImagePath.box),
                Text('Welcome to E-Bikes'),
                Text('Buying Electric bikes just got a lot easier, Try us today.'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 4,
                      backgroundColor: ColorPath.lightBlack,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: CircleAvatar(
                        radius: 4,
                        backgroundColor: Colors.white,
                      ),
                    ),
                    CircleAvatar(
                      radius: 4,
                      backgroundColor: Colors.white,
                    ),
                  ],
                ),
                PrimaryButton(
                  label: 'Login with google',
                  onTap: ()=> Navigator.pushReplacementNamed(context, LandingTab.routeName),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Don’t have any account?'),
                    Text('Sign Up'),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
