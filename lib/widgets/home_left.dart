import 'package:flutter/material.dart';
import 'package:tiktok_clone/utils/data.dart';

import '../utils/colors.dart';

class HomeLeft extends StatelessWidget {
  final Size size;
  final DataModel item;

  const HomeLeft({
    Key? key,
    required this.size,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width * 0.8,
      height: size.height,
      decoration: BoxDecoration(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            item.name,
            style: TextStyle(
                color: white, fontWeight: FontWeight.bold, fontSize: 16),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            item.caption,
            style: TextStyle(color: white),
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            children: <Widget>[
              Icon(
                Icons.music_note,
                color: white,
                size: 15,
              ),
              Flexible(
                child: Text(
                  item.songName,
                  style: TextStyle(color: white, height: 1.5),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
