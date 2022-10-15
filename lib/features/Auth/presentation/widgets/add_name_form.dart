import 'package:flutter/cupertino.dart';

import 'package:task_i/features/Auth/presentation/cubit/auth_cubit.dart';
import 'package:task_i/features/Auth/presentation/widgets/shared_form.dart';

class AddNameForm extends StatelessWidget {
  const AddNameForm({super.key});

  @override
  Widget build(BuildContext context) {
    return SharedForm(
      formKey: AuthCubit.get(context).formKey,
      textFieldController: AuthCubit.get(context).nameController,
      textInputType: TextInputType.text,
      title: 'Please enter your name',
    );
  }
}
