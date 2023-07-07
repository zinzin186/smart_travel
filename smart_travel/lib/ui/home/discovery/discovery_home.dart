import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smart_travel/resource/color.dart';
import 'package:smart_travel/resource/font.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../../api/base_api.dart';
import '../../../model/content_item.dart';
import '../../../model/home_block.dart';
import '../../../model/menu_item.dart';
import '../base_widget_home.dart';

class DiscoveryHomeWidget extends BaseBlocHomeWidget {

  const DiscoveryHomeWidget({Key? key, required HomeBlockModel block}) : super(key: key, block: block);

  @override
  State<DiscoveryHomeWidget> createState() => _DiscoveryHomeState();

}

class _DiscoveryHomeState extends BaseBlocHomeState<DiscoveryHomeWidget> {

  List<ContentItemModel> items = [];
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _getData();
  }

  _getData() async {
    if (widget.block.children?.first == null) {
      return;
    }
    final response = await ClientAPI.getInstance().getDiscoveryItemList(widget.block.children![_currentIndex].contentLink ?? "");
    if (mounted) {
      setState(() {
        items = response;
      });
    }

  }

  @override
  Widget? get showMoreWidget => TextButton(onPressed: () {
    print("fdsfdfd");
  },
    style: ButtonStyle(
        alignment: Alignment.topRight, // <-- had to set alignment
        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
          EdgeInsets.zero, // <-- had to set padding to zero
        )
    ), child: Text("Xem thêm", style: AppTextStyle.font14Semi.copyWith(color: Color(0xFF06575D3)),),
  );

  @override
  Widget mainUI() {
    return Container(
      // margin: EdgeInsets.only(left: 20, right: 20),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(left: 20, right: 20),
            height: 40,
              child: ListView.separated(
                itemCount: widget.block.children?.length ?? 0,
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(width: 10);
                },
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  final isSelected = index == _currentIndex;
                  final item = widget.block.children![index];
                  return DiscoveryCateogryItemWidget(image: item.iconUrl, title: item.name, isSelected: isSelected, onTap: () {
                    _currentIndex = index;
                    _getData();
                  },);
                },
              ),
          ),
          SizedBox(height: 10,),
          Container(
            height: 245,
            child: ListView.separated(
              itemCount: items.length,
              padding: EdgeInsets.only(left: 20),
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(width: 10);
              },
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                final item = items[index];
                return DiscoveryItemWidget(image: item.thumb, title: item.name);
              },
            ),
          ),
        ],
      ),
    );
  }

}
class DiscoveryCateogryItemWidget extends StatelessWidget {
  final String image;
  final String? title;
  final bool isSelected;
  final GestureTapCallback? onTap;
  const DiscoveryCateogryItemWidget({Key? key, required this.image, this.title, this.isSelected = false, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        child: Center(
          child: Container(
            height: 38,
            decoration: BoxDecoration(
                color: isSelected ? AppColor.mainColor : Colors.transparent,
                borderRadius: BorderRadius.circular(19.0)
            ),
            padding: EdgeInsets.all(3.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(16.0),
                  child: Image.network(image, height: 32, width: 32, fit: BoxFit.fill,),
                ),
                if (title != null)
                  Container(
                    padding: const EdgeInsets.only(left: 4, right: 4),
                    child: Text(
                        title!,
                        textAlign: TextAlign.center,
                        style: AppTextStyle.textStyle(color: Colors.black87, fontSize: 14, fontStyle: FontStyle.regular)),
                  )
              ],
            ),
          ),
        ),
      ),
    );
  }


}

class DiscoveryItemWidget extends StatelessWidget {
  final String? image;
  final String? title;
  const DiscoveryItemWidget({Key? key, required this.image, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 165,
      decoration: BoxDecoration(
          image: DecorationImage(
            image: CachedNetworkImageProvider(image ?? ""),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.2),
                BlendMode.darken
            ),
          ),
        borderRadius: BorderRadius.circular(18.0)
      ),
      child: Align(
        alignment: FractionalOffset.bottomCenter,
        child: Container(
          padding: EdgeInsets.only(left: 12, bottom: 10, right: 12),
          child: Text(
              title ?? '',
              textAlign: TextAlign.justify,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  height: 1.1,
                  fontWeight: FontWeight.w500)),
        ),
      ),
    );
  }


}