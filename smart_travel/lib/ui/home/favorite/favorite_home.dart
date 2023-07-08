import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smart_travel/resource/color.dart';
import 'package:smart_travel/resource/font.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../../api/base_api.dart';
import '../../../model/home_block.dart';
import '../../../model/menu_item.dart';
import '../base_widget_home.dart';

class FavoriteHomeWidget extends BaseBlocHomeWidget {
  const FavoriteHomeWidget({Key? key, required HomeBlockModel block}) : super(key: key, block: block);
  @override
  State<FavoriteHomeWidget> createState() => _FavoriteHomeState();

}

class _FavoriteHomeState extends BaseBlocHomeState<FavoriteHomeWidget> {
List<MenuModel> items = [];

  @override
  void initState() {
    super.initState();
    _getData();
  }

  _getData() async {
    if (widget.block.contentLink?.isEmpty ?? true) {
      return;
    }
    final response = await ClientAPI.getInstance().getRegionsList(widget.block.contentLink!);
    setState(() {
      items = response;
    });
  }

  @override
  // TODO: implement titleStyle
  TextStyle get titleStyle => super.titleStyle.copyWith(color: Colors.white);

  @override
  // TODO: implement subTitleStyle
  TextStyle get subTitleStyle => super.subTitleStyle.copyWith(color: Colors.white);

  @override
  // TODO: implement decoration
  BoxDecoration get decoration => const BoxDecoration(
    color: Colors.lightBlue,
    image: DecorationImage(
      image: AssetImage("assets/images/bg_home_favorite_location.png"),
      fit: BoxFit.fill,
    ),
  );

  @override
  Widget mainUI() {
    if (items.isEmpty) {
      return const SizedBox();
    }
    return SizedBox(
      height: 340,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const SizedBox(height: 20,),
          SizedBox(
            height: 106,
            child:  ListView.separated(
              itemCount: items.length + 1,
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(width: 10);
              },
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 12),
              itemBuilder: (context, index) {
                if (index == items.length) {
                  return const FavoriteCityItemWidget(width: 106);
                }
                return FavoriteCityItemWidget(width: 106, item: items[index]);
              },
            ),
          ),
          const SizedBox(height: 50,),
          Container(
            margin: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text("Bắt đầu lưu các ý tưởng du lịch",
                    textAlign: TextAlign.right,
                    style: AppTextStyle.font18Bold.copyWith(color: Colors.white),
                ),
                const Text("Tạo Chuyến đi để lưu và sắp xếp\n mọi ý tưởng du lịch của bạn",
                    textAlign: TextAlign.right,
                    style: AppTextStyle.font12Regular
                ),
                const SizedBox(height: 10,),
                ElevatedButton(onPressed: () {

                },
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(176, 38),
                  backgroundColor: AppColor.mainColor, // background
                  foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6.0), // <-- Radius
                      ),// foreground
                ),
                    child: Text("BẮT ĐẦU"))
              ],
            ),
          ),
        ],
      ),
    );
  }

}

class FavoriteCityItemWidget extends StatelessWidget {
  final double width;
  final MenuModel? item;
  const FavoriteCityItemWidget({Key? key, this.width = 106, this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (item == null) {
      return Container(
        width: width,
        padding: const EdgeInsets.only(top: 4),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage("assets/images/banners/bg_suggest.jpg"),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.2),
                BlendMode.darken
            ),
          ),
          borderRadius: BorderRadius.circular(width/2),
          border: Border.all(width: 2.0, color: Colors.white54),
        ),
        child: Align(
          alignment: FractionalOffset.center,
          child: Container(
            padding: const EdgeInsets.only(left: 12, right: 12),
            child: Text(
                "XEM THÊM",
                textAlign: TextAlign.center,
                style: AppTextStyle.textStyle(color: Colors.white, fontSize: 16, fontStyle: FontStyle.semi)),
          ),
        ),
      );
    }
    return Container(
      width: width,
      padding: const EdgeInsets.only(top: 4),
      decoration: BoxDecoration(
          image: DecorationImage(
            image: CachedNetworkImageProvider(item?.bannerUrl ?? ""),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.2),
                BlendMode.darken
            ),
          ),
          borderRadius: BorderRadius.circular(width/2),
        border: Border.all(width: 2.0, color: Colors.white54),
      ),
      child: Align(
        alignment: FractionalOffset.center,
        child: Container(
          padding: const EdgeInsets.only(left: 12, right: 12),
          child: Text(
              item?.name.toUpperCase() ?? "",
              textAlign: TextAlign.center,
              style: AppTextStyle.textStyle(color: Colors.white, fontSize: 16, fontStyle: FontStyle.semi)),
        ),
      ),
    );
  }


}