import 'package:flutter/material.dart';
import 'package:tiktok_app/TikTokIcons.dart';
import 'package:tiktok_app/constant/data_json.dart';
import 'package:tiktok_app/theme/colors.dart';
import 'package:tiktok_app/widget/icon_widget.dart';
import 'package:video_player/video_player.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  @override
  void initState() {
    // TODO: implement initState

    _tabController = TabController(length: items.length, vsync: this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _tabController.dispose();
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;
    return RotatedBox(
      quarterTurns: 1,
      child: TabBarView(
          controller: _tabController,
          children: List.generate(items.length, (index) {
            return RotatedBox(
              quarterTurns: -1,
              child: VideoPlayerItem(
                size: size,
                name: items[index]['name'],
                videoUrl: items[index]['videoUrl'],
                caption: items[index]['caption'],
                songName: items[index]['songName'],
                profileImg: items[index]['profileImg'],
                likes: items[index]['likes'],
                comments: items[index]['comments'],
                shares: items[index]['shares'],
                albumImg: items[index]['albumImg'],
              ),
            );
          })),
    );
  }

  @override
  Widget build(BuildContext context) {
    return getBody();
  }
}

class VideoPlayerItem extends StatefulWidget {
  final String name;
  final String videoUrl;
  final String caption;
  final String songName;
  final String profileImg;
  final String likes;
  final String comments;
  final String shares;
  final String albumImg;

  const VideoPlayerItem({
    Key key,
    @required this.size,
    this.name,
    this.caption,
    this.songName,
    this.profileImg,
    this.likes,
    this.comments,
    this.shares,
    this.albumImg,
    this.videoUrl,
  }) : super(key: key);

  final Size size;

  @override
  _VideoPlayerItemState createState() => _VideoPlayerItemState();
}

class _VideoPlayerItemState extends State<VideoPlayerItem>
    with SingleTickerProviderStateMixin {
  VideoPlayerController _videoPlayerController;
  bool isShwoingPlaying = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _videoPlayerController = VideoPlayerController.asset(widget.videoUrl)
      ..initialize().then((value) {
        _videoPlayerController.play();
        setState(() {
          isShwoingPlaying = false;
        });
      });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _videoPlayerController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        _videoPlayerController.value.isPlaying
            ? _videoPlayerController.pause()
            : _videoPlayerController.play();
        setState(() {
          isShwoingPlaying = false;
        });
      },
      child: Container(
          height: widget.size.height,
          width: widget.size.width,
          child: Stack(
            children: [
              Container(
                width: widget.size.width,
                height: widget.size.height,
                child: Stack(
                  children: [
                    VideoPlayer(_videoPlayerController),
                    _videoPlayerController.value.isPlaying
                        ? Container()
                        : Center(
                            child: Icon(
                            Icons.play_arrow,
                            size: 80,
                            color: white.withOpacity(0.5),
                          ))
                  ],
                ),
              ),
              Container(
                  width: widget.size.width,
                  height: widget.size.height,
                  child: SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 25.0, left: 15, right: 15, bottom: 10),
                      child: Column(
                        children: [
                          HeaderHomePage(),
                          Flexible(
                              child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              LeftPanel(
                                  size: widget.size,
                                  name: widget.name,
                                  caption: widget.caption,
                                  songName: widget.songName),
                              RightPanel(
                                size: widget.size,
                                profileImg: widget.profileImg,
                                likes: widget.likes,
                                comments: widget.comments,
                                shares: widget.shares,
                                albumImg: widget.albumImg,
                              )
                            ],
                          ))
                        ],
                      ),
                    ),
                  ))
            ],
          )),
    );
  }
}

class RightPanel extends StatelessWidget {
  final String profileImg;
  final String likes;
  final String comments;
  final String shares;
  final String albumImg;
  const RightPanel({
    Key key,
    @required this.size,
    this.profileImg,
    this.likes,
    this.comments,
    this.albumImg,
    this.shares,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: size.height,
        // decoration: BoxDecoration(color: secondary),
        child: Column(
          children: [
            Container(height: size.height * 0.3),
            Expanded(
                child: Container(
                    decoration: BoxDecoration(),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        getProfile(profileImg),
                        getIcon(TikTokIcons.heart, 35.0, likes),
                        getIcon(TikTokIcons.chat_bubble, 35.0, comments),
                        getIcon(TikTokIcons.reply, 35.0, shares),
                        getAlbum(albumImg),
                      ],
                    )))
          ],
        ),
      ),
    );
  }
}

class LeftPanel extends StatelessWidget {
  final String name;
  final String caption;
  final String songName;
  const LeftPanel({
    Key key,
    @required this.size,
    this.name,
    this.caption,
    this.songName,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: size.height,
        width: size.width * 0.78,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(name, style: TextStyle(color: white)),
            SizedBox(height: 10),
            Text(caption, style: TextStyle(color: white)),
            SizedBox(height: 10),
            Text(
              songName,
              style: TextStyle(color: white, fontSize: 12),
            ),
          ],
        ));
  }
}

class HeaderHomePage extends StatelessWidget {
  const HeaderHomePage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Following',
            style: TextStyle(color: white.withOpacity(0.5), fontSize: 16)),
        SizedBox(width: 5),
        Text('|',
            style: TextStyle(color: white.withOpacity(0.3), fontSize: 16)),
        SizedBox(width: 5),
        Text('For You',
            style: TextStyle(
                color: white, fontSize: 17, fontWeight: FontWeight.bold)),
      ],
    );
  }
}
