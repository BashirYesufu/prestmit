import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:prestmit/constants/image_path.dart';

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
      body: Stack(
        children: [
          SvgPicture.asset(
            ImagePath.map,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
          ),
          DraggableScrollableSheet(
            initialChildSize: 0.1,
            minChildSize: 0.1,
            maxChildSize: 0.9,
            builder: (BuildContext context, scrollController) {
              return Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(30),
                        topLeft: Radius.circular(30),
                    )
                ),
                child: Column(),
              );
            },
          )
        ],
      ),
    );
  }
}