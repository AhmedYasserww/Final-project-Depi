import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:kids_education_learning/core/utils/app_color.dart';
import 'package:kids_education_learning/core/utils/app_style.dart';
import 'package:kids_education_learning/core/widgets/custom_button.dart';

/// Result returned from [CreateCourseBottomSheet] when the teacher
/// finishes filling the form. Hand this off to your upload/Cubit logic.
class CourseUploadResult {
  final String videoPath;
  final String videoName;
  final String category;

  const CourseUploadResult({
    required this.videoPath,
    required this.videoName,
    required this.category,
  });
}

/// Bottom sheet shown when the teacher taps "Add Course".
/// Lets them pick a video and choose a category.
class CreateCourseBottomSheet extends StatefulWidget {
  const CreateCourseBottomSheet({super.key});

  static const List<String> categories = [
    "Storytelling",
    "Alphabet Games",
    "Rhyming Games",
    "Counting Games",
    "Shapes and Colors",
    "Drawing and Colouring",
  ];

  @override
  State<CreateCourseBottomSheet> createState() =>
      _CreateCourseBottomSheetState();
}

class _CreateCourseBottomSheetState extends State<CreateCourseBottomSheet> {
  PlatformFile? _pickedVideo;
  String? _selectedCategory;
  bool _isPicking = false;

  bool get _canSubmit => _pickedVideo != null && _selectedCategory != null;

  Future<void> _pickVideo() async {
    setState(() => _isPicking = true);
    try {
      final result = await FilePicker.pickFiles(
        type: FileType.video,
      );
      if (result != null && result.files.isNotEmpty) {
        setState(() => _pickedVideo = result.files.single);
      }
    } finally {
      if (mounted) setState(() => _isPicking = false);
    }
  }

  void _removeVideo() => setState(() => _pickedVideo = null);

  void _submit() {
    if (!_canSubmit) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please add a video and pick a category'),
        ),
      );
      return;
    }
    Navigator.of(context).pop(
      CourseUploadResult(
        videoPath: _pickedVideo!.path!,
        videoName: _pickedVideo!.name,
        category: _selectedCategory!,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: DraggableScrollableSheet(
        initialChildSize: 0.75,
        minChildSize: 0.5,
        maxChildSize: 0.95,
        expand: false,
        builder: (context, scrollController) {
          return Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
            ),
            child: Column(
              children: [
                const SizedBox(height: 10),
                Container(
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                Expanded(
                  child: ListView(
                    controller: scrollController,
                    padding: const EdgeInsets.fromLTRB(20, 16, 20, 24),
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Add Course',
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w800,
                              color: AppColors.labelTextColor,
                              fontFamily: 'Inter',
                            ),
                          ),
                          IconButton(
                            onPressed: () => Navigator.of(context).pop(),
                            icon: const Icon(Icons.close),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),

                      Text('Course video', style: AppStyle.styleGreyRegular16),
                      const SizedBox(height: 8),
                      _VideoUploadBox(
                        pickedVideo: _pickedVideo,
                        isPicking: _isPicking,
                        onTap: _pickVideo,
                        onRemove: _removeVideo,
                      ),

                      const SizedBox(height: 24),

                      Text('Category', style: AppStyle.styleGreyRegular16),
                      const SizedBox(height: 10),
                      Wrap(
                        spacing: 10,
                        runSpacing: 10,
                        children: CreateCourseBottomSheet.categories.map((c) {
                          final bool selected = c == _selectedCategory;
                          return ChoiceChip(
                            label: Text(c),
                            selected: selected,
                            onSelected: (_) =>
                                setState(() => _selectedCategory = c),
                            selectedColor: AppColors.primaryColor,
                            backgroundColor: const Color(0xFFF3F3F7),
                            labelStyle: TextStyle(
                              color:
                                  selected ? Colors.white : AppColors.blackColor,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Inter',
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                              side: BorderSide(
                                color: selected
                                    ? AppColors.primaryColor
                                    : const Color(0xFFE0E0E0),
                              ),
                            ),
                            showCheckmark: false,
                          );
                        }).toList(),
                      ),

                      const SizedBox(height: 32),
                      CustomButton(
                        text: 'Upload Course',
                        onTap: _submit,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _VideoUploadBox extends StatelessWidget {
  final PlatformFile? pickedVideo;
  final bool isPicking;
  final VoidCallback onTap;
  final VoidCallback onRemove;

  const _VideoUploadBox({
    required this.pickedVideo,
    required this.isPicking,
    required this.onTap,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
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
                pickedVideo!.name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Inter',
                ),
              ),
            ),
            IconButton(
              onPressed: onRemove,
              icon: const Icon(Icons.delete_outline, color: Colors.redAccent),
            ),
          ],
        ),
      );
    }

    return InkWell(
      onTap: isPicking ? null : onTap,
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
          child: isPicking
              ? const CircularProgressIndicator()
              : Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.videocam_outlined,
                        size: 32, color: AppColors.primaryColor),
                    const SizedBox(height: 8),
                    const Text(
                      'Tap to upload a video',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Inter',
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}