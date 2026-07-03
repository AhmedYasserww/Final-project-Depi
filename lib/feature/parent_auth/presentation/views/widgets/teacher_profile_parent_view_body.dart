import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/utils/app_color.dart';
import '../../../../../core/utils/app_style.dart';
import '../../../../../core/widgets/profile_widgets/custom_icon_button.dart';
import '../../../../../core/widgets/profile_widgets/custom_tab_button.dart';
import '../../../../teacher/presentations/manager/get_teacher_profile_cubit/get_teacher_profile_cubit.dart';
import '../../../../teacher/presentations/manager/get_teacher_profile_cubit/get_teacher_profile_state.dart';
import '../../../../teacher/presentations/views/widgets/custom_availability_row.dart';
import '../../../../teacher/presentations/views/widgets/custom_profile_stat_card.dart';
import '../../../../teacher/presentations/views/widgets/week_day_helper.dart';
import '../../../data/entites/teacher_entity.dart';
import 'confirm_booking_sheet.dart';
import 'custom_book_card.dart';
import 'select_data_sheet.dart';

class TeacherProfileParentViewBody extends StatelessWidget {
  const TeacherProfileParentViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetTeacherProfileCubit, GetTeacherProfileState>(
      builder: (context, state) {
        if (state is GetTeacherProfileLoading ||
            state is GetTeacherProfileInitial) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is GetTeacherProfileFailure) {
          return Center(child: Text(state.errorMessage));
        }
        if (state is GetTeacherProfileSuccess) {
          return _TeacherProfileContent(teacher: state.teacher);
        }
        return const SizedBox.shrink();
      },
    );
  }
}

class _TeacherProfileContent extends StatefulWidget {
  const _TeacherProfileContent({required this.teacher});

  final TeacherEntity teacher;

  @override
  State<_TeacherProfileContent> createState() =>
      _TeacherProfileContentState();
}

class _TeacherProfileContentState extends State<_TeacherProfileContent> {
  int _selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    final teacher = widget.teacher;

    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'Profile',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w700,
                    color: AppColors.blackColor,
                    fontFamily: 'Inter',
                  ),
                ),
                Row(
                  children: [
                    CustomIconButton(icon: Icons.edit_outlined),
                    SizedBox(width: 8),
                    CustomIconButton(icon: Icons.settings_outlined),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 30),

            /// Avatar
            ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Container(
                width: 100,
                height: 100,
                color: const Color(0xFFB0A8D9),
                child: teacher.profileImage.isNotEmpty
                    ? Image.network(teacher.profileImage, fit: BoxFit.cover)
                    : const Icon(Icons.person, size: 80, color: Colors.white),
              ),
            ),
            const SizedBox(height: 12),

            /// Name
            Text(
              teacher.fullName,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w800,
                color: AppColors.labelTextColor,
                fontFamily: 'Inter',
              ),
            ),
            const SizedBox(height: 4),
            Text(
              '\$${teacher.hourlyRate.toStringAsFixed(0)}/hr',
              style: AppStyle.styleBoldShop16,
            ),
            const SizedBox(height: 16),

            /// Tabs
            Row(
              children: [
                CustomTabButton(
                  label: 'Overview',
                  isSelected: _selectedTab == 0,
                  onTap: () => setState(() => _selectedTab = 0),
                ),
                const SizedBox(width: 10),
                CustomTabButton(
                  label: 'Reviews',
                  badge: '0',
                  isSelected: _selectedTab == 1,
                  onTap: () => setState(() => _selectedTab = 1),
                ),
              ],
            ),
            const SizedBox(height: 20),

            /// Stats
            Row(
              children: [
                Expanded(
                  child: CustomProfileStatCard(
                    value: '${teacher.completedLesson}',
                    label: 'Lessons completed',
                    icon: Container(
                      padding: const EdgeInsets.all(2),
                      decoration: const BoxDecoration(
                        color: Color(0xFF4CAF50),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.check,
                        color: Colors.white,
                        size: 16,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: CustomProfileStatCard(
                    value: '${teacher.scheduledLesson}',
                    label: 'Scheduled lessons',
                    icon: const Icon(
                      Icons.calendar_today_outlined,
                      color: AppColors.darkBlueColor,
                      size: 20,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 25),

            Text(teacher.bio, style: AppStyle.styleGreyRegular16),
            const SizedBox(height: 20),
            const Divider(color: Color(0xFFE0E0E0), thickness: 1),
            const SizedBox(height: 20),

            /// Availability (Weekly Schedule)
            const Text(
              'Availability',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w800,
                color: AppColors.labelTextColor,
                fontFamily: 'Inter',
              ),
            ),
            const SizedBox(height: 6),
            Text(
              "This teacher's weekly working hours.",
              style: AppStyle.styleGreyRegular16,
            ),
            const SizedBox(height: 16),

            ..._buildWeeklyAvailability(teacher),

            const SizedBox(height: 24),


            /// Session Cards
            CustomBookCard(
              duration: '30 minutes',
              label: 'Lesson',
              onBook: () => _openBookingFlow(context, '30 minutes'),
            ),
            const SizedBox(height: 16),
            CustomBookCard(
              duration: '1 hour',
              label: 'Lesson',
              onBook: () => _openBookingFlow(context, '1 hour'),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildWeeklyAvailability(TeacherEntity teacher) {
    return WeekDayHelper.orderedDays.map((day) {
      final match = teacher.weeklyAvailability.where(
            (a) => a.day.toLowerCase() == day,
      );

      final availability = match.isNotEmpty ? match.first : null;
      final isActive = availability?.isActive ?? false;

      return CustomAvailabilityRow(
        dayLabel: WeekDayHelper.displayName(day),
        isActive: isActive,
        timeRange: isActive
            ? WeekDayHelper.formatTimeRange(
          availability!.startTime,
          availability.endTime,
        )
            : null,
      );
    }).toList();
  }
}

void _openBookingFlow(BuildContext context, String duration) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (_) => SelectDateSheet(
      lessonDuration: duration,
      onDateConfirmed: (date) {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          backgroundColor: Colors.transparent,
          builder: (_) => ConfirmBookingSheet(
            lessonDuration: duration,
            date: date,
            childName: 'Jacob', // TODO: replace with real child picker
            category: 'Super Shapes', // TODO: replace with real category picker
            paymentMethod: 'Mastercard •••• 6533', // TODO: pull from payment cubit
            onConfirm: () {
              Navigator.pop(context);
              // TODO: dispatch to a BookingCubit / call your booking API here
            },
          ),
        );
      },
    ),
  );
}