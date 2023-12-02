import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:prestmit/UI/features/dashboard/landing.dart';
import 'package:prestmit/UI/widgets/primary_button.dart';
import 'package:prestmit/constants/color_path.dart';
import 'package:prestmit/constants/image_path.dart';
import 'package:prestmit/constants/text_styles.dart';

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
                Padding(
                  padding: const EdgeInsets.only(top: 30.0, bottom: 50.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('Welcome to E-Bikes', style: AppTextStyles.black(24, weight: FontWeight.w600),),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12.0),
                        child: Text(
                          'Buying Electric bikes just got a lot easier, Try us today.',
                          style: AppTextStyles.grey(14),
                          textAlign: TextAlign.center,
                        ),
                      ),
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
                    ],
                  ),
                ),
                PrimaryButton(
                  child: Stack(
                    alignment: AlignmentDirectional.center,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 16,
                            backgroundColor: Colors.white,
                            child: SvgPicture.asset(ImagePath.google),
                          ),
                        ],
                      ),
                      Text('Login with google', style: AppTextStyles.white(14, weight: FontWeight.w500),)
                    ],
                  ),
                  onTap: ()=> Navigator.pushReplacementNamed(context, LandingTab.routeName),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 30.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Don’t have any account?'),
              SizedBox(width: 10),
              Text('Sign Up', style: AppTextStyles.black(14, weight: FontWeight.w600),),
            ],
          ),
        ),
      ),
    );
  }
}
