import 'package:flutter/material.dart';
import 'package:kids_education_learning/feature/parent_auth/presentation/views/working_hours/widgets/preference_title.dart';
import 'package:kids_education_learning/feature/parent_auth/presentation/views/working_hours/widgets/theme_selector.dart';
import '../../../../../../core/utils/app_dimensions.dart';
import '../../../../../../core/widgets/custom_switch_profile.dart';
import '../../../../../../core/widgets/custom_title_text_in_screen.dart';
import 'custom_drop_down.dart';
import 'notification_title.dart';

class ProfileSettingsViewBody extends StatefulWidget {
  const ProfileSettingsViewBody({super.key});

  @override
  State<ProfileSettingsViewBody> createState() =>
      _ProfileSettingsViewBodyState();
}

class _ProfileSettingsViewBodyState extends State<ProfileSettingsViewBody> {
  int selectedTabIndex = 1;

  bool notifyLessons = true;
  bool notifyPayments = true;
  bool notifyMessages = true;
  bool notifyAchievements = false;

  bool isSoundEnabled = true;
  bool isAnimationsEnabled = true;
  bool isListeningEnabled = true;

  ThemeMode currentTheme = ThemeMode.light;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppDimensions.authScreenPadding,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 32),
                const CustomTitleText(text: 'Settings'),
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CustomSwitchProfile(
                      title: "Profile",
                      isActive: selectedTabIndex == 0,
                      onTap: () => setState(() => selectedTabIndex = 0),
                    ),
                    const SizedBox(width: 10),
                    CustomSwitchProfile(
                      title: "Settings",
                      isActive: selectedTabIndex == 1,
                      onTap: () => setState(() => selectedTabIndex = 1),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                const CustomTitleText(text: "Notifications", fontSize: 24),
                const SizedBox(height: 24),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "General",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF000846),
                        ),
                      ),
                      Text(
                        "Push",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF707070),
                        ),
                      ),
                    ],
                  ),
                ),
                const Divider(),
                const SizedBox(height: 24),
                NotificationTile(
                  title: "Upcoming lesson reminders",
                  isChecked: notifyLessons,
                  onChanged: (val) => setState(() => notifyLessons = val!),
                ),
                const SizedBox(height: 24),
                NotificationTile(
                  title: "Subscription payments",
                  isChecked: notifyPayments,
                  onChanged: (val) => setState(() => notifyPayments = val!),
                ),
                const SizedBox(height: 24),
                NotificationTile(
                  title: "New messages",
                  isChecked: notifyMessages,
                  onChanged: (val) => setState(() => notifyMessages = val!),
                ),
                const SizedBox(height: 24),
                NotificationTile(
                  title: "Achievement received",
                  isChecked: notifyAchievements,
                  onChanged: (val) => setState(() => notifyAchievements = val!),
                ),
                const SizedBox(height: 48),
                const CustomTitleText(text: "Preferences", fontSize: 24),
                const SizedBox(height: 24),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 12),
                  child: Text(
                    "Lesson experience",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF000846),
                    ),
                  ),
                ),
                const Divider(),
                const SizedBox(height: 24),
                PreferenceTile(
                  title: "Sound effects",
                  value: isSoundEnabled,
                  onChanged: (val) => setState(() => isSoundEnabled = val),
                ),
                const SizedBox(height: 24),
                PreferenceTile(
                  title: "Animations",
                  value: isAnimationsEnabled,
                  onChanged: (val) => setState(() => isAnimationsEnabled = val),
                ),
                const SizedBox(height: 24),
                PreferenceTile(
                  title: "Listening exercises",
                  value: isListeningEnabled,
                  onChanged: (val) => setState(() => isListeningEnabled = val),
                ),
                const SizedBox(height: 48),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 12),
                  child: Text(
                    "Appearance",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF000846),
                    ),
                  ),
                ),
                const Divider(),
                const SizedBox(height: 24),
                ThemeSelector(
                  currentMode: currentTheme,
                  onModeChanged: (newMode) => setState(() => currentTheme = newMode),
                ),
                const SizedBox(height: 24),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 12),
                  child: Text(
                    "Language",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF000846),
                    ),
                  ),
                ),
                const Divider(),
                const SizedBox(height: 24),
                CustomDropdown(
                  label: "English",
                  onTap: () {
                    print("فتح قائمة اللغات");
                  },
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }
}