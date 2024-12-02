import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:getapps/app/(public)/home/widgets/sliver_highlight_card_skeleton.dart';
import 'package:getapps/app/(public)/home/widgets/widgets.dart';
import 'package:getapps/app/app.dart';
import 'package:getapps/app/design_system/design_system.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with HookStateMixin {
  final debounceSearch = Debounce(delay: const Duration(milliseconds: 800));
  late final _pageController = PageController(viewportFraction: 0.90);

  @override
  void initState() {
    super.initState();

    fetchAppsActions();
  }

  @override
  Widget build(BuildContext context) {
    final apps = useAtomState(appsState);

    return Scaffold(
        body: SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverAppbarHome(
            onChanged: (value) {
              debounceSearch.call(() {
                print("search: $value");
              });
            },
            onMyApp: () => Routefly.push(routePaths.myApps),
            onRegisterApp: () => Routefly.push(routePaths.registerApp),
          ),
          const SliverGap(32),
          if (apps.isEmpty)
            const SliverHighlightCardSkeleton(itemCount: 2),
          if (apps.isNotEmpty)
            SliverToBoxAdapter(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const TitleSectionHome(title: 'Destaques da semana'),
                  SizedBox(
                    height: context.screenHeight * 0.15,
                    child: PageView.builder(
                      itemCount: apps.length,
                      controller: _pageController,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        final appModel = apps[index];

                        return HighlightCard(
                          title: appModel.app.appName,
                          infoLabel: 'github',
                          sizeLabel: 'Flutterando',
                          imageBytes: appModel.app.packageInfo.imageBytes,
                          onPressed: () => Routefly.push(
                            routePaths.detailsApp,
                            arguments: appModel,
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          const SliverGap(32),
          // Validar se faz sentido manter isso
          // SliverToBoxAdapter(
          //   child: Column(
          //     mainAxisAlignment: MainAxisAlignment.start,
          //     crossAxisAlignment: CrossAxisAlignment.start,
          //     children: [
          //       const TitleSectionHome(title: 'Novos apps'),
          //       SizedBox(
          //         height: context.screenHeight * 0.18,
          //         child: ListView.builder(
          //           itemCount: 6,
          //           scrollDirection: Axis.horizontal,
          //           padding: 12.0.paddingRight,
          //           itemBuilder: (context, index) {
          //             return Padding(
          //               padding: 12.0.paddingLeft,
          //               child: AppTile.vertical(
          //                 title: 'Playflix',
          //                 infoLabel: 'github',
          //                 onPressed: () => Routefly.push(routePaths.detailsApp),
          //               ),
          //             );
          //           },
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
          // const SliverGap(30),
          const SliverToBoxAdapter(
            child: TitleSectionHome(title: 'Outros apps'),
          ),
          if (apps.isEmpty)
            SliverPadding(
              padding: 12.0.paddingHorizontal,
              sliver: const SliverListAppTileSkeleton(childCount: 6),
            ),
          if (apps.isNotEmpty)
            SliverPadding(
              padding: 12.0.paddingHorizontal,
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    final appModel = apps[index];

                    return Container(
                      margin: 16.0.paddingBottom,
                      child: AppTile.horizontal(
                        onPressed: () => Routefly.push(
                          routePaths.detailsApp,
                          arguments: appModel,
                        ),
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
          SliverToBoxAdapter(
            child: Padding(
              padding: 32.0.paddingTop + 24.0.paddingBottom,
              child: Center(
                child: Text(
                  'Versão 1.1.001',
                  style: context.textTheme.labelLarge
                      ?.copyWith(color: const Color(0xff939AA5)),
                ),
              ),
            ),
          )
        ],
      ),
    ));
  }
}
