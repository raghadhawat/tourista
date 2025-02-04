import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tourista/core/translations/locale_keys.g.dart';
import 'package:tourista/core/utlis/styles.dart';
import 'package:tourista/features/private_trip/main/presentation/views/widgets/select_number_widget.dart';

class PersonNumberBottomSheet extends StatelessWidget {
  const PersonNumberBottomSheet({
    super.key,
    required this.onNumberChanged,
  });
  final ValueChanged<int> onNumberChanged;
  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 1.0,
      heightFactor: 0.2,
      child: Container(
        padding: EdgeInsets.all(16),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                LocaleKeys.enterPersonNumber.tr(),
                style: AppStyles.styleInterSemiBold18(context),
              ),
              Spacer(),
              SelectNumberWidget(
                onNumberChanged: onNumberChanged,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
