import 'package:flutter/material.dart';

class ThemeSelector extends StatelessWidget {
  final ThemeMode currentMode;
  final ValueChanged<ThemeMode> onModeChanged;

  const ThemeSelector({
    super.key,
    required this.currentMode,
    required this.onModeChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildThemeOption("assets/images/light.png", "Light", ThemeMode.light),
        _buildThemeOption("assets/images/dark.png", "Dark", ThemeMode.dark),
        _buildThemeOption("assets/images/system.png", "System", ThemeMode.system),
      ],
    );
  }
  Widget _buildThemeOption(String imagePath, String label, ThemeMode mode) {
    final isSelected = currentMode == mode;
    return GestureDetector(
      onTap: () => onModeChanged(mode),
      child: Container(
        width: 105,
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFFFFADD) : Color(0xFFFFFFFF),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: isSelected ? const Color(0xFFFFD372) : const Color(0xFFDFDFDF),
            width: isSelected ? 2 : 1,
          ),
        ),
        child: Column(
          children: [
            Image.asset(
              imagePath,
              width: 28,
              height: 28,
              color: isSelected ? const Color(0xFF343B6E) : Color(0xFF707070),
            ),
            const SizedBox(height: 8),
            Text(
                label,
                style: TextStyle(
                  color: isSelected ? const Color(0xFF343B6E) : Color(0xFF707070),
                  fontWeight: FontWeight.w500,
                )
            ),
          ],
        ),
      ),
    );
  }
}