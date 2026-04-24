import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 36,
              decoration: BoxDecoration(
                color: Color(0xFFF6F6F6),
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextFormField(
                textAlignVertical: TextAlignVertical.center,
                style: TextStyle(fontSize: 16),
                decoration: InputDecoration(
                  hintText: 'Search',
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 16),
                  prefixIcon: IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset('assets/icons/search_icon.svg'),
                    color: Colors.grey,
                    iconSize: 20,
                  ),
                  border: InputBorder.none,
                  isDense: true,
                  contentPadding: EdgeInsets.zero,
                ),
              ),
            ),
          ),
          const SizedBox(width: 8),

          Container(
            height: 36,
            width: 36,
            decoration: BoxDecoration(
              border: Border.all(color: const Color(0xFFE0E0E0)),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: IconButton(
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
                icon: const Icon(
                  Icons.filter_list,
                  color: Colors.grey,
                  size: 20,
                ),
                onPressed: () {},
              ),
            ),
          ),
        ],
      ),
    );
  }
}
