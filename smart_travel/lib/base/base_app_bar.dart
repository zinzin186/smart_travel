
import 'package:flutter/material.dart';
import '../resource/color.dart';
import '../resource/font.dart';

class BaseAppBar extends StatefulWidget implements PreferredSizeWidget {

  final String? title;
  final Widget? titleWidget;
  final double? titleSpacing;
  final List<Widget>? rightItems;
  final double trailingPadding;
  final Color? backgroundColor;
  final Widget? leading;

  BaseAppBar({Key? key, this.title, this.titleWidget, this.titleSpacing, this.leading, this.rightItems, this.trailingPadding = 16, this.backgroundColor}) : preferredSize = Size.fromHeight(kToolbarHeight), super(key: key);
  @override
  final Size preferredSize; // default is 56.0
  @override
  _BaseNavigationBarState createState() => _BaseNavigationBarState();
}
class _BaseNavigationBarState extends State<BaseAppBar>{
  @override
  Widget build(BuildContext context) {
    List<Widget> rightItems = [];
    if (widget.rightItems != null) {
      widget.rightItems?.forEach((element) {
        rightItems.add(element);
        rightItems.add(SizedBox(
          width: widget.trailingPadding,
        ));
      });
    }
    return AppBar(
      centerTitle: true,
      primary: true,
      elevation: 0,
      titleSpacing: widget.titleSpacing,
      leading: widget.leading,
      backgroundColor: widget.backgroundColor ?? AppColor.mainColor,
      title: widget.titleWidget ?? ((widget.title?.isNotEmpty ?? false) ? Text(widget.title!,
          style: AppTextStyle.naviTitle,
          textAlign: TextAlign.left) : null),
      actions: rightItems,
      // flexibleSpace: FittedBox(
      //   child: Image.asset('assets/images/123.jpg'),
      //   fit: BoxFit.fill,
      // ),
    );
  }
}