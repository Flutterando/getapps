import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:getapps/app/(public)/home/widgets/widgets.dart';
import 'package:getapps/app/app.dart';
import 'package:getapps/app/design_system/design_system.dart';
import 'package:uicons/uicons.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with HookStateMixin {
  final debounceSearch = Debounce(delay: const Duration(milliseconds: 800));

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
    final size = MediaQuery.sizeOf(context);

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
                    width: size.width,
                    child: ListView.builder(
                      itemCount: favoriteApps.length,
                      padding: const EdgeInsets.only(left: 12),
                      shrinkWrap: true,
                      physics: const PageScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        final appModel = favoriteApps[index];

                        return SizedBox(
                          width: 300,
                          child: AnimatedBuilder(
                            key: ObjectKey(appModel),
                            animation: appModel,
                            builder: (context, child) {
                              final app = appModel.app;
                              late Widget buttonLabel;

                              if (app.appNotInstall) {
                                buttonLabel = _buildButtonLabel('Instalar', UIcons.regularRounded.download);
                              } else if (app.updateIsAvailable) {
                                buttonLabel = _buildButtonLabel('Atualizar', UIcons.regularRounded.refresh);
                              } else {
                                buttonLabel = _buildButtonLabel('Abrir', UIcons.regularRounded.play);
                              }
                              return HighlightCard(
                                title: app.appName,
                                infoLabel: app.packageInfo.id,
                                sizeLabel: app.packageInfo.version,
                                imageBytes: appModel.app.packageInfo.imageBytes,
                                onPressed: () => Routefly.push(
                                  routePaths.detailsApp,
                                  arguments: appModel,
                                ),
                                trailing: StatusAppButton(
                                  isLoading: appModel.isLoading,
                                  progress: appModel.downloadPercent,
                                  buttonLabel: buttonLabel,
                                  onTap: () {
                                    if (app.appNotInstall || app.updateIsAvailable) {
                                      installAppAction(appModel, '');
                                    } else {
                                      openApp(app);
                                    }
                                  },
                                  onOptions: () {
                                    showModalBottomSheet(
                                      context: context,
                                      builder: (context) {
                                        return Container();
                                      },
                                    );
                                  },
                                  onCancel: () => cancelInstallAppAction(),
                                ),
                              );
                            },
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SliverGap(32),
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
                    late Widget buttonLabel;

                    if (app.appNotInstall) {
                      buttonLabel = _buildButtonLabel('Instalar', UIcons.regularRounded.download);
                    } else if (app.updateIsAvailable) {
                      buttonLabel = _buildButtonLabel('Atualizar', UIcons.regularRounded.refresh);
                    } else {
                      buttonLabel = _buildButtonLabel('Abrir', UIcons.regularRounded.play);
                    }
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
                        trailing: StatusAppButton(
                          isLoading: appModel.isLoading,
                          progress: appModel.downloadPercent,
                          buttonLabel: buttonLabel,
                          onTap: () {
                            if (app.appNotInstall || app.updateIsAvailable) {
                              installAppAction(appModel, '');
                            } else {
                              openApp(app);
                            }
                          },
                          onOptions: () {
                            showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return Container();
                              },
                            );
                          },
                          onCancel: () => cancelInstallAppAction(),
                        ),
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

Widget _buildButtonLabel(String label, IconData icon) {
  return Row(
    mainAxisSize: MainAxisSize.min,
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      const Gap(6),
      Icon(
        icon,
        color: Colors.grey,
        size: 12,
      ),
      const Gap(6),
      Text(
        label,
        style: const TextStyle(
          color: Colors.grey,
          fontSize: 12,
        ),
      ),
    ],
  );
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

class StatusAppButton extends StatefulWidget {
  final bool isLoading;
  final double? progress;
  final VoidCallback onTap;
  final VoidCallback onOptions;
  final VoidCallback onCancel;
  final Widget buttonLabel;

  const StatusAppButton({
    super.key,
    required this.buttonLabel,
    required this.isLoading,
    this.progress,
    required this.onTap,
    required this.onOptions,
    required this.onCancel,
  });

  @override
  State<StatusAppButton> createState() => _StatusAppButtonState();
}

class _StatusAppButtonState extends State<StatusAppButton> with SingleTickerProviderStateMixin, HookStateMixin {
  late final _controller = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 800),
  );

  late final Animation<double> _opacityLoadingBackgroundAnimation;
  late final Animation<double> _internalLoadingChildOpacityAnimation;
  late final Animation<double> _radiusLoadingAnimation;
  late final Animation<double> _widthLoadingAnimation;

  final heightSize = 35.0;

  @override
  void initState() {
    super.initState();

    _opacityLoadingBackgroundAnimation = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.0, 0.3),
    ));

    _internalLoadingChildOpacityAnimation = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.6, 1.0),
    ));
    _radiusLoadingAnimation = Tween<double>(begin: 12, end: heightSize / 2).animate(CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.0, 0.3),
    ));
    _widthLoadingAnimation = Tween<double>(begin: 120, end: heightSize).animate(CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.3, 0.6),
    ));
  }

  @override
  void didUpdateWidget(covariant StatusAppButton oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.isLoading) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    useListenable(_controller);

    return Stack(
      children: [
        if (_opacityLoadingBackgroundAnimation.value < 1.0)
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Material(
                color: Colors.grey[200],
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(_radiusLoadingAnimation.value),
                  bottomLeft: Radius.circular(_radiusLoadingAnimation.value),
                ),
                child: InkWell(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(_radiusLoadingAnimation.value),
                    bottomLeft: Radius.circular(_radiusLoadingAnimation.value),
                  ),
                  onTap: widget.onTap,
                  child: Container(
                    width: _widthLoadingAnimation.value * 0.7,
                    height: heightSize,
                    alignment: Alignment.center,
                    child: widget.buttonLabel,
                  ),
                ),
              ),
              Gap(_widthLoadingAnimation.value * 0.03),
              Material(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(_radiusLoadingAnimation.value),
                  bottomRight: Radius.circular(_radiusLoadingAnimation.value),
                ),
                color: Colors.grey[200],
                child: InkWell(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(_radiusLoadingAnimation.value),
                    bottomRight: Radius.circular(_radiusLoadingAnimation.value),
                  ),
                  onTap: widget.onOptions,
                  child: Container(
                    width: _widthLoadingAnimation.value * 0.27,
                    height: heightSize,
                    alignment: Alignment.center,
                    child: const Icon(Icons.more_vert, color: Colors.grey, size: 20),
                  ),
                ),
              ),
            ],
          ),
        if (_opacityLoadingBackgroundAnimation.value > 0)
          Opacity(
            opacity: _opacityLoadingBackgroundAnimation.value,
            child: Material(
              color: Colors.grey[200],
              borderRadius: BorderRadius.all(Radius.circular(_radiusLoadingAnimation.value)),
              child: InkWell(
                onTap: widget.onCancel,
                borderRadius: BorderRadius.all(Radius.circular(_radiusLoadingAnimation.value)),
                child: Container(
                  width: _widthLoadingAnimation.value,
                  height: heightSize,
                  alignment: Alignment.center,
                  child: Opacity(
                    opacity: _internalLoadingChildOpacityAnimation.value,
                    child: Stack(
                      children: [
                        Center(
                          child: CircularProgressIndicator(
                            color: Colors.grey[600],
                            value: widget.progress,
                          ),
                        ),
                        Center(
                          child: Container(
                            width: heightSize * 0.4,
                            height: heightSize * 0.4,
                            decoration: BoxDecoration(
                              color: Colors.grey[600],
                              borderRadius: BorderRadius.circular(3),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
