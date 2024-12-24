
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '/Constants/Constants.dart';
import 'package:loading_indicator/loading_indicator.dart';
class LoadingIndicatorWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Center(
          child: Container(
            width: 70.w,
            height: 70.w,
            child: Center(
              child: LoadingIndicator(
                indicatorType: Indicator.ballSpinFadeLoader, /// Required, The loading type of the widget
                colors:  [kColorsPrimaryFont],     /// Optional, The color collections
                /// Optional, The stroke of the line, only applicable to widget which contains line
                backgroundColor: kColorsWhite,/// Optional, Background of the widget
                pathBackgroundColor: kColorsWhite  /// Optional, the stroke backgroundColor
            ),),
          ),
        )
    );
  }
}
