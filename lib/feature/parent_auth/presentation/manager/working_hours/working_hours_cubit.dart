import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kids_education_learning/feature/parent_auth/data/repos/working_hours_repo_imp.dart';
import 'package:kids_education_learning/feature/parent_auth/presentation/manager/working_hours/working_hours_state.dart';
import 'package:kids_education_learning/feature/parent_auth/presentation/views/working_hours/models/day_schedule.dart';

class WorkingHoursCubit extends Cubit<WorkingHoursState> {
  final WorkingHoursRepo workingHoursRepo;

  WorkingHoursCubit({required this.workingHoursRepo})
      : super(WorkingHoursInitial());

  Future<void> updateWorkingHours(List<DaySchedule> days) async {
    emit(WorkingHoursLoading());
    try {
      final result = await workingHoursRepo.updateWorkingHours(days);
      if (result.succeeded) {
        emit(WorkingHoursSuccess(result));
      } else {
        emit(WorkingHoursFailure(result.message ?? result.errors.join(', ')));
      }
    } catch (e) {
      emit(WorkingHoursFailure(e.toString()));
    }
  }
}