import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tourista/core/translations/locale_keys.g.dart';
import 'package:tourista/core/utlis/styles.dart';
import 'package:tourista/features/auth/forget_password/presentation/views/widgets/enter_number_text_field.dart';

class EnterNumberColumn extends StatelessWidget {
  const EnterNumberColumn({
    super.key,
    required this.textEditingController,
  });
  final TextEditingController textEditingController;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            LocaleKeys.enter_your_mobile_number.tr(),
            style: AppStyles.styleInterMedium16(context)
                .copyWith(color: Colors.black.withOpacity(.6)),
          ),
        ),
        IntrinsicWidth(
          child: EnterNumberTextField(
            textEditingController: textEditingController,
          ),
        )
      ],
    );
  }
}
