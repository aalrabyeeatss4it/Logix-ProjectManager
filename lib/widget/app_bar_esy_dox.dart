import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '/Constants/Constants.dart';



class AppBarEsyDox extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final Color? colorAll;
  final Color? colorfont;
  final bool? EndIcon;
  final ZoomDrawerController? zoomDrawerController ;
  @override
  final Size preferredSize;
  AppBarEsyDox({Key? key, this.title, this.zoomDrawerController, this.colorAll, this.EndIcon, this.colorfont})
      : preferredSize = Size.fromHeight(0.16.sh),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    final isRtl = Localizations.localeOf(context).languageCode == 'ar';
    return Container(
      width: double.infinity,
      height: 0.155.sh,
      color: kColorsPrimaryFont,
    );
  }
}