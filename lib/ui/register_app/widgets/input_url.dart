import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:getapps/utils/extensions/extensions.dart';
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
          'Url do Github',
          style: context.textTheme.labelMedium?.copyWith(
            fontWeight: FontWeight.w700,
          ),
        ),
        const Gap(4),
        TextFormField(
          onChanged: onChanged,
          decoration: InputDecoration(
            hintText: 'Busca por nome do app',
            suffixIcon: Icon(UIcons.regularRounded.link),
          ),
        ),
      ],
    );
  }
}
