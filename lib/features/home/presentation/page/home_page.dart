import 'package:flutter/material.dart';
import 'package:flutter_gsmpay_interview/core/di/base/di_setup.dart';
import 'package:flutter_gsmpay_interview/core/uikit/box_partition_with_header.dart';
import 'package:flutter_gsmpay_interview/core/uikit/scaffold_body_root_widget.dart';
import 'package:flutter_gsmpay_interview/core/uikit/text_form_field_widget.dart';
import 'package:flutter_gsmpay_interview/features/home/presentation/manager/form_validator/home_form_validator_cubit.dart';
import 'package:flutter_gsmpay_interview/generated/l10n.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _fullNameController = TextEditingController();
  final _nationalCodeController = TextEditingController();
  final _monthlySalaryController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<HomeFormValidatorCubit>(),
      child: Builder(
        builder:
            (context) => Scaffold(
              appBar: AppBar(title: Text(S.of(context).hire_you)),
              body: ScaffoldBodyRootWidget(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      BoxPartitionWithHeader(
                        title: S.of(context).your_info,
                        child: Column(
                          children: [
                            TextFormFieldWidget(
                              label: S.of(context).full_name,
                              controller: _fullNameController,
                              textInputAction: TextInputAction.next,
                              required: true,
                              autovalidateMode: AutovalidateMode.onUserInteraction,
                              validator: (value) {
                                return context
                                    .read<HomeFormValidatorCubit>()
                                    .validateFullName(value ?? '');
                              },
                            ),
                            SizedBox(height: 20),
                            TextFormFieldWidget(
                              label: S.of(context).national_code,
                              controller: _nationalCodeController,
                              textInputAction: TextInputAction.next,
                              textFormFieldType: TextFormFieldType.nationalCode,
                              required: true,
                              autovalidateMode: AutovalidateMode.onUserInteraction,
                              validator: (value) {
                                return context
                                    .read<HomeFormValidatorCubit>()
                                    .validateFullName(value ?? '');
                              },
                            ),
                            SizedBox(height: 20),
                            TextFormFieldWidget(
                              label: S.of(context).monthly_salary,
                              controller: _monthlySalaryController,
                              textInputAction: TextInputAction.done,
                              textFormFieldType: TextFormFieldType.price,
                              onFieldSubmitted: (value) {
                                FocusScope.of(context).unfocus();
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
      ),
    );
  }
}
