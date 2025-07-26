import 'package:flutter/material.dart';
import 'package:flutter_gsmpay_interview/core/di/base/di_setup.dart';
import 'package:flutter_gsmpay_interview/core/uikit/box_partition_with_header.dart';
import 'package:flutter_gsmpay_interview/core/uikit/button_widget.dart';
import 'package:flutter_gsmpay_interview/core/uikit/image_picker_box_widget.dart';
import 'package:flutter_gsmpay_interview/core/uikit/scaffold_body_root_widget.dart';
import 'package:flutter_gsmpay_interview/core/uikit/scaffold_bottom_navigator_bar_root_widget.dart';
import 'package:flutter_gsmpay_interview/core/uikit/text_form_field_widget.dart';
import 'package:flutter_gsmpay_interview/core/uikit/toast.dart';
import 'package:flutter_gsmpay_interview/features/home/domain/entity/submit_info_request_entity.dart';
import 'package:flutter_gsmpay_interview/features/home/presentation/manager/form_validator/home_form_validator_cubit.dart';
import 'package:flutter_gsmpay_interview/features/home/presentation/manager/submit_info/home_submit_info_cubit.dart';
import 'package:flutter_gsmpay_interview/features/home/presentation/manager/upload_birth_certificate_image/upload_birth_certificate_image_cubit.dart';
import 'package:flutter_gsmpay_interview/features/home/presentation/manager/upload_national_id_image/upload_national_id_image_cubit.dart';
import 'package:flutter_gsmpay_interview/generated/l10n.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _fullNameController = TextEditingController();
  final _nationalCodeController = TextEditingController();
  final _monthlySalaryController = TextEditingController();
  int? _nationalIdImageId;
  XFile? _nationalIdImage;
  int? _birthCertificatedImageId;
  XFile? _birthCertificatedImage;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt<HomeFormValidatorCubit>()),
        BlocProvider(create: (context) => getIt<UploadNationalIdImageCubit>()),
        BlocProvider(create: (context) => getIt<UploadBirthCertificateImageCubit>()),
        BlocProvider(create: (context) => getIt<HomeSubmitInfoCubit>()),
      ],
      child: MultiBlocListener(
        listeners: [
          BlocListener<UploadNationalIdImageCubit, UploadNationalIdImageState>(
            listener: (context, state) {
              state.whenOrNull(
                success: (imageId) {
                  _nationalIdImageId = imageId;
                  context.read<HomeFormValidatorCubit>().validateNationalIdImageId(
                    imageId,
                  );
                },
              );
            },
          ),
          BlocListener<
            UploadBirthCertificateImageCubit,
            UploadBirthCertificateImageState
          >(
            listener: (context, state) {
              state.whenOrNull(
                success: (imageId) {
                  _birthCertificatedImageId = imageId;
                  context
                      .read<HomeFormValidatorCubit>()
                      .validateBirthCertificateImageId(imageId);
                },
              );
            },
          ),
          BlocListener<HomeSubmitInfoCubit, HomeSubmitInfoState>(
            listener: (context, state) {
              state.whenOrNull(
                success: (record) {
                  showSuccessToast(context, record);
                },
              );
            },
          ),
        ],
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
                              const SizedBox(height: 20),
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
                                      .validateNationalCode(value ?? '');
                                },
                              ),
                              const SizedBox(height: 20),
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
                        const SizedBox(height: 30),
                        BoxPartitionWithHeader(
                          title: S.of(context).your_document,
                          child: Row(
                            children: [
                              Expanded(
                                child: BlocBuilder<
                                  UploadNationalIdImageCubit,
                                  UploadNationalIdImageState
                                >(
                                  builder: (context, state) {
                                    return ImagePickerBoxWidget(
                                      label: S.of(context).national_id_card,
                                      isLoading:
                                          state.whenOrNull(loading: () => true) ??
                                          false,
                                      selectedImage: _nationalIdImage,
                                      onPick: (value) {
                                        _nationalIdImage = value;
                                        context
                                            .read<UploadNationalIdImageCubit>()
                                            .upload(value);
                                      },
                                      onDelete: () {
                                        _nationalIdImageId = null;
                                        _nationalIdImage = null;
                                      },
                                      required: true,
                                    );
                                  },
                                ),
                              ),
                              const SizedBox(width: 15),
                              Expanded(
                                child: BlocBuilder<
                                  UploadBirthCertificateImageCubit,
                                  UploadBirthCertificateImageState
                                >(
                                  builder: (context, state) {
                                    return ImagePickerBoxWidget(
                                      label: S.of(context).national_id_card,
                                      isLoading:
                                          state.whenOrNull(loading: () => true) ??
                                          false,
                                      selectedImage: _birthCertificatedImage,
                                      onPick: (value) {
                                        _birthCertificatedImage = value;
                                        context
                                            .read<UploadBirthCertificateImageCubit>()
                                            .upload(value);
                                      },
                                      onDelete: () {
                                        _birthCertificatedImageId = null;
                                        _birthCertificatedImage = null;
                                      },
                                      required: true,
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                bottomNavigationBar: ScaffoldBottomNavigatorBarRootWidget(
                  child: Row(
                    children: [
                      Expanded(
                        child: BlocBuilder<
                          HomeFormValidatorCubit,
                          HomeFormValidatorState
                        >(
                          builder: (context, state) {
                            return state.whenOrNull(
                                  invalid: () {
                                    return ButtonWidget(
                                      title: S.of(context).final_submit,
                                      buttonType: ButtonType.filled,
                                    );
                                  },
                                ) ??
                                BlocBuilder<
                                  HomeSubmitInfoCubit,
                                  HomeSubmitInfoState
                                >(
                                  builder: (context, state) {
                                    return state.whenOrNull(
                                          loading: () {
                                            return ButtonWidget(
                                              title: S.of(context).final_submit,
                                              buttonType: ButtonType.filled,
                                              isLoading: true,
                                            );
                                          },
                                        ) ??
                                        ButtonWidget(
                                          title: S.of(context).final_submit,
                                          buttonType: ButtonType.filled,
                                          icon: const Icon(Icons.done),
                                          onPressed: () {
                                            context
                                                .read<HomeSubmitInfoCubit>()
                                                .submit(
                                                  SubmitInfoRequestEntity(
                                                    name: _fullNameController.text,
                                                    nationalCode:
                                                        _nationalCodeController.text,
                                                    salary:
                                                        int.tryParse(
                                                          _monthlySalaryController
                                                              .text
                                                              .replaceAll(',', ''),
                                                        ) ??
                                                        0,
                                                    nationalCardImageId:
                                                        _nationalIdImageId
                                                            .toString(),
                                                    birthCertificateImageId:
                                                        _birthCertificatedImageId
                                                            .toString(),
                                                  ),
                                                );
                                          },
                                        );
                                  },
                                );
                          },
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
