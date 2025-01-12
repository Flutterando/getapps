import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:getapps/app/design_system/design_system.dart';
import 'package:localization/localization.dart';
import 'package:uicons/uicons.dart';

class InputUrl extends StatelessWidget {
  const InputUrl({super.key, required this.onChanged});

  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'github-link'.i18n(),
          style: context.textTheme.labelMedium?.copyWith(
            fontWeight: FontWeight.w700,
          ),
        ),
        const Gap(4),
        TextFormField(
          onChanged: onChanged,
          decoration: InputDecoration(
            hintText: 'search-by-name'.i18n(),
            suffixIcon: Icon(UIcons.regularRounded.link),
          ),
        ),
      ],
    );
  }
}
