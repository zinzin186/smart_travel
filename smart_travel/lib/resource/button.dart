import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smart_travel/resource/color.dart';
import 'package:smart_travel/resource/font.dart';

class AppTextButton extends StatelessWidget {
  final Function? onPressed;
  final Color backgroundColor;
  final String title;
  final Widget? icon;
  final double? height;
  final double? width;
  final Color? borderColor;
  final Color? textColor;
  final double cornerRadius;

  const AppTextButton(
      {Key? key, this.onPressed,
        required this.title,
        this.icon,
        this.height = 40,
        this.width,
        this.borderColor,
        this.textColor,
        this.cornerRadius = 8.0,
        this.backgroundColor = AppColor.mainColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        onPressed: () {
          if (onPressed != null) {
            onPressed!();
          }
        },
        // style: ButtonStyle(
        //   // padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(15)),
        //   // padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.only(left: 2.0, right: 2)),
        //     foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
        //     backgroundColor: MaterialStateProperty.all<Color>(backgroundColor),
        //     minimumSize: MaterialStateProperty.all<Size>(Size(40, 40)),
        //     shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        //         RoundedRectangleBorder(
        //           borderRadius: BorderRadius.circular(8.0),
        //         )
        //     )
        // ),
        style: ElevatedButton.styleFrom(
          elevation: 0.0,
          backgroundColor: backgroundColor,
          // minimumSize: Size(40.0, 34.0),
          padding: EdgeInsets.symmetric(vertical: 6, horizontal: 12),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(cornerRadius),
              ),
              side: borderColor == null ? BorderSide.none : BorderSide(color: borderColor!, width: 1.5)
          ),
        ),
        child: Text(title, style: AppTextStyle.textStyle(color: Colors.white, fontSize: 13, fontStyle: FontStyle.regular),),
      ),
    );
  }
}