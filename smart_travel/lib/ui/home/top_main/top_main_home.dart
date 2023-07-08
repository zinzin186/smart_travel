import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smart_travel/model/home_block.dart';
import 'package:smart_travel/ui/home/top_main/silde_banner.dart';

import '../base_widget_home.dart';
import 'category_widget.dart';

class TopMainHomeWidget extends BaseBlock {

  final GestureTapCallback? onTapSearch;

  const TopMainHomeWidget({Key? key, required HomeBlockModel block, this.onTapSearch}) : super(key: key, block: block);
  @override
  State<TopMainHomeWidget> createState() => _TopMainHomeState();
}

class _TopMainHomeState extends State<TopMainHomeWidget> {
  @override
  Widget build(BuildContext context) {

    return Container(
      height: 404,
      padding: EdgeInsets.zero,
      child: Stack(
        children: [
          Positioned(
            top: 0,
              left: 0,
              right: 0,
              bottom: 90,
              child: SlideBannerWidget(banners: widget.block.backgroundUrls ?? [], onTapSearch: widget.onTapSearch,)),
          Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: CateogryWidget(items: widget.block.menus ?? [],))
        ],
      ),
    );
  }

}