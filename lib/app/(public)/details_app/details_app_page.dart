import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:getapps/app/app.dart';
import 'package:getapps/app/design_system/design_system.dart';

class DetailsAppPage extends StatefulWidget {
  const DetailsAppPage({super.key});

  @override
  State<DetailsAppPage> createState() => _DetailsAppPageState();
}

class _DetailsAppPageState extends State<DetailsAppPage> {
  late AppModel appModel;

  @override
  void initState() {
    super.initState();
    if (Routefly.query.arguments is! AppModel) {
      Routefly.pop(context);
    }

    appModel = Routefly.query.arguments as AppModel;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverDefaultAppbar(onBack: () => Routefly.pop(context)),
            SliverToBoxAdapter(
              child: Padding(
                padding: 16.0.paddingHorizontal,
                child: LayoutBuilder(builder: (context, constraints) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppAvatar.extraLarge(
                        image: appModel.app.packageInfo.imageBytes.isNotEmpty //
                            ? Image.memory(
                                Uint8List.fromList(
                                  appModel.app.packageInfo.imageBytes,
                                ),
                                fit: BoxFit.cover,
                              )
                            : null,
                      ),
                      const Gap(12.0),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            appModel.app.appName,
                            style: context.textTheme.headlineLarge,
                          ),
                          const Gap(6),
                          SizedBox(
                            width: constraints.maxWidth * 0.70,
                            child: Text(
                              appModel.app.repository.provider.name,
                              softWrap: true,
                              overflow: TextOverflow.visible,
                              style: context.textTheme.labelMedium?.copyWith(
                                color: context.colors.grayText,
                              ),
                            ),
                          ),
                          const Gap(4),
                          Text(
                            appModel.app.repository.organizationName,
                            style: context.textTheme.labelLarge?.copyWith(
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      )
                    ],
                  );
                }),
              ),
            ),
            const SliverGap(32),
            SliverToBoxAdapter(
              child: Padding(
                padding: 12.0.paddingHorizontal,
                child: LocalTheme.dark(builder: (context) {
                  return Column(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          if (appModel.app.appNotInstall) {
                            installAppAction(appModel, 'asset');
                          } else {
                            uninstallAppAction(appModel);
                          }
                        },
                        child: Text(
                          appModel.app.appNotInstall
                              ? 'Instalar'
                              : 'Desinstalar',
                          style: context.textTheme.labelLarge,
                        ),
                      ),
                      const Gap(12),
                      if (!appModel.app.appNotInstall)
                        ElevatedButton(
                          onPressed: () => openApp(appModel.app),
                          style: ButtonStyle(
                            backgroundColor: WidgetStateProperty.all(
                              context.themeIsDark //
                                  ? context.colors.white
                                  : context.colors.black,
                            ),
                          ),
                          child: Text(
                            'Abir aplicativo',
                            style: context.textTheme.labelLarge?.copyWith(
                              color: context.themeIsDark //
                                  ? context.colors.black
                                  : context.colors.white,
                            ),
                          ),
                        ),
                    ],
                  );
                }),
              ),
            )
          ],
        ),
      ),
    );
  }
}
