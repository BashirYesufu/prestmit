import 'package:expandable_bottom_sheet/expandable_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:prestmit/constants/color_path.dart';
import 'package:prestmit/constants/image_path.dart';
import 'package:prestmit/constants/text_styles.dart';

class TrackingDetails extends StatefulWidget {
  const TrackingDetails({super.key});

  static const routeName = '/tracking-details';

  @override
  State<TrackingDetails> createState() => _TrackingDetailsState();
}

class _TrackingDetailsState extends State<TrackingDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ExpandableBottomSheet(
        background: Stack(
          children: [
            Stack(
              children: [
                SvgPicture.asset(
                  ImagePath.map,
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                ),
                Center(child: SvgPicture.asset(ImagePath.polyline)),
              ],
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 40.0, horizontal: 16.0),
              child: Column(
                children: [
                  Stack(
                    children: [
                      InkWell(
                        onTap: () => Navigator.pop(context),
                        child: Icon(Icons.arrow_back_ios),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Tracking Details',
                            style: AppTextStyles.black(18,
                                weight: FontWeight.w800),
                          )
                        ],
                      ),
                    ],
                  ),
                  Container(
                    height: 88,
                    padding: EdgeInsets.all(16),
                    margin: EdgeInsets.only(top: 56),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(44),
                      color: ColorPath.yellow,
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(29),
                          color: ColorPath.yellow,
                          border: Border.all(color: Colors.black)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'SCP6653728497',
                            style: AppTextStyles.black(14,
                                weight: FontWeight.w500),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
        persistentHeader: Container(
          height: 100,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(30),
              topLeft: Radius.circular(30),
            ),
            color: Colors.white,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Estimate arrival in'),
            ],
          ),
        ),
        expandableContent: Container(
          height: MediaQuery.of(context).size.height * 0.7,
          color: Colors.white,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 308,
                  margin: const EdgeInsets.symmetric(vertical: 16.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(36),
                      color: ColorPath.yellow),
                  child: Stack(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(36)),
                            child: Image.asset(
                              ImagePath.lines,
                              fit: BoxFit.fill,
                              height: 181.5,
                              width: 187,
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12.0, vertical: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Track Your Package',
                              style: AppTextStyles.generic(
                                  size: 18,
                                  weight: FontWeight.w700,
                                  color: ColorPath.lightBlack),
                            ),
                            Text(
                              'Enter the receipt number that has been given by the officer',
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
