import 'package:flutter/material.dart';
import 'package:getapps/app/(public)/home/home_page.dart';
import 'package:getapps/app/app.dart';
import 'package:getapps/app/design_system/design_system.dart';

import '../home/widgets/widgets.dart';

class MyAppsPage extends StatelessWidget {
  const MyAppsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverDefaultAppbar(
              onBack: () => Routefly.pop(context),
              title: Text(
                'Meus Aplicativos',
                style: context.textTheme.displayLarge,
              ),
            ),
            SliverPadding(
              padding: 12.0.paddingHorizontal,
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    return Container(
                      margin: 16.0.paddingBottom,
                      child: AppTile.horizontal(
                        onPressed: () => Routefly.push(routePaths.detailsApp),
                        title: 'Playflix',
                        infoLabel: 'videos • stream',
                        sizeLabel: '80 MB',
                      ),
                    );
                  },
                  childCount: 20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
