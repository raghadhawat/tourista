import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tourista/constants.dart';
import 'package:tourista/core/utlis/styles.dart';

class CancelTextWidget extends StatelessWidget {
  const CancelTextWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Spacer(),
        TextButton(
            onPressed: () => GoRouter.of(context).pop({"id": 0, "airport": ''}),
            child: Text(
              "Cancel",
              style: AppStyles.styleInterMedium18(context)
                  .copyWith(color: kPrimaryColor, fontSize: 18),
            ))
      ],
    );
  }
}
