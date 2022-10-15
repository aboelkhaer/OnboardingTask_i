import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:task_i/features/SignUp/presentation/cubit/auth_cubit.dart';
import 'package:task_i/features/SignUp/presentation/widgets/shared_form.dart';

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
