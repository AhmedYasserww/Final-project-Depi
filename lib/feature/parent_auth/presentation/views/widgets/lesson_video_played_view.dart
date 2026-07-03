import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class LessonVideoPlayerView extends StatefulWidget {
  final String videoUrl;
  final String title;

  const LessonVideoPlayerView({
    super.key,
    required this.videoUrl,
    required this.title,
  });

  static const String routeName = 'lesson_video_player_view';

  @override
  State<LessonVideoPlayerView> createState() => _LessonVideoPlayerViewState();
}

class _LessonVideoPlayerViewState extends State<LessonVideoPlayerView> {
  late final VideoPlayerController _controller;
  bool _hasError = false;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.networkUrl(Uri.parse(widget.videoUrl))
      ..initialize().then((_) {
        if (mounted) {
          setState(() {});
          _controller.play();
        }
      }).catchError((_) {
        if (mounted) setState(() => _hasError = true);
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text(widget.title, style: const TextStyle(color: Colors.white)),
      ),
      body: Center(
        child: _hasError
            ? const Text(
                'Could not load video.',
                style: TextStyle(color: Colors.white),
              )
            : _controller.value.isInitialized
                ? AspectRatio(
                    aspectRatio: _controller.value.aspectRatio,
                    child: VideoPlayer(_controller),
                  )
                : const CircularProgressIndicator(color: Colors.white),
      ),
      floatingActionButton: _controller.value.isInitialized
          ? FloatingActionButton(
              backgroundColor: Colors.white,
              onPressed: () {
                setState(() {
                  _controller.value.isPlaying ? _controller.pause() : _controller.play();
                });
              },
              child: Icon(
                _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
                color: Colors.black,
              ),
            )
          : null,
    );
  }
}