import 'package:kids_education_learning/core/services/api_service.dart';
import 'package:kids_education_learning/feature/parent_auth/data/models/working_hours_model.dart';
import 'package:kids_education_learning/feature/parent_auth/presentation/views/working_hours/models/day_schedule.dart';

abstract class WorkingHoursRepo {
  Future<UpdateWorkingHoursResponseModel> updateWorkingHours(
    List<DaySchedule> days,
  );
}

class WorkingHoursRepoImpl implements WorkingHoursRepo {
  final ApiService apiService;

  WorkingHoursRepoImpl({required this.apiService});

  static const String _endPoint = 'Account/teacher/hours';

  @override
  Future<UpdateWorkingHoursResponseModel> updateWorkingHours(
    List<DaySchedule> days,
  ) async {
    final body = days
        .map((d) => WeeklyAvailabilityModel.fromDaySchedule(d).toJson())
        .toList();

    // apiService.put() already returns response.data (decoded JSON),
    // not the raw Dio Response — so we parse it directly.
    final response = await apiService.put(endPoint: _endPoint, data: body);

    return UpdateWorkingHoursResponseModel.fromJson(
      response as Map<String, dynamic>,
    );
  }
}