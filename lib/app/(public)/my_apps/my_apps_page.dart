import 'package:flutter/material.dart';
import 'package:getapps/app/app.dart';
import 'package:getapps/app/design_system/design_system.dart';
import 'package:localization/localization.dart';

import '../home/widgets/widgets.dart';

class MyAppsPage extends StatefulWidget {
  const MyAppsPage({super.key});

  @override
  State<MyAppsPage> createState() => _MyAppsPageState();
}

class _MyAppsPageState extends State<MyAppsPage> with HookStateMixin {
  @override
  Widget build(BuildContext context) {
    final apps = useAtomState(myAppsState);

    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverDefaultAppbar(
              onBack: () => Routefly.pop(context),
              title: Text(
                'my-apps'.i18n(),
                style: context.textTheme.displayLarge,
              ),
            ),
            SliverPadding(
              padding: 12.0.paddingHorizontal,
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    final appModel = apps[index];

                    return Container(
                      margin: 16.0.paddingBottom,
                      child: AppTile.horizontal(
                        imageBytes: appModel.app.packageInfo.imageBytes,
                        title: appModel.app.appName,
                        infoLabel: appModel.app.repository.organizationName,
                        sizeLabel: appModel.app.repository.provider.name,
                      ),
                    );
                  },
                  childCount: apps.length,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
