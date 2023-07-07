import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smart_travel/resource/font.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../../../model/home_block.dart';
import '../../../model/menu_item.dart';
import '../base_widget_home.dart';

class ExperienceHomeWidget extends BaseBlocHomeWidget {
  const ExperienceHomeWidget({Key? key, required HomeBlockModel block}) : super(key: key, block: block);

  @override
  State<ExperienceHomeWidget> createState() => _ExperienceHomeState();

}

class _ExperienceHomeState extends BaseBlocHomeState<ExperienceHomeWidget> {
  List<MenuModel> _items = [];
  
  @override
  void initState() {
    super.initState();
    _items = widget.block.children?.where((element) => element.code != "APP_ALL").toList() ?? [];
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

  int _current = 0;
  final CarouselController _controller = CarouselController();

  @override
  Widget mainUI() {
    if (_items.isEmpty) {
      return SizedBox();
    }
    return Container(
      height: 170,
      margin: EdgeInsets.only(left: 20, right: 20),
      child: Row(
        children: [
          ExperienceItemWidget(imageString: _items[0].bannerUrl ?? "", title: _items[0].name,),
          SizedBox(width: _items.length > 1 ? 10 : 0,),
          if (_items.length > 1)
            Flexible(
                flex: 1,
                child: Column(
                  children: [
                    Flexible(
                      flex: 1,
                      child: Row(
                        children: [
                          ExperienceItemWidget(imageString: _items[1].bannerUrl ?? "", title: _items[1].name),
                          SizedBox(width: _items.length > 2 ? 10 : 0,),
                          if (_items.length > 2)
                          ExperienceItemWidget(imageString: _items[2].bannerUrl ?? "", title: _items[2].name),
                        ],
                      ),
                    ),
                    SizedBox(height: _items.length > 3 ? 10 : 0,),
                    if (_items.length > 3)
                    ExperienceItemWidget(imageString: _items[3].bannerUrl ?? "", title: _items[3].name),
                  ],
                )
            ),

        ],
      ),
    );
  }

}

class ExperienceItemWidget extends StatelessWidget {

  final String imageString;
  final String? title;

  const ExperienceItemWidget({Key? key, required this.imageString, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 1,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5.0),
        child: Container(
        height: double.infinity,
        width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage (
              image: NetworkImage(imageString),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.3),
                  BlendMode.darken
              ),
            )

          ),
          child: title == null ? null : Center(
            child: Text(title!, style: AppTextStyle.textStyle(color: Colors.white, fontSize: 14, fontStyle: FontStyle.medium)),
          ),
        ),
      ),
    );
  }

}