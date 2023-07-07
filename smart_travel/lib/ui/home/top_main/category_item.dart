import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class CateogryItemWidget extends StatelessWidget {
  final double width;
  final double? height;
  final String title;
  final String iconUrl;
  const CateogryItemWidget({Key? key, required this.title, required this.iconUrl, this.width = 65, this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height ?? double.infinity,
      padding: EdgeInsets.only(top: 4),
      child: Column(
        children: [
          Image.network(iconUrl, height: 44, width: 44, fit: BoxFit.fill,),
          const SizedBox(height: 5,),
          Expanded(
              child: Text(
                  title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 10,
                      height: 1.1,
                      fontWeight: FontWeight.w500)))
        ],
      ),
    );
  }


}