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
          padding: EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(30),
              topLeft: Radius.circular(30),
            ),
            color: Colors.white,
          ),
          child: Column(
            children: [
              Container(
                height: 5,
                width: 48,
                margin: EdgeInsets.only(bottom: 20, top: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(2.5),
                  color: ColorPath.drawer,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('Estimate arrival in', style: AppTextStyles.grey(14),),
                      Text('2h 40m', style: AppTextStyles.black(24, weight: FontWeight.w600),),
                    ],
                  ),
                  Icon(Icons.more_horiz,)
                ],
              ),
            ],
          ),
        ),
        expandableContent: Container(
          height: MediaQuery.of(context).size.height * 0.7,
          padding: EdgeInsets.symmetric(horizontal: 16),
          color: Colors.white,
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                Container(
                  height: 300,
                  margin: const EdgeInsets.symmetric(vertical: 16.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(36),
                      color: ColorPath.yellow),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12.0, vertical: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        buildDetail(
                          title: 'Sukabumi, Indonesia',
                          sub: 'No receipt : SCP6653728497',
                        ),
                        buildDetail(
                          title: '2,50 USD',
                          sub: 'Postal fee',
                        ),
                        buildDetail(
                          title: 'Bali, Indonesia',
                          sub: 'Parcel, 24kg',
                          hasBottom: false
                        ),
                      ],
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('History', style: AppTextStyles.black(16, weight: FontWeight.w600),),
                    SizedBox(height: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        buildHistory(
                          icon: '🚚',
                          title: 'In Delivery',
                          subTitle: 'Bali, Indonesia',
                          time: '00.00 PM',
                          hasTop: false,
                          cardColor: ColorPath.yellow,
                        ),
                        buildHistory(
                          icon: '📬',
                          title: 'Transit - Sending City',
                          subTitle: 'Jakarta, Indonesia',
                          time: '21.00 PM',
                        ),
                        buildHistory(
                          icon: '📦',
                          title: 'Send Form Sukabumi',
                          subTitle: 'Sukabumi, Indonesia',
                          hasBottom: false,
                          time: '19.00 PM'
                        ),
                      ],
                    )
                  ],
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildDetail({required String title, required String sub, bool hasBottom = true}) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: AppTextStyles.generic(
                size: 18, weight: FontWeight.w700, color: ColorPath.lightBlack),
          ),
          Text(
            sub,
            style: AppTextStyles.grey(14),
          ),
          hasBottom ? Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Divider(
              thickness: 1,
            ),
          ) : SizedBox(),
        ],
      ),
    );
  }

  Widget buildHistory({required String icon, required String title, required String subTitle, required String time, bool hasTop = true, bool hasBottom = true, Color cardColor = ColorPath.card}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                hasTop ? Container(
                  height: 20,
                  width: 2,
                  color: ColorPath.card,
                ) : SizedBox(),
                CircleAvatar(
                  radius: 30,
                  backgroundColor: cardColor,
                  child: Text(
                    icon,
                    style: AppTextStyles.black(30),
                  ),
                ),
                hasBottom ? Container(
                  height: 20,
                  width: 2,
                  color: ColorPath.card,
                ) : SizedBox(),
              ],
            ),
            SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title,
                  style: AppTextStyles.black(14, weight: FontWeight.w500),
                ),
                Text(
                  subTitle,
                  style: AppTextStyles.grey(
                    14,
                  ),
                ),
              ],
            )
          ],
        ),
        Text(time, style: AppTextStyles.grey(12),)
      ],
    );
  }

}
