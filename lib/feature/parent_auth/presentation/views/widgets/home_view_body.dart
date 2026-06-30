import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kids_education_learning/core/utils/app_color.dart';
import 'package:kids_education_learning/core/widgets/custom_stat_card.dart';
import 'package:kids_education_learning/core/widgets/custom_category_card.dart';
import 'package:kids_education_learning/feature/parent_auth/presentation/manager/category_cubit/category_cubit.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {

  static const stats = [
    ['1', 'Lesson(s)\nin progress', Icons.rocket_launch, Colors.red],
    ['10', 'Lessons\ncompleted', Icons.check_circle, Colors.green],
    ['4', 'Categories\ncompleted', Icons.grid_view_rounded, Colors.deepPurple],
    ['5', 'Achievements', Icons.emoji_events, Colors.amber],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      body: SafeArea(
        child: Column(
          children: [
            /// HEADER
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Flexible(
                    child: Text(
                      'Overview',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF343B6E),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: const Color(0xFFD9D9D9),
                        width: 1.2,
                      ),
                    ),
                    child: const Icon(
                      Icons.notifications,
                      color: Color(0xFF343B6E),
                      size: 24,
                    ),
                  ),
                ],
              ),
            ),

            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 8),

                      /// STATS GRID
                      GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: stats.length,
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 8,
                          mainAxisSpacing: 8,
                          childAspectRatio: 1.4,
                        ),
                        itemBuilder: (context, index) {
                          final e = stats[index];
                          return CustomStatCard(
                            value: e[0] as String,
                            desc: e[1] as String,
                            icon: e[2] as IconData,
                            color: e[3] as Color,
                          );
                        },
                      ),

                      const SizedBox(height: 32),

                      const Text(
                        'Categories',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF343B6E),
                        ),
                      ),

                      const SizedBox(height: 4),

                      const Text(
                        'Choose a category to begin a lesson.',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 17,
                          color: Color(0xFF7A7A7A),
                        ),
                      ),

                      const SizedBox(height: 16),

                      /// CATEGORIES FROM API
                      BlocBuilder<CategoryCubit, CategoryState>(
                        builder: (context, state) {
                          if (state is CategoryLoading) {
                            return const Center(
                              child: Padding(
                                padding: EdgeInsets.all(24),
                                child: CircularProgressIndicator(),
                              ),
                            );
                          }

                          if (state is CategoryFailure) {
                            return Center(
                              child: Padding(
                                padding: const EdgeInsets.all(24),
                                child: Text(state.errorMessage),
                              ),
                            );
                          }

                          if (state is CategorySuccess) {
                            final categories = state.categories;

                            return GridView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: categories.length,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 10,
                                childAspectRatio: 1.6,
                              ),
                              itemBuilder: (context, index) {
                                final category = categories[index];
                                return CustomCategoryCard(
                                  title: category.categoryName,
                                  imageUrl: category.categoryImageUrl,
                                );
                              },
                            );
                          }

                          return const SizedBox.shrink();
                        },
                      ),

                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}