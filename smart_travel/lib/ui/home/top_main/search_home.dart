

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../resource/font.dart';

class SearchHomeWidget extends StatefulWidget {
  final String? placeholder;
  final String? description;
  final GestureTapCallback? onTapSearch;
  const SearchHomeWidget({Key? key, this.placeholder, this.description, this.onTapSearch}) : super(key: key);

  @override
  State<SearchHomeWidget> createState() => _SearchHomeState();

}

class _SearchHomeState extends State<SearchHomeWidget> {

  TextEditingController? textEditingController;

  @override
  Widget build(BuildContext context) {

    return Container(
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.placeholder ?? "TRẢI NGHIỆM VẺ ĐẸP SÔNG NƯỚC VIỆT NAM", style: AppTextStyle.font16Bold,),
          Text(widget.description ?? "Đi vi vu thông qua màn ảnh nhỏ - cảm xúc thật", style: AppTextStyle.font12Regular,),
          Container(
            height: 36,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.5),
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: GestureDetector(
              onTap: widget.onTapSearch,
              child: Row(
                children: [
                  Expanded(child: TextField(
                    readOnly: true,
                    controller: textEditingController,
                    decoration: const InputDecoration(
                      fillColor: Colors.transparent,
                      border: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.transparent)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.transparent)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.transparent)),
                      hintText: "Tìm kiếm ...",
                      filled: true,
                      hintStyle: AppTextStyle.font12Regular,
                      contentPadding: EdgeInsets.symmetric(vertical: 6, horizontal: 12),
                    ),
                    style: AppTextStyle.font12Regular,
                    textAlign: TextAlign.justify,
                    enabled: true,
                  )),
                  Container(
                    width: 60,
                    child: Image.asset("assets/images/btn_home_search.png", fit: BoxFit.fill,),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

}