import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:prestmit/UI/bloc/bike_bloc.dart';
import 'package:prestmit/UI/features/tracking/tracking_details.dart';
import 'package:prestmit/UI/widgets/input_field.dart';
import 'package:prestmit/UI/widgets/primary_button.dart';
import 'package:prestmit/constants/color_path.dart';
import 'package:prestmit/constants/image_path.dart';
import 'package:prestmit/constants/text_styles.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Home extends StatefulWidget {
  const Home({super.key});
  static const routeName = '/home';

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  PageController controller = PageController(viewportFraction: 1, keepPage: true);
  final BikeBloc _bikeBloc = BikeBloc();

  @override
  void initState() {
    _bikeBloc.getBikes();

    _bikeBloc.bikeResponse.listen((event) {
      print(event);
    });

    super.initState();
  }

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
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 30.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 30),
                  StreamBuilder<List<String>>(
                    stream: _bikeBloc.bikeResponse,
                    builder: (context, AsyncSnapshot<List<String>> snapshot) {
                      if (snapshot.hasData && snapshot.data != null) {
                        return Column(
                          children: [
                            SizedBox(
                              height: 265,
                              child: ListView.builder(
                                  controller: controller,
                                  scrollDirection: Axis.horizontal,
                                  physics: BouncingScrollPhysics(),
                                  itemCount: snapshot.data?.length,
                                  itemBuilder: (context, index) => Container(
                                    width: 255,
                                    height: 265,
                                    margin: EdgeInsets.symmetric(horizontal: 20),
                                    padding: EdgeInsets.all(40),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      color: ColorPath.card,
                                    ),
                                    child: Image.asset(ImagePath.bike),
                                  ),
                              ),
                            ),
                            SizedBox(height: 20),
                            SmoothPageIndicator(
                              controller: controller,
                              count: snapshot.data!.length,
                              axisDirection: Axis.horizontal,
                              onDotClicked: (index) => controller.jumpToPage(index),
                              effect: ExpandingDotsEffect(
                                  activeDotColor: Colors.black,
                                  dotColor: ColorPath.card,
                                  dotWidth: 6,
                                  dotHeight: 6
                              ),
                            )
                          ],
                        );
                      }
                      else {
                        return SizedBox(
                          height: 265,
                          child: Center(
                            child: CupertinoActivityIndicator(
                              color: Colors.black,
                            )
                          ),
                        );
                      }
                    },
                  ),
                  SizedBox(height: 30),
                  Container(
                    height: 109,
                    color: ColorPath.yellow,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      children: [
                        Container(
                          height: 308,
                          margin: const EdgeInsets.symmetric(vertical: 16.0),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(36),
                              color: ColorPath.yellow
                          ),
                          child: Stack(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.only(topRight: Radius.circular(36)),
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
                                padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                        'Track Your Package',
                                      style: AppTextStyles.generic(size: 18, weight: FontWeight.w700, color: ColorPath.lightBlack),
                                    ),
                                    Text(
                                     'Enter the receipt number that has been given by the officer',
                                    ),
                                    InputField(
                                      hintText: 'Enter the receipt number',
                                    ),
                                    PrimaryButton(
                                      onTap:()=> Navigator.of(context).pushNamed(TrackingDetails.routeName),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 24.0),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text('Track now', style: AppTextStyles.generic(size: 14, weight: FontWeight.w600, color: Colors.white),),
                                            Icon(Icons.arrow_forward, color: Colors.white,)
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),

                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
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
        ],
      ),
    );
  }
}
