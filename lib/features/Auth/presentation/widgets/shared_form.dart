import 'package:flutter/material.dart';
import 'package:task_i/core/widgets/custom_text_form_field.dart';

class SharedForm extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController textFieldController;
  final TextInputType textInputType;
  final Widget? prefix;
  final String title;

  const SharedForm({
    super.key,
    required this.formKey,
    required this.textFieldController,
    required this.textInputType,
    this.prefix,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: CustomTextFormField(
        controller: textFieldController,
        title: title,
        validateMsg: 'Enter your data 8 char at least, please',
        textInputType: textInputType,
        prefix: prefix,
      ),
    );
  }
}
