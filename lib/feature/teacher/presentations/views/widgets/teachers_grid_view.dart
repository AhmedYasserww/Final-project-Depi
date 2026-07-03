import 'package:flutter/material.dart';

import '../../../../../core/utils/app_images.dart';
import '../../../../../core/widgets/custom_teacher_card.dart';
import '../../../../parent_auth/data/entites/teacher_entity.dart';
import '../../../../parent_auth/presentation/views/teacher_profile_parent_view.dart';

class TeachersGridView extends StatelessWidget {
  const TeachersGridView({super.key, required this.teachers});

  final List<TeacherEntity> teachers;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: teachers.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 0.72,
      ),
      itemBuilder: (context, index) {
        final teacher = teachers[index];
        return CustomTeacherCard(
          name: teacher.fullName,
          sessions: '${teacher.completedLesson} sessions',
          reviews: '', // مفيش reviews في الـ API لحد دلوقتي
          price: '\$${teacher.hourlyRate.toStringAsFixed(0)}/hr',
          flagIcon: AppImages.country,
          image: teacher.profileImage,


            onViewProfile: () {
              Navigator.of(context).pushNamed(
                TeacherProfileParentView.routeName,
                arguments: teacher.id,
              );

          },
        );
      },
    );
  }
}