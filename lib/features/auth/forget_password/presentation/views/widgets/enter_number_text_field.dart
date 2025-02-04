import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tourista/core/utlis/app_assets.dart';
import 'package:tourista/core/widgets/custom_text_form_field.dart';

class EnterNumberTextField extends StatelessWidget {
  const EnterNumberTextField({
    super.key,
    required this.textEditingController,
  });
  final TextEditingController textEditingController;
  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
        controller: textEditingController,
        keyboardType: TextInputType.phone,
        onChanged: (p0) {},
        icon: Padding(
          padding: const EdgeInsets.all(16),
          child: SvgPicture.asset(Assets.imagesIconsPhone),
        ),
        hintText: "+963 . . . . . . . . .",
        color: Colors.white);
  }
}
