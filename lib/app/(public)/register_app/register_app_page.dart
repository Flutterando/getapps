import 'package:flutter/material.dart';
import 'package:getapps/app/(public)/register_app/widgets/input_url.dart';
import 'package:getapps/app/design_system/design_system.dart';
import 'package:localization/localization.dart';
import 'package:routefly/routefly.dart';

class RegisterAppPage extends StatefulWidget {
  const RegisterAppPage({super.key});

  @override
  State<RegisterAppPage> createState() => _RegisterAppPageState();
}

class _RegisterAppPageState extends State<RegisterAppPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverDefaultAppbar(
              onBack: () => Routefly.pop(context),
              title: Text(
                'register'.i18n(),
                style: context.textTheme.displayLarge,
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: 16.0.paddingHorizontal,
                child: Form(
                  child: InputUrl(onChanged: (value) {}),
                ),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: 16.0.paddingHorizontal + 24.0.paddingVertical,
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(
              color: Color(0xffD9D9D9),
              width: 1,
            ),
          ),
        ),
        child: LocalTheme.dark(builder: (context) {
          return ElevatedButton(
            onPressed: () {},
            child: Text(
              'register-app'.i18n(),
              style: context.textTheme.labelLarge,
            ),
          );
        }),
      ),
    );
  }
}
