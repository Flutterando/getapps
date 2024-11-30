import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:getapps/app/(public)/home/widgets/widgets.dart';
import 'package:getapps/app/design_system/design_system.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final _pageController = PageController(viewportFraction: 0.90);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverAppbarHome(
            onChanged: (value) {},
            onMyApp: () {},
            onRegisterApp: () {},
          ),
          const SliverGap(32),
          SliverToBoxAdapter(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const TitleSectionHome(title: 'Destaques da semana'),
                SizedBox(
                  height: context.screenHeight * 0.15,
                  child: PageView.builder(
                    itemCount: 3,
                    controller: _pageController,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return HighlightCard(
                        title: 'Playflix',
                        infoLabel: 'stream • video',
                        sizeLabel: '64 MB',
                        onPressed: () {
                          print("clique $index");
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          const SliverGap(32),
          SliverToBoxAdapter(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const TitleSectionHome(title: 'Novos apps'),
                SizedBox(
                  height: context.screenHeight * 0.18,
                  child: ListView.builder(
                    itemCount: 6,
                    scrollDirection: Axis.horizontal,
                    padding: 12.0.paddingRight,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: 12.0.paddingLeft,
                        child: AppTile.vertical(
                          title: '',
                          infoLabel: '',
                          sizeLabel: '',
                          onPressed: () {},
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          const SliverGap(30),
          const SliverToBoxAdapter(
            child: TitleSectionHome(title: 'Novos apps'),
          ),
          SliverPadding(
            padding: 12.0.paddingHorizontal,
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return Container(
                    margin: 16.0.paddingBottom,
                    child: AppTile.horizontal(
                      onPressed: () {},
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
