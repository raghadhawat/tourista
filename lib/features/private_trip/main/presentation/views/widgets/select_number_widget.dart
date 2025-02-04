import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:tourista/constants.dart';
import 'package:tourista/core/utlis/styles.dart';

class SelectNumberWidget extends StatefulWidget {
  final ValueChanged<int> onNumberChanged;

  const SelectNumberWidget({Key? key, required this.onNumberChanged})
      : super(key: key);

  @override
  State<SelectNumberWidget> createState() => _SelectNumberWidgetState();
}

class _SelectNumberWidgetState extends State<SelectNumberWidget> {
  int selectedNumber = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black.withOpacity(.4), width: 1.5),
          borderRadius: BorderRadius.circular(4)),
      child: Padding(
        padding: const EdgeInsets.all(6),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconButton(
                onPressed: () {
                  if (selectedNumber > 0) {
                    setState(() {
                      selectedNumber--;
                      widget.onNumberChanged(selectedNumber);
                    });
                  }
                },
                icon: const Icon(
                  Icons.remove,
                  color: kPrimaryColor,
                )),
            const Gap(5),
            Text(
              '$selectedNumber',
              style: AppStyles.styleInterBold25(context),
            ),
            const Gap(5),
            IconButton(
                onPressed: () {
                  setState(() {
                    selectedNumber++;
                    widget.onNumberChanged(selectedNumber);
                  });
                },
                icon: const Icon(
                  Icons.add,
                  color: kPrimaryColor,
                )),
          ],
        ),
      ),
    );
  }
}
