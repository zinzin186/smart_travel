import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../model/menu_item.dart';
import 'category_item.dart';


class CateogryWidget extends StatefulWidget {

  final List<MenuModel> items;
  const CateogryWidget({Key? key, required this.items}) : super(key: key);

  @override
  State<CateogryWidget> createState() => _CateogryState();

}

class _CateogryState extends State<CateogryWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      width: double.infinity,
      padding: EdgeInsets.zero,
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/banner_home_top2.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          padding: EdgeInsets.only(top: 50, bottom: 10),
        child: ListView.separated(
          itemCount: widget.items.length,
          separatorBuilder: (BuildContext context, int index) {
            return SizedBox(width: 10);
          },
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(vertical: 0, horizontal: 12),
          itemBuilder: (context, index) {
            final item = widget.items[index];
            final double width = MediaQuery.of(context).size.width - 24;
            final widthOfCell = (width - (10*3))/4;
            return CateogryItemWidget(width: widthOfCell, title: item.name, iconUrl: item.iconUrl);
          },
        ),
      ),
      )
    );

  }
  //let widthOfCell: CGFloat = (self.collectionView.frame.width - 10*(CGFloat(menus.count - 1)))/CGFloat(menus.count)
}