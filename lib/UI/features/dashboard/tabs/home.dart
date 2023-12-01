import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:prestmit/constants/color_path.dart';
import 'package:prestmit/constants/image_path.dart';
import 'package:prestmit/constants/text_styles.dart';

class Home extends StatefulWidget {
  const Home({super.key});
  static const routeName = '/home';

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Image.asset(ImagePath.avatar),
        ),
        actions: [
          Row(
            children: [
              Container(
                height: 40,
                width: 40,
                margin: EdgeInsets.only(right: 16),
                padding: EdgeInsets.all(6),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: ColorPath.card
                ),
                child: SvgPicture.asset(ImagePath.bell),
              ),
            ],
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                      'Hello, Good Morning!',
                    style: AppTextStyles.generic(size: 18, weight: FontWeight.w700, color: ColorPath.lightBlack),
                  ),
                ],
              ),
            ),
            Container(
              height: 109,
              color: ColorPath.yellow,
            )
          ],
        ),
      ),
    );
  }
}
