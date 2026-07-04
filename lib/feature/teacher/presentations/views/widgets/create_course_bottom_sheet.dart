import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kids_education_learning/core/service_locator/service_locator.dart';
import 'package:kids_education_learning/feature/parent/presentations/views/widgets/category_chips.dart';
import 'package:kids_education_learning/core/widgets/course_text_field.dart';
import 'package:kids_education_learning/feature/teacher/presentations/views/widgets/video_upload.dart';
import 'package:kids_education_learning/feature/teacher/presentations/views/widgets/course_uploaded_dialog.dart';
import '../../../../../core/utils/app_color.dart';
import '../../../../../core/utils/app_style.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../auth/presentaions/auth_teacher/presentations/manager/course_cubit/course_cubit.dart';
import '../../../../auth/presentaions/auth_teacher/presentations/manager/course_cubit/course_state.dart';

/// Shows the "Add Course" bottom sheet.
/// Returns `true` if a course was successfully uploaded, so the
/// caller (e.g. TeacherProfileViewBody) can refresh its course list.
Future<bool?> showCreateCourseBottomSheet(BuildContext context) {
  return showModalBottomSheet<bool>(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (_) => BlocProvider(
      create: (_) => getIt<CourseCubit>(),
      child: const CreateCourseBottomSheet(),
    ),
  );
}

class CreateCourseBottomSheet extends StatefulWidget {
  const CreateCourseBottomSheet({super.key});

  @override
  State<CreateCourseBottomSheet> createState() =>
      _CreateCourseBottomSheetState();
}

class _CreateCourseBottomSheetState extends State<CreateCourseBottomSheet> {
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();

  PlatformFile? _pickedVideo;
  int? _selectedCategoryId;

  bool get _canSubmit =>
      _pickedVideo != null &&
      _selectedCategoryId != null &&
      _titleController.text.trim().isNotEmpty &&
      _descriptionController.text.trim().isNotEmpty;

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  void _submit() {
    if (!_canSubmit) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Please fill in the title, description, video and category',
          ),
        ),
      );
      return;
    }

    context.read<CourseCubit>().addCourse(
      title: _titleController.text.trim(),
      description: _descriptionController.text.trim(),
      categoryId: _selectedCategoryId!,
      videoPath: _pickedVideo!.path!,
      videoName: _pickedVideo!.name,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CourseCubit, CourseState>(
      listener: (context, state) async {
        if (state is CourseSuccess) {
          await showDialog(
            context: context,
            barrierDismissible: false,
            builder: (_) => const CourseUploadedDialog(),
          );
          if (context.mounted) {
            Navigator.of(
              context,
            ).pop(true); // closes the bottom sheet, returns true
          }
        } else if (state is CourseError) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message)));
        }
      },
      builder: (context, state) {
        final isLoading = state is CourseLoading;

        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: DraggableScrollableSheet(
            initialChildSize: 0.85,
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
                                onPressed: isLoading
                                    ? null
                                    : () => Navigator.of(context).pop(),
                                icon: const Icon(Icons.close),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),

                          Text('Title', style: AppStyle.styleGreyRegular16),
                          const SizedBox(height: 8),
                          CourseTextField(
                            controller: _titleController,
                            hint: 'e.g. Learning the Alphabet',
                          ),

                          const SizedBox(height: 20),
                          Text(
                            'Description',
                            style: AppStyle.styleGreyRegular16,
                          ),
                          const SizedBox(height: 8),
                          CourseTextField(
                            controller: _descriptionController,
                            hint: 'What will kids learn in this course?',
                            maxLines: 4,
                          ),

                          const SizedBox(height: 20),
                          Text(
                            'Course video',
                            style: AppStyle.styleGreyRegular16,
                          ),
                          const SizedBox(height: 8),
                          VideoUploadBox(
                            pickedVideo: _pickedVideo,
                            onPicked: (file) =>
                                setState(() => _pickedVideo = file),
                            onRemove: () => setState(() => _pickedVideo = null),
                          ),

                          const SizedBox(height: 24),
                          Text('Category', style: AppStyle.styleGreyRegular16),
                          const SizedBox(height: 10),
                          CategoryChips(
                            selectedCategoryId: _selectedCategoryId,
                            onSelected: (id) =>
                                setState(() => _selectedCategoryId = id),
                          ),

                          const SizedBox(height: 32),
                          CustomButton(
                            text: 'Upload Course',
                            isLoading: state is CourseLoading,
                            onTap: isLoading ? () {} : _submit,
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
      },
    );
  }
}
