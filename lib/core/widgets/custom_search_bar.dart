import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kids_education_learning/core/utils/app_color.dart';
import 'package:kids_education_learning/core/utils/app_style.dart';

import '../utils/app_images.dart';

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
                color: AppColors.textFieldBorderColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextFormField(
                textAlignVertical: TextAlignVertical.center,
                // style: TextStyle(fontSize: 16),
                decoration: InputDecoration(
                  hintText: 'Search',
                  hintStyle: AppStyle.hintStyle,
                  prefixIcon: IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset(AppImages.iconSearchBar),
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
              border: Border.all(color: AppColors.borderIconFilter),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: IconButton(
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
                icon: const Icon(
                  Icons.filter_list,
                  color: AppColors.subtitleListTile,
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
