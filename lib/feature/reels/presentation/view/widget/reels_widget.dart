import 'package:flutter/material.dart';
import 'package:reels/core/widgets/icon_button.dart';
import 'package:video_player/video_player.dart';
class VideoWidget extends StatefulWidget {
  final String url;

  const VideoWidget({super.key,required this.url});
  @override
  State<VideoWidget> createState() => _VideoWidgetState();
}

class _VideoWidgetState extends State<VideoWidget> {

  late VideoPlayerController _videoPlayerController; // manage play back
  late Future<void> _initializeVideoPlayer;
  bool isLiked = false;

  void _toggleLike() {
    setState(() {
      isLiked = !isLiked;
    });
  }

  @override
  void initState() {
    _videoPlayerController =
        VideoPlayerController.networkUrl(Uri.parse(widget.url));

    _initializeVideoPlayer = _videoPlayerController.initialize().then((_) {
      _videoPlayerController.play();
      _videoPlayerController.setLooping(true);
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _videoPlayerController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
        children: [ SizedBox(
          width: MediaQuery
              .of(context)
              .size
              .width,
          height: MediaQuery
              .of(context)
              .size
              .height,
          child: FutureBuilder(
              future: _initializeVideoPlayer,
              builder: (context, snapShot) {
                if (snapShot.connectionState == ConnectionState.done) {
                  return AspectRatio(
                    aspectRatio: _videoPlayerController.value.aspectRatio, child: VideoPlayer(_videoPlayerController));

                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              }),
        ),
          Positioned(
            left: 370,
            top: 700,
            child: CustomIconButton(
              icon:
                isLiked ? Icons.favorite : Icons.favorite_border,
                color: isLiked ? Colors.red : Colors.white,
              onPressed: _toggleLike,
              ),
          ),
          const Positioned(
            left: 370,
            top: 770,
            child: CustomIconButton(
              icon:
                Icons.message_outlined,
            ),
          ),
          const Positioned(
            left: 370,
            top: 850,
            child: CustomIconButton(icon: Icons.send_rounded)
          ),
        ]);
  }
}
