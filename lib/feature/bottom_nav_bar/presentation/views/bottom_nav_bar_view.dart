// core/widgets/custom_navigation_bar.dart
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kids_education_learning/feature/bottom_nav_bar/presentation/nav_bar_item.dart';

class CustomNavigationBar extends StatefulWidget {
  final List<NavBarItem> items;

  const CustomNavigationBar({super.key, required this.items});

  @override
  State<CustomNavigationBar> createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: IndexedStack(
          index: selectedIndex,
          children: widget.items.map((e) => e.screen).toList(),
        ),
        bottomNavigationBar: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
            boxShadow: const [
              BoxShadow(color: Colors.black12, blurRadius: 30, offset: Offset(0, -6)),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(
              widget.items.length,
              (index) => _navItem(index, widget.items[index]),
            ),
          ),
        ),
      ),
    );
  }

  Widget _navItem(int index, NavBarItem item) {
    bool selected = index == selectedIndex;

    return Expanded(
      child: InkWell(
        onTap: () => setState(() => selectedIndex = index),
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              child: Transform.translate(
                offset: selected ? const Offset(0, -16) : Offset.zero,
                child: selected
                    ? Container(
                        width: 54,
                        height: 54,
                        decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
                        alignment: Alignment.center,
                        child: Container(
                          width: 44,
                          height: 44,
                          padding: const EdgeInsets.all(10),
                          decoration: const ShapeDecoration(
                            gradient: LinearGradient(
                              begin: Alignment(0.0, 1.0),
                              end: Alignment(1.0, -1.0),
                              colors: [Color(0xFFA4CAFE), Color(0xFF3F83F8)],
                            ),
                            shape: OvalBorder(),
                          ),
                          child: SvgPicture.asset(
                            item.outlinedIcon,
                            width: 24,
                            height: 24,
                            colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                          ),
                        ),
                      )
                    : SvgPicture.asset(item.outlinedIcon, width: 24, height: 24),
              ),
            ),
            const SizedBox(height: 4),
            Transform.translate(
              offset: selected ? const Offset(0, -15) : Offset.zero,
              child: Text(
                item.title,
                style: TextStyle(
                  fontSize: 12,
                  color: selected ? const Color(0xFF1E429F) : const Color(0xFF4B5563),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}