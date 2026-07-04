import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

import '../../../../../../../../../core/utils/app_color.dart';

class VideoUploadBox extends StatefulWidget {
  final PlatformFile? pickedVideo;
  final ValueChanged<PlatformFile> onPicked;
  final VoidCallback onRemove;

  const VideoUploadBox({
    super.key,
    required this.pickedVideo,
    required this.onPicked,
    required this.onRemove,
  });

  @override
  State<VideoUploadBox> createState() => _VideoUploadBoxState();
}

class _VideoUploadBoxState extends State<VideoUploadBox> {
  bool _isPicking = false;

  Future<void> _pickVideo() async {
    setState(() => _isPicking = true);
    try {
      final result = await FilePicker.pickFiles(type: FileType.video);
      if (result != null && result.files.isNotEmpty) {
        widget.onPicked(result.files.single);
      }
    } finally {
      if (mounted) setState(() => _isPicking = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final pickedVideo = widget.pickedVideo;

    if (pickedVideo != null) {
      return Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: const Color(0xFFE0E0E0)),
        ),
        child: Row(
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: AppColors.primaryColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(Icons.play_circle_fill, color: AppColors.primaryColor),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                pickedVideo.name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontWeight: FontWeight.w600, fontFamily: 'Inter'),
              ),
            ),
            IconButton(
              onPressed: widget.onRemove,
              icon: const Icon(Icons.delete_outline, color: Colors.redAccent),
            ),
          ],
        ),
      );
    }

    return InkWell(
      onTap: _isPicking ? null : _pickVideo,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 28),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: const Color(0xFFE0E0E0)),
          color: const Color(0xFFFAFAFC),
        ),
        child: Center(
          child: _isPicking
              ? const CircularProgressIndicator()
              : Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.videocam_outlined, size: 32, color: AppColors.primaryColor),
                    const SizedBox(height: 8),
                    const Text(
                      'Tap to upload a video',
                      style: TextStyle(fontWeight: FontWeight.w600, fontFamily: 'Inter'),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}