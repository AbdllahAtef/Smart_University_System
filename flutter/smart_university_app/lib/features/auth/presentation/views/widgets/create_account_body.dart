import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_university_app/features/auth/presentation/helpers/create_accout_helper.dart';
import 'package:smart_university_app/features/auth/presentation/manager/create_account_provider.dart';
import 'package:smart_university_app/core/styles/app_styles.dart';
import 'package:smart_university_app/features/auth/presentation/views/widgets/create_account_form_section.dart';
import 'package:smart_university_app/features/auth/presentation/views/widgets/create_account_header.dart';
import 'package:smart_university_app/core/widgets/custom_elevated_button.dart';
import 'package:smart_university_app/features/auth/presentation/views/widgets/faculty_dropdown.dart';
import 'package:smart_university_app/features/auth/presentation/views/widgets/role_section.dart';

class CreateAccountBody extends ConsumerStatefulWidget {
  const CreateAccountBody({super.key});

  @override
  ConsumerState<CreateAccountBody> createState() => _CreateAccountBodyState();
}

class _CreateAccountBodyState extends ConsumerState<CreateAccountBody> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(createAccountProvider);

    final notifier = ref.read(createAccountProvider.notifier);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CreateAccountHeader(),

                SizedBox(height: 40.h),

                const CreateAccountForm(),

                SizedBox(height: 30.h),
                const RoleSection(),

                const SizedBox(height: 30),

                FacultyDropdown(
                  selectedFaculty: state.faculty,
                  onChanged: (value) {
                    notifier.changeFaculty(value);
                  },
                ),

                SizedBox(height: 50.h),

                CustomElevatedButton(
                  onPressed: state.isLoading
                      ? null
                      : () => submitCreateAccount(
                          context: context,
                          ref: ref,
                          formKey: _formKey,
                        ),
                  text: '',
                  child: state.isLoading
                      ? const SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(
                            color: Colors.white,
                            strokeWidth: 2,
                          ),
                        )
                      : Text("Continue", style: TextStyles.textstyle18),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
