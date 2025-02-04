import 'package:flutter/material.dart';
import 'package:tourista/core/utlis/styles.dart';

class CanceleTextColumn extends StatelessWidget {
  const CanceleTextColumn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<String> item = [
      'If the trip away more than 15 days, you will restore all your money.',
      'If the trip away between 5 to 15 days, you will lose 15% of your money.',
      'If the trip away less than 5 days, you will lose all your money.'
    ];
    return RichText(
      text: TextSpan(
        children: List.generate(
          item.length,
          (int index) => WidgetSpan(
            alignment: PlaceholderAlignment.middle,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.only(right: 8.0),
                  child: Text(
                    '${index + 1}.',
                    style: AppStyles.styleInterMedium19(context)
                        .copyWith(fontSize: 16),
                  ),
                ),
                Flexible(
                  child: Text(
                    item[index],
                    style: AppStyles.styleInterMedium19(context)
                        .copyWith(fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
