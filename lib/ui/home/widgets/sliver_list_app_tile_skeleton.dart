import 'package:flutter/material.dart';
import 'package:getapps/utils/extensions/extensions.dart';

import 'app_tile.dart';

class SliverListAppTileSkeleton extends StatelessWidget {
  const SliverListAppTileSkeleton({
    super.key,
    required this.childCount,
  });

  final int childCount;

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return Container(
            margin: 16.0.paddingBottom,
            child: AppTile.horizontal(
              title: '',
              infoLabel: '',
              sizeLabel: '',
            ),
          );
        },
        childCount: childCount,
      ),
    );
  }
}
