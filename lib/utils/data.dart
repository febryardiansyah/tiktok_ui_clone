class DataModel {
  final String videoAsset;
  final String name;
  final String caption;
  final String songName;
  final String profileImg;
  final String likes;
  final String comments;
  final String shares;
  final String albumImg;
  final bool isLiked;

  DataModel({
    required this.videoAsset,
    required this.name,
    required this.caption,
    required this.songName,
    required this.profileImg,
    required this.likes,
    required this.comments,
    required this.shares,
    required this.albumImg,
    this.isLiked = false,
  });
}

List<DataModel> videoList = [
  DataModel(
    videoAsset: 'assets/videos/video1.mp4',
    name: 'username927262501',
    songName: 'оригинальный звук - snauzk',
    albumImg: 'https://images.unsplash.com/photo-1502982899975-893c9cf39028?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',
    caption: 'Insta: zviolet_',
    likes: '1,5M',
    comments: '10,5K',
    profileImg: 'assets/imgs/1.jpeg',
    shares: '20,2K',
    isLiked: false,
  ),
  DataModel(
    videoAsset: 'assets/videos/video2.mp4',
    name: 'semkavkvadrate',
    songName: 'Stan Remix - CMG Trap',
    albumImg: 'https://images.unsplash.com/photo-1502982899975-893c9cf39028?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',
    caption: '📸',
    likes: '3M',
    comments: '13,8K',
    profileImg: 'assets/imgs/2.jpeg',
    shares: '19,2K',
    isLiked: false,
  ),
  DataModel(
    videoAsset: 'assets/videos/video3.mp4',
    name: 'draedreamer',
    songName: 'Hoist the Colours - Colm R. McGuinness',
    albumImg: 'https://images.unsplash.com/photo-1502982899975-893c9cf39028?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',
    caption: '📍Baraccuda Lake, Coron #coron2022 #coron #fyp #tiktokph #deepbluesea',
    likes: '7,4M',
    comments: '66,3K',
    profileImg: 'assets/imgs/3.jpeg',
    shares: '88,6K',
    isLiked: false,
  ),
];
