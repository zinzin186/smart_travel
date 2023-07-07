import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PostMomentItemWidget extends StatelessWidget {
  final double width;
  const PostMomentItemWidget({Key? key, this.width = 65}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(4),
      child: Column(
        children: [
          Container(
            height: 40,
            child: Text(
          'Dam say ve dep nh tranh ve cua "Tieu bali"',
          textAlign: TextAlign.justify,
          style: TextStyle(
              color: Colors.black,
              fontSize: 14,
              fontWeight: FontWeight.w800)),
          ),
          Row(children: [
            Image.asset("assets/images/123.jpg", height: 5, width: 40, fit: BoxFit.fill,),
            SizedBox(width: 4,),
            Expanded(child: Text("By: Lan Anh (tong hop)",overflow: TextOverflow.ellipsis, maxLines: 1,))
          ],),
          SizedBox(height: 5,),
          Expanded(child: Image.asset("assets/images/123.jpg", fit: BoxFit.fill,)),
          
        ],
      ),
    );
  }


}