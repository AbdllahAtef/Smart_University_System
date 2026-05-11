import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_university_app/core/utils/validator.dart';
import 'package:smart_university_app/core/widgets/custom_text_form_field.dart';
import 'package:smart_university_app/features/auth/presentation/manager/create_account_provider.dart';

class CreateAccountForm extends ConsumerWidget {
  const CreateAccountForm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(createAccountProvider);

    final notifier = ref.read(createAccountProvider.notifier);

    return Column(
      children: [
        CustomTextFormField(
          isPassword: false,
          hint: 'UserName',
          onChanged: notifier.updateName,
          validator: (value) => Validators.required(value, 'Username'),
        ),

        SizedBox(height: 15.h),

        CustomTextFormField(
          isPassword: false,
          hint: 'Email',
          onChanged: notifier.updateEmail,
          validator: (value) => Validators.email(value),
        ),

        SizedBox(height: 15.h),

        CustomTextFormField(
          isPassword: false,
          hint: 'Id',
          isID: true,
          onChanged: notifier.updateNationalId,
          validator: (value) => Validators.nationalId(value),
        ),

        SizedBox(height: 15.h),

        CustomTextFormField(
          isPassword: true,
          hint: 'Password',
          onChanged: notifier.updatePassword,
          validator: (value) => Validators.password(value),
        ),

        SizedBox(height: 15.h),

        CustomTextFormField(
          isPassword: true,
          hint: 'Retype Password',
          validator: (value) =>
              Validators.confirmPassword(value, state.password),
          onChanged: notifier.updateConfirmPassword,
        ),
      ],
    );
  }
}
