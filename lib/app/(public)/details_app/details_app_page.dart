import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:getapps/app/design_system/design_system.dart';
import 'package:routefly/routefly.dart';

class DetailsAppPage extends StatefulWidget {
  const DetailsAppPage({super.key});

  @override
  State<DetailsAppPage> createState() => _DetailsAppPageState();
}

class _DetailsAppPageState extends State<DetailsAppPage> {
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
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppAvatar.extraLarge(),
                        const Gap(12.0),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Crunchyroll',
                              style: context.textTheme.headlineLarge,
                            ),
                            const Gap(6),
                            SizedBox(
                              width: constraints.maxWidth * 0.70,
                              child: Text(
                                'Descrição teste Descrição teste Descrição teste Descrição teste Descrição teste Descrição teste Descrição teste',
                                softWrap: true,
                                overflow: TextOverflow.visible,
                                style: context.textTheme.labelMedium?.copyWith(
                                  color: context.colors.grayText,
                                ),
                              ),
                            ),
                            const Gap(4),
                            Text(
                              '72 MB',
                              style: context.textTheme.labelLarge?.copyWith(
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        )
                      ],
                    );
                  }
                ),
              ),
            ),
            SliverGap(32),
            SliverToBoxAdapter(
              child: Padding(
                padding: 12.0.paddingHorizontal,
                child: LocalTheme.dark(builder: (context) {
                  return ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      'Instalar',
                      style: context.textTheme.labelLarge,
                    ),
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
