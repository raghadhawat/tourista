import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hive/hive.dart';
import 'package:tourista/constants.dart';
import 'package:tourista/core/translations/locale_keys.g.dart';
import 'package:tourista/core/utlis/app_assets.dart';
import 'package:tourista/core/utlis/functions/custom_success_snack_bar.dart';
import 'package:tourista/core/utlis/styles.dart';
import 'package:tourista/features/profile/presentation/manager/update_name_cubit/update_name_cubit.dart';

import '../../../../../core/utlis/functions/custom_snack_bar.dart';
import '../../../../../core/widgets/loading_widget.dart';

class EditNameRow extends StatefulWidget {
  const EditNameRow({
    super.key,
    required this.scereenWidth,
    this.username,
  });
  final double scereenWidth;
  final String? username;
  @override
  State<EditNameRow> createState() => _PersonalDetailsViewBodyState();
}

class _PersonalDetailsViewBodyState extends State<EditNameRow> {
  bool isEditing = false;
  late TextEditingController controller;

  late FocusNode focusNode;
  late String username = widget.username!;
  @override
  void initState() {
    super.initState();
    controller = TextEditingController(text: username);

    focusNode = FocusNode();
  }

  @override
  void dispose() {
    controller.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Expanded(
          child: isEditing
              ? TextField(
                  controller: controller,
                  focusNode: focusNode,
                  decoration: InputDecoration(
                    hintText: LocaleKeys.enter_new_name.tr(),
                    hintStyle: AppStyles.styleInterRegular18(context),
                    enabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: kPrimaryColor),
                    ),
                  ),
                  onSubmitted: (newValue) {
                    setState(() {
                      username = newValue;
                      isEditing = false;
                      FocusScope.of(context).unfocus();
                      BlocProvider.of<UpdateNameCubit>(context)
                          .updateName(name: username);
                    });
                  },
                )
              : Text(
                  username,
                  style: AppStyles.styleInterRegular18(context),
                ),
        ),
        BlocListener<UpdateNameCubit, UpdateNameState>(
          listener: (context, state) {
            if (state is UpdateNameSuccess) {
              customSuccessSnackBar(
                  context, LocaleKeys.Name_has_been_Edit_successfully.tr());
              Hive.box(kUserInfoBox).put(kUserNameRef, username);
            } else if (state is UpdateNameFailure) {
              customSnackBar(context, state.errMessage);
            }
          },
          child: BlocBuilder<UpdateNameCubit, UpdateNameState>(
            builder: (context, state) {
              return state is UpdateNameLoading
                  ? const LoadingWidget()
                  : TextButton(
                      onPressed: () {
                        setState(() {
                          if (isEditing) {
                            username = controller.text;
                            isEditing = false;
                            FocusScope.of(context).unfocus();
                            BlocProvider.of<UpdateNameCubit>(context)
                                .updateName(name: username);
                          } else {
                            isEditing = true;
                            focusNode.requestFocus(); // Show the keyboard
                          }
                        });
                      },
                      child: isEditing
                          ? const Icon(Icons.check)
                          : SvgPicture.asset(Assets.imagesIconsPenEditIcon),
                    );
            },
          ),
        ),
      ],
    );
  }
}
