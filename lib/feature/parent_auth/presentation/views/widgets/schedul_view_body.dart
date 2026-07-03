import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/service_locator/service_locator.dart';
import '../../../../../core/utils/app_dimensions.dart';
import '../../../../../core/utils/app_style.dart';
import '../../../../../core/widgets/custom_text_field.dart';
import '../../../../teacher/data/repos/teacher_repo_imp.dart';
import '../../../../teacher/presentations/manager/get_teachers_cubit/get_teachers_cubit.dart';
import '../../../../teacher/presentations/manager/get_teachers_cubit/get_teachers_state.dart';
import '../../../../teacher/presentations/views/widgets/teachers_grid_view.dart';


class ScheduleViewBody extends StatelessWidget {
  const ScheduleViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => GetTeachersCubit(
        teacherRepo: getIt.get<TeacherRepoImpl>(),
      )..getTeachers(),
      child: const _ScheduleViewContent(),
    );
  }
}

class _ScheduleViewContent extends StatelessWidget {
  const _ScheduleViewContent();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(
          left: AppDimensions.lessonScreenPadding,
          top: AppDimensions.lessonScreenTopPadding,
          right: AppDimensions.lessonScreenPadding,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// TITLE
            Text(
              "Schedule",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: AppStyle.styleBold32,
            ),
            const SizedBox(height: 8),
            const Text(
              "Find a suitable teacher to schedule lesson for your child.",
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: AppStyle.styleGreyRegular16,
            ),
            const SizedBox(height: 16),

            /// SEARCH
            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 42,
                    child: CustomTextField(
                      prefixIcon: SizedBox(
                        width: 22,
                        height: 22,
                        child: SvgPicture.asset(
                          "assets/icons/search_icon.svg",
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                      hintText: "Search",
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                GestureDetector(
                  onTap: () {},
                  child: SvgPicture.asset(
                    "assets/icons/filter_icon.svg",
                    width: 34,
                    height: 34,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            /// TEACHERS GRID
            Expanded(
              child: BlocBuilder<GetTeachersCubit, GetTeachersState>(
                builder: (context, state) {
                  if (state is GetTeachersLoading || state is GetTeachersInitial) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (state is GetTeachersFailure) {
                    return Center(child: Text(state.errorMessage));
                  }
                  if (state is GetTeachersSuccess) {
                    if (state.teachers.isEmpty) {
                      return const Center(child: Text('No teachers available'));
                    }
                    return TeachersGridView(teachers: state.teachers);
                  }
                  return const SizedBox.shrink();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}