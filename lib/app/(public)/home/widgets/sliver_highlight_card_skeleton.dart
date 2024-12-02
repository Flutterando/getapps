import 'package:flutter/material.dart';
import 'package:getapps/app/(public)/home/widgets/widgets.dart';
import 'package:getapps/app/design_system/design_system.dart';

class SliverHighlightCardSkeleton extends StatefulWidget {
  const SliverHighlightCardSkeleton({super.key, required this.itemCount});

  final int itemCount;

  @override
  State<SliverHighlightCardSkeleton> createState() => _SliverHighlightCardSkeletonState();
}

class _SliverHighlightCardSkeletonState extends State<SliverHighlightCardSkeleton> {
  final _pageController = PageController(viewportFraction: 0.90);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TitleSectionHome(title: 'Destaques da semana'),
          SizedBox(
            height: context.screenHeight * 0.15,
            child: PageView.builder(
              itemCount: widget.itemCount,
              scrollDirection: Axis.horizontal,
              controller: _pageController,
              itemBuilder: (context, index) {
                return HighlightCard(
                  title: '',
                  infoLabel: '',
                  sizeLabel: '',
                  onPressed: () => {},
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
