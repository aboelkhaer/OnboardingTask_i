import 'dart:developer';
import 'package:country_list_pick/country_list_pick.dart';
import 'package:flutter/material.dart';
import 'package:task_i/features/Auth/presentation/cubit/auth_cubit.dart';
import 'package:task_i/features/Auth/presentation/widgets/shared_form.dart';

class AddPhoneForm extends StatelessWidget {
  const AddPhoneForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SharedForm(
      formKey: AuthCubit.get(context).formKey,
      textFieldController: AuthCubit.get(context).phoneController,
      title: '',
      textInputType: TextInputType.phone,
      prefix: CountryListPick(
        theme: CountryTheme(
          isShowTitle: false,
          initialSelection: '+20',
        ),
        initialSelection: '+20',
        onChanged: (CountryCode? code) {
          log(code!.code.toString());
        },
        useUiOverlay: true,
        useSafeArea: true,
      ),
    );
  }
}
