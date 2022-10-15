import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:task_i/core/utilities/colors.dart';
import 'package:task_i/features/SignUp/presentation/cubit/auth_cubit.dart';

class AuthHeader extends StatelessWidget {
  const AuthHeader({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Stack(
        children: [
          BlocBuilder<AuthCubit, AuthState>(
            builder: (context, state) {
              if (state is ChangeStepState) {
                return Positioned(
                  left: 0,
                  right: 0,
                  top: 20,
                  bottom: 0,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: LinearPercentIndicator(
                      alignment: MainAxisAlignment.center,
                      width: size.width / 2,
                      animation: true,
                      lineHeight: 8.0,
                      animationDuration: 400,
                      percent: state.currentStep / 4,
                      barRadius: const Radius.circular(16),
                      progressColor: AppColors.primary,
                      backgroundColor: const Color(0xFF8CC540).withOpacity(0.3),
                    ),
                  ),
                );
              }
              return Positioned(
                left: 0,
                right: 0,
                top: 20,
                bottom: 0,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: LinearPercentIndicator(
                    alignment: MainAxisAlignment.center,
                    width: size.width / 2,
                    animation: true,
                    lineHeight: 8.0,
                    animationDuration: 400,
                    percent: 1 / 4,
                    barRadius: const Radius.circular(16),
                    progressColor: AppColors.primary,
                    backgroundColor: const Color(0xFF8CC540).withOpacity(0.3),
                  ),
                ),
              );
            },
          ),
          Positioned(
            left: 10,
            top: 20,
            bottom: 0,
            child: BlocBuilder<AuthCubit, AuthState>(
              builder: (context, state) {
                return IconButton(
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    size: 18,
                  ),
                  onPressed: () {
                    AuthCubit.get(context).changStepToBack();
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
