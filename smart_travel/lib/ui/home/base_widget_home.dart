import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smart_travel/resource/font.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../../model/home_block.dart';

abstract class BaseBlock extends StatefulWidget {
  final HomeBlockModel block;
  const BaseBlock({Key? key, required this.block}) : super(key: key);
}

abstract class BaseBlocHomeWidget extends BaseBlock {

   const BaseBlocHomeWidget({Key? key, required HomeBlockModel block}) : super(key: key, block: block);
  @override
  State<BaseBlocHomeWidget> createState() => BaseBlocHomeState<BaseBlocHomeWidget>();

}

class BaseBlocHomeState<T extends BaseBlocHomeWidget> extends State<T> {

  String? title;
  String? subTitle;
  Widget? showMoreWidget;
  final titleStyle = AppTextStyle.font18Bold;
  final subTitleStyle = AppTextStyle.font12Regular.copyWith(color: Colors.black);
  BoxDecoration decoration = const BoxDecoration(
    color: Colors.white
  );

  @override
  void initState() {
    super.initState();
    title = widget.block.name;
    subTitle = widget.block.description;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: decoration,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if ((title?.isNotEmpty ?? false) || (showMoreWidget != null))
            Container(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (title?.isNotEmpty ?? false)
                    Expanded(child: Container(
                      padding: const EdgeInsets.only(top: 10),
                      child: Text(title!, style: titleStyle),
                    )),
                  if (showMoreWidget != null)
                    showMoreWidget!
                ],
              ),
            ),
          if (subTitle != null)
            Container(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 8),
              child: Text(subTitle!, style: subTitleStyle),
            ),
          Container(
            padding: const EdgeInsets.only(bottom: 16),
            child: mainUI(),
          )
        ],
      ),
    );
  }

  Widget mainUI() {
    return SizedBox();
  }

}