import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_i/config/routes/app_routes.dart';
import 'package:task_i/core/utilities/colors.dart';
import 'package:task_i/core/widgets/custom_botton.dart';
import 'package:task_i/features/Auth/data/models/user_model.dart';
import 'package:task_i/features/Auth/presentation/cubit/auth_cubit.dart';
import 'package:task_i/features/Auth/presentation/widgets/add_name_form.dart';
import 'package:task_i/features/Auth/presentation/widgets/add_phone_form.dart';
import 'package:task_i/features/Auth/presentation/widgets/otp_success.dart';
import 'package:task_i/features/Auth/presentation/widgets/select_profile_picture.dart';
import 'package:task_i/features/Auth/presentation/widgets/verification_screen.dart';

import '../widgets/auth_header.dart';

class AddPhoneScreen extends StatelessWidget {
  const AddPhoneScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                AuthHeader(size: size),
                SizedBox(height: size.height * 0.03),
                BlocBuilder<AuthCubit, AuthState>(
                  builder: (context, state) {
                    if (state is ChangeStepState) {
                      return Text(
                        'STEP ${state.currentStep}/4',
                        style: TextStyle(
                            fontFamily: 'ITC Avant Garde Gothic',
                            fontSize: 18,
                            color: AppColors.primary),
                      );
                    }
                    return Text(
                      'STEP 1/4',
                      style: TextStyle(
                          fontFamily: 'ITC Avant Garde Gothic',
                          fontSize: 18,
                          color: AppColors.primary),
                    );
                  },
                ),
                const SizedBox(height: 15),
                BlocBuilder<AuthCubit, AuthState>(
                  builder: (context, state) {
                    if (state is ChangeStepState) {
                      if (state.hulfStep == 2) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Verification your number',
                              style: TextStyle(
                                  fontFamily: 'ITC Avant Garde Gothic',
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'We have send the verification code\nto ${AuthCubit.get(context).phoneController.text.replaceRange(3, 8, '*****')} Change?',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontFamily: 'ITC Avant Garde Gothic',
                                  fontSize: 14,
                                  color: AppColors.grey),
                            ),
                          ],
                        );
                      }
                    }
                    return BlocBuilder<AuthCubit, AuthState>(
                      builder: (context, state) {
                        return Column(
                          children: [
                            Text(
                              AuthCubit.get(context).hulfStep == 2.5
                                  ? 'Profile picture'
                                  : 'Your phone number',
                              style: TextStyle(
                                  fontFamily: 'ITC Avant Garde Gothic',
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              AuthCubit.get(context).hulfStep == 2.5
                                  ? ''
                                  : 'Enter your details to login to account',
                              style: TextStyle(
                                  fontFamily: 'ITC Avant Garde Gothic',
                                  fontSize: 16,
                                  color: AppColors.grey),
                            ),
                          ],
                        );
                      },
                    );
                  },
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          BlocBuilder<AuthCubit, AuthState>(
                            builder: (context, state) {
                              if (state is ChangeStepState) {
                                return Text(
                                  state.hulfStep == 1.5
                                      ? 'Your name'
                                      : state.hulfStep == 2.0
                                          ? 'Verification Code'
                                          : state.hulfStep == 2.5
                                              ? ''
                                              : 'Your number',
                                  style: TextStyle(
                                    fontFamily: 'ITC Avant Garde Gothic',
                                    fontSize: 14,
                                    color: Colors.black,
                                  ),
                                );
                              }
                              return Text(
                                'Your number',
                                style: TextStyle(
                                  fontFamily: 'ITC Avant Garde Gothic',
                                  fontSize: 14,
                                  color: Colors.black,
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      BlocBuilder<AuthCubit, AuthState>(
                        builder: (context, state) {
                          if (state is ChangeStepState) {
                            if (state.hulfStep == 1.0 &&
                                state.currentStep == 1) {
                              return const AddPhoneForm();
                            }
                            if (state.hulfStep == 1.5) {
                              return const AddNameForm();
                            }
                            if (state.hulfStep == 2.0) {
                              return const VerificationScreen();
                            }
                            if (state.hulfStep == 2.5) {
                              return const SelectProfilePicture();
                            }
                          }
                          return CircularProgressIndicator(
                              color: AppColors.primary);
                        },
                      ),
                      const SizedBox(height: 50),
                      CustomButtom(
                        title: AuthCubit.get(context).hulfStep == 2.5
                            ? 'Continue'
                            : 'Next',
                        onPressed: () {
                          if (AuthCubit.get(context).hulfStep == 2.0) {
                            AuthCubit.get(context)
                                .sendVerificationCode(context);
                            // return OtpSuccess();
                          } else if (AuthCubit.get(context).hulfStep == 1.5) {
                            AuthCubit.get(context).registerUser();
                          } else {}
                          if (AuthCubit.get(context).hulfStep == 1.0) {
                            AuthCubit.get(context).changeStepToForward();
                          }
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 100),
              ],
            ),
          ),
          BlocBuilder<AuthCubit, AuthState>(
            builder: (context, state) {
              if (state is OtpSuccessLoadingState) {
                return OtpSuccess();
              }
              // if (state is OtpSuccessLoadedState) {
              //   Navigator.pushReplacement(
              //       context,
              //       MaterialPageRoute(
              //           builder: (context) => OnboardingScreen()));
              // }

              return const SizedBox.shrink();
            },
          ),
        ],
      ),
    );
  }
}
