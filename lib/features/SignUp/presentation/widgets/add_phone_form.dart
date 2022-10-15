import 'package:country_phone_code_picker/core/country_phone_code_picker_widget.dart';
import 'package:country_phone_code_picker/models/country.dart';
import 'package:flutter/material.dart';
import 'package:task_i/core/widgets/custom_text_form_field.dart';
import 'package:task_i/features/SignUp/presentation/cubit/auth_cubit.dart';
import 'package:task_i/features/SignUp/presentation/widgets/shared_form.dart';

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
      prefix: CountryPhoneCodePicker.withDefaultSelectedCountry(
        defaultCountryCode: Country(
          name: 'Egypt',
          countryCode: 'EG',
          phoneCode: ' +20',
        ),
        showPhoneCode: true,
        width: 120,
        contentPadding: const EdgeInsets.only(left: 10, bottom: 5),
        flagHeight: 25,
        flagWidth: 25,
        searchBarHintText: 'Search by name',
        countryPhoneCodeTextStyle: const TextStyle(fontSize: 16),
        actionIcon: const Icon(
          Icons.keyboard_arrow_down_rounded,
        ),
      ),
    );
  }
}
