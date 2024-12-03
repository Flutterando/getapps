import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
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

  void onChanged(String value) {
    debounceSearch.call(() {
      setSearchTextAction(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    final apps = useAtomState(filteredAppsState);
    final favoriteApps = useAtomState(favoriteAppsState);

    final isFavoriteView = favoriteApps.isNotEmpty && searchTextState.state.isEmpty;

    return Scaffold(
        body: SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverAppbarHome(
            onChanged: onChanged,
            onMyApp: () => Routefly.push(routePaths.myApps),
            onRegisterApp: () => Routefly.push(routePaths.registerApp),
            onRemoveSearch: () => setSearchTextAction(''),
          ),
          SliverToBoxAdapter(
            child: AnimatedAlign(
              alignment: isFavoriteView ? Alignment.center : Alignment.bottomCenter,
              curve: Curves.easeOut,
              heightFactor: isFavoriteView ? 1 : 0,
              duration: const Duration(milliseconds: 500),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Gap(32),
                  const TitleSectionHome(title: 'Favoritos'),
                  SizedBox(
                    height: 120,
                    child: PageView.builder(
                      itemCount: favoriteApps.length,
                      controller: _pageController,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        final appModel = favoriteApps[index];

                        return AnimatedBuilder(
                          key: ObjectKey(appModel),
                          animation: appModel,
                          builder: (context, child) {
                            final app = appModel.app;
                            return HighlightCard(
                              title: app.appName,
                              infoLabel: app.packageInfo.id,
                              sizeLabel: app.packageInfo.version,
                              imageBytes: appModel.app.packageInfo.imageBytes,
                              onPressed: () => Routefly.push(
                                routePaths.detailsApp,
                                arguments: appModel,
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
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
            child: TitleSectionHome(title: 'Meus apps'),
          ),
          SliverToBoxAdapter(
            child: AnimatedAppsList(models: apps),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: 32.0.paddingTop + 24.0.paddingBottom,
              child: const Center(
                child: VersionWidget(),
              ),
            ),
          )
        ],
      ),
    ));
  }
}

class AnimatedAppsList extends StatelessWidget {
  final List<AppModel> models;
  const AnimatedAppsList({super.key, required this.models});

  Widget _buildItem(List<AppModel> apps) {
    return apps.isEmpty
        ? const SizedBox()
        : Padding(
            key: ObjectKey(models),
            padding: 12.0.paddingHorizontal,
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                final appModel = apps[index];

                return AnimatedBuilder(
                  key: ObjectKey(appModel),
                  animation: appModel,
                  builder: (context, child) {
                    final app = appModel.app;
                    return Container(
                      margin: 16.0.paddingBottom,
                      child: AppTile.horizontal(
                        onPressed: () => Routefly.push(
                          routePaths.detailsApp,
                          arguments: appModel,
                        ),
                        imageBytes: app.packageInfo.imageBytes,
                        title: app.appName,
                        infoLabel: app.packageInfo.id,
                        sizeLabel: app.packageInfo.version,
                      ),
                    );
                  },
                );
              },
              itemCount: apps.length,
            ),
          );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSize(
      curve: Curves.easeOut,
      duration: const Duration(milliseconds: 300),
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        transitionBuilder: (child, animation) {
          return FadeTransition(
            opacity: animation,
            child: child,
          );
        },
        child: _buildItem(models),
      ),
    );
  }
}

class VersionWidget extends StatelessWidget with HookMixin {
  const VersionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final version = useAtomState(appVersionState);
    return Text(
      'Versão $version',
      style: context.textTheme.labelLarge?.copyWith(color: const Color(0xff939AA5)),
    );
  }
}
