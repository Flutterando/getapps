import 'package:flutter/material.dart';
import 'package:getapps/config/dependencies.dart';
import 'package:getapps/domain/domain.dart';
import 'package:getapps/ui/core/core.dart';
import 'package:getapps/ui/register_app/viewmodels/register_app_viewmodel.dart';
import 'package:getapps/utils/extensions/extensions.dart';
import 'package:result_command/result_command.dart';
import 'package:routefly/routefly.dart';

import 'widgets/input_url.dart';

class RegisterAppPage extends StatefulWidget {
  const RegisterAppPage({super.key});

  @override
  State<RegisterAppPage> createState() => _RegisterAppPageState();
}

class _RegisterAppPageState extends State<RegisterAppPage> {
  final _viewModel = injector.get<RegisterAppViewmodel>();
  String _url = '';

  @override
  void initState() {
    super.initState();

    _viewModel.registerAppCommand.addListener(_registerListener);
  }

  void _registerListener() {
    setState(() {});
    final commandState = _viewModel.registerAppCommand.value;

    if (commandState is SuccessCommand<AppEntity>) {
      Routefly.pop(context, result: true);
    } else if (commandState is FailureCommand<AppEntity>) {
      final snackBar = SnackBar(
        content: Text(
          commandState.error.toString(),
          style: context.textTheme.labelMedium?.copyWith(color: Colors.white),
        ),
        backgroundColor: Colors.red,
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  @override
  void dispose() {
    _viewModel.registerAppCommand.removeListener(_registerListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverDefaultAppbar(
              onBack: () => Routefly.pop(context),
              title: Text(
                'Cadastro',
                style: context.textTheme.displayLarge,
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: 16.0.paddingHorizontal,
                child: Form(
                  child: InputUrl(onChanged: (value) {
                    _url = value;
                  }),
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
            onPressed: _viewModel.registerAppCommand.isRunning
                ? null
                : () {
                    _viewModel.registerAppCommand.execute(_url);
                  },
            child: Text(
              'Cadastrar Aplicativo',
              style: context.textTheme.labelLarge,
            ),
          );
        }),
      ),
    );
  }
}
