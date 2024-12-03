import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:getapps/app/design_system/design_system.dart';
import 'package:uicons/uicons.dart';

class SliverAppbarHome extends StatefulWidget {
  const SliverAppbarHome({
    super.key,
    required this.onChanged,
    required this.onRegisterApp,
    required this.onMyApp,
    required this.onRemoveSearch,
  });

  final ValueChanged<String> onChanged;
  final VoidCallback onRegisterApp;
  final VoidCallback onMyApp;
  final VoidCallback onRemoveSearch;

  @override
  State<SliverAppbarHome> createState() => _SliverAppbarHomeState();
}

class _SliverAppbarHomeState extends State<SliverAppbarHome> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

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
                child: TextFormField(
                  autofocus: false,
                  controller: _controller,
                  onChanged: widget.onChanged,
                  decoration: InputDecoration(
                    hintText: 'Busca por nome do app',
                    suffixIcon: AnimatedBuilder(
                      animation: _controller,
                      builder: (context, child) {
                        if (_controller.text.isEmpty) {
                          return Icon(UIcons.regularRounded.search);
                        } else {
                          return GestureDetector(
                            onTap: () {
                              _controller.clear();
                              widget.onRemoveSearch();
                            },
                            child: Icon(UIcons.regularRounded.x),
                          );
                        }
                      },
                    ),
                  ),
                ),
              ),
              const Gap(12),
              IconButton(
                onPressed: widget.onRegisterApp,
                icon: Icon(UIcons.regularRounded.plus),
              ),
              const Gap(12),
              IconButton(
                onPressed: widget.onMyApp,
                icon: Icon(UIcons.regularRounded.settings_sliders),
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
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
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
