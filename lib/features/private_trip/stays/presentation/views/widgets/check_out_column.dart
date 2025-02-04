import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourista/constants.dart';
import 'package:tourista/core/translations/locale_keys.g.dart';
import 'package:tourista/core/utlis/styles.dart';
import 'package:tourista/features/private_trip/stays/presentation/manager/hotel_info_cubit/hotel_info_cubit.dart';

class CheckOutColumn extends StatelessWidget {
  const CheckOutColumn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<HotelInfoCubit>();
    return GestureDetector(
      onTap: () async {
        var value = await showCalendarDatePicker2Dialog(
          context: context,
          config: CalendarDatePicker2WithActionButtonsConfig(
            calendarType: CalendarDatePicker2Type.single,
          ),
          dialogSize: const Size(325, 400),
          value: [],
          borderRadius: BorderRadius.circular(15),
        );
        cubit.setCheckOut(value?[0] ?? DateTime.now());
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            LocaleKeys.checkOut.tr(),
            style: AppStyles.styleInterMedium18(context),
          ),
          BlocBuilder<HotelInfoCubit, HotelInfoState>(
            builder: (context, state) {
              return Text(
                state.checkOut == null
                    ? 'Select date'
                    : '${state.checkOut}'.substring(0, 10),
                style: AppStyles.styleInterSemiBold18(context)
                    .copyWith(color: kPrimaryColor),
              );
            },
          ),
        ],
      ),
    );
  }
}
