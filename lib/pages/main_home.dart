import 'package:flutter/material.dart';
import 'package:tiktok_clone/utils/colors.dart';
import 'package:tiktok_clone/utils/data.dart';
import 'package:tiktok_clone/utils/icons.dart';
import 'package:tiktok_clone/utils/size.dart';
import 'package:tiktok_clone/widgets/home_header.dart';
import 'package:tiktok_clone/widgets/home_left.dart';
import 'package:tiktok_clone/widgets/home_right.dart';
import 'package:video_player/video_player.dart';

class MainHome extends StatefulWidget {
  const MainHome({Key? key}) : super(key: key);

  @override
  State<MainHome> createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  @override
  void initState() {
    super.initState();
    tabController = TabController(length: videoList.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    final size = BaseSize.getSize(context);
    return Stack(
      children: [
        RotatedBox(
          quarterTurns: 1,
          child: TabBarView(
            controller: tabController,
            children: videoList
                .map(
                  (e) => VideoPlayerItem(
                    item: e,
                    size: size,
                    index: videoList.indexOf(e),
                  ),
                )
                .toList(),
          ),
        ),
        SafeArea(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: HomeHeader(),
          ),
        )
      ],
    );
  }
}

class VideoPlayerItem extends StatefulWidget {
  final DataModel item;
  final Size size;
  final int index;

  const VideoPlayerItem({
    Key? key,
    required this.item,
    required this.size,
    this.index = 0,
  }) : super(key: key);

  @override
  State<VideoPlayerItem> createState() => _VideoPlayerItemState();
}

class _VideoPlayerItemState extends State<VideoPlayerItem>
    with SingleTickerProviderStateMixin {
  late VideoPlayerController videoController;
  late AnimationController animationController;
  late Animation<double> animation;
  List<bool> liked = [];
  DataModel get item => widget.item;
  Size get size => widget.size;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: 500,
      ),
      value: 0.0,
    );
    animation =
        CurvedAnimation(parent: animationController, curve: Curves.easeInOut);
    videoController = VideoPlayerController.asset(item.videoAsset)
      ..initialize().then((_) {
        videoController.play();
        setState(() {});
      });
    for (int i = 0; i < videoList.length; i++) {
      setState(() {
        liked.add(false);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return RotatedBox(
      quarterTurns: -1,
      child: Container(
        height: size.height,
        width: size.width,
        child: Stack(
          children: [
            Container(
              width: size.width,
              height: size.height,
              child: Stack(
                children: [
                  Center(
                    child: AspectRatio(
                      aspectRatio: videoController.value.aspectRatio,
                      child: VideoPlayer(
                        videoController,
                      ),
                    ),
                  ),
                  if (!videoController.value.isPlaying)
                    Center(
                      child: Icon(
                        Icons.play_arrow,
                        size: 120,
                        color: white,
                      ),
                    ),
                ],
              ),
            ),
            Container(
              width: size.width,
              height: size.height,
              padding: EdgeInsets.only(
                left: 16,
                top: 24,
                bottom: 12,
              ),
              child: SafeArea(
                child: Row(
                  children: [
                    HomeLeft(size: size, item: item),
                    Expanded(
                      child: HomeRight(
                        item: item,
                        size: size,
                        isLiked: liked[widget.index],
                      ),
                    )
                  ],
                ),
              ),
            ),
            ScaleTransition(
              scale: animation,
              child: Center(
                child: Icon(
                  TikTokIcons.heart,
                  color: Colors.red,
                  size: 160,
                ),
              ),
            ),
            GestureDetector(
              onDoubleTap: () {
                setState(() {
                  liked[widget.index] = !liked[widget.index];
                });
                if (liked[widget.index]) {
                  animationController.forward();
                }
                Future.delayed(Duration(seconds: 1,),(){
                  animationController.reverse();
                });
              },
              onTap: () {
                setState(() {
                  if (videoController.value.isPlaying) {
                    videoController.pause();
                  } else {
                    videoController.play();
                  }
                });
              },
            )
          ],
        ),
      ),
    );
  }
}
