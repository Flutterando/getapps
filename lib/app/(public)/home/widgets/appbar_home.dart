import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:getapps/app/design_system/design_system.dart';
import 'package:uicons/uicons.dart';

class SliverAppbarHome extends StatelessWidget {
  const SliverAppbarHome({
    super.key,
    required this.onChanged,
    required this.onRegisterApp,
    required this.onMyApp,
  });

  final ValueChanged<String> onChanged;
  final VoidCallback onRegisterApp;
  final VoidCallback onMyApp;

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      floating: true,
      delegate: _PinnedHeaderDelegate(
        child: Container(
          color: context.colorPalette.surface,
          padding: 16.0.paddingHorizontal + 24.0.paddingTop + 8.0.paddingBottom,
          child: Row(
            children: [
              Expanded(
                child: Form(
                  child: TextFormField(
                    onChanged: onChanged,
                    decoration: InputDecoration(
                      hintText: 'Busca por nome do app',
                      suffixIcon: Icon(UIcons.regularRounded.search),
                    ),
                  ),
                ),
              ),
              const Gap(12),
              IconButton(
                onPressed: onRegisterApp,
                icon: Icon(UIcons.regularRounded.plus),
              ),
              const Gap(12),
              IconButton(
                onPressed: onMyApp,
                icon: Icon(UIcons.regularRounded.apps),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _PinnedHeaderDelegate extends SliverPersistentHeaderDelegate {
  final Widget child;

  _PinnedHeaderDelegate({required this.child});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return child;
  }

  @override
  double get maxExtent => 90.0;

  @override
  double get minExtent => 90.0;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
