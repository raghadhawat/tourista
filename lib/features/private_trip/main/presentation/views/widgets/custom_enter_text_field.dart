import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tourista/constants.dart';
import 'package:tourista/core/utlis/styles.dart';

class CustomEnterTextField extends StatelessWidget {
  const CustomEnterTextField({
    super.key,
    required this.label,
    required this.onChanged,
  });
  final String label;
  final void Function(String) onChanged;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      cursorColor: Colors.black,
      decoration: InputDecoration(
          labelText: label,
          labelStyle: AppStyles.styleInterMedium18(context)
              .copyWith(color: Colors.grey),
          prefixIcon: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => GoRouter.of(context).pop(),
          ),
          disabledBorder: outlinedInputBorder(),
          focusedBorder: outlinedInputBorder(),
          enabledBorder: outlinedInputBorder(),
          border: outlinedInputBorder()),
    );
  }

  OutlineInputBorder outlinedInputBorder() {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: kYellowColor, width: 2.5));
  }
}
