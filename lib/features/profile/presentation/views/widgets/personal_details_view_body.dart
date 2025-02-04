import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hive/hive.dart';
import 'package:tourista/constants.dart';
import 'package:tourista/core/translations/locale_keys.g.dart';
import 'package:tourista/core/utlis/styles.dart';
import 'package:tourista/features/profile/presentation/views/widgets/edit_name_row.dart';

import 'edit_phone_row.dart';

class PersonalDetailsViewBody extends StatelessWidget {
  const PersonalDetailsViewBody({super.key, required this.scereenWidth});
  final double scereenWidth;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Gap(10),
        Text(
          LocaleKeys.full_name.tr(),
          style: AppStyles.styleInterBold20(context),
        ),
        const Gap(20),
        EditNameRow(
          scereenWidth: scereenWidth,
          username: Hive.box(kUserInfoBox).get(kUserNameRef),
        ),
        const Gap(20),
        Hive.box(kUserInfoBox).get(kUserPhoneRef) != null
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    LocaleKeys.phone_number.tr(),
                    style: AppStyles.styleInterBold20(context),
                  ),
                  const Gap(20),
                  EditPhoneRow(
                      scereenWidth: scereenWidth,
                      userPhone: Hive.box(kUserInfoBox).get(kUserPhoneRef))
                ],
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    LocaleKeys.email.tr(),
                    style: AppStyles.styleInterBold20(context),
                  ),
                  const Gap(20),
                  Text(Hive.box(kUserInfoBox).get(kUserEmailRef))
                ],
              ),
      ],
    );
  }
}
