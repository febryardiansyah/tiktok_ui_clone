import 'package:flutter/material.dart';
import 'package:tiktok_clone/utils/data.dart';
import 'package:tiktok_clone/utils/icons.dart';

import '../utils/colors.dart';

class HomeRight extends StatelessWidget {
  final Size size;
  final DataModel item;
  final bool isLiked;

  const HomeRight({
    Key? key,
    required this.size,
    required this.item,
    this.isLiked = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            height: size.height * 0.3,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                getProfile(item.profileImg),
                getIcons(
                  TikTokIcons.heart,
                  item.likes,
                  35,
                  color: isLiked ? Colors.red : white,
                ),
                getIcons(
                  TikTokIcons.chat_bubble,
                  item.comments,
                  35,
                ),
                getIcons(
                  TikTokIcons.reply,
                  item.shares,
                  25,
                ),
                getAlbum(item.albumImg),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget getAlbum(albumImg) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
          // shape: BoxShape.circle,
          // color: black
          ),
      child: Stack(
        children: <Widget>[
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(shape: BoxShape.circle, color: black),
          ),
          Center(
            child: Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: NetworkImage(albumImg), fit: BoxFit.cover)),
            ),
          )
        ],
      ),
    );
  }

  Widget getIcons(IconData icon, String count, double size,
      {Color color = white}) {
    return Container(
      child: Column(
        children: <Widget>[
          Icon(icon, color: color, size: size),
          SizedBox(
            height: 5,
          ),
          Text(
            count,
            style: TextStyle(
              color: white,
              fontSize: 12,
              fontWeight: FontWeight.w700,
            ),
          )
        ],
      ),
    );
  }

  Widget getProfile(img) {
    return Container(
      width: 50,
      height: 60,
      child: Stack(
        children: <Widget>[
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              border: Border.all(color: white),
              shape: BoxShape.circle,
              image: DecorationImage(image: AssetImage(img), fit: BoxFit.cover),
            ),
          ),
          Positioned(
            bottom: 3,
            left: 18,
            child: Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(shape: BoxShape.circle, color: primary),
              child: Center(
                child: Icon(
                  Icons.add,
                  color: white,
                  size: 15,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
