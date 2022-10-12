import 'package:country_phone_code_picker/country_phone_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:task_i/core/utilities/colors.dart';
import 'package:task_i/core/widgets/custom_botton.dart';
import 'package:task_i/core/widgets/custom_text_form_field.dart';
import 'package:task_i/features/SignUp/presentation/cubit/addphone_cubit.dart';

class AddPhoneScreen extends StatelessWidget {
  const AddPhoneScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 100,
              child: Stack(
                children: [
                  Positioned(
                    left: 10,
                    top: 20,
                    bottom: 0,
                    child: IconButton(
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        size: 18,
                      ),
                      onPressed: () {},
                    ),
                  ),
                  Positioned(
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
                        backgroundColor:
                            const Color(0xFF8CC540).withOpacity(0.3),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: size.height * 0.03),
            Text(
              'STEP 1/4',
              style: TextStyle(
                fontFamily: 'ITC Avant Garde Gothic',
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 15),
            Text(
              'Your phone number',
              style: TextStyle(
                  fontFamily: 'ITC Avant Garde Gothic',
                  fontSize: 32,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              'Enter your details to login to account',
              style: TextStyle(
                  fontFamily: 'ITC Avant Garde Gothic',
                  fontSize: 16,
                  color: AppColors.grey),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Row(
                    children: const [
                      Text(
                        'Your number',
                        style: TextStyle(
                          fontFamily: 'ITC Avant Garde Gothic',
                          fontSize: 14,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Form(
                    child: CustomTextFormField(
                      controller: AddphoneCubit.get(context).phoneController,
                      title: '',
                      validateMsg: 'Enter your phone, please',
                      textInputType: TextInputType.phone,
                      prefix: CountryPhoneCodePicker.withDefaultSelectedCountry(
                        defaultCountryCode: Country(
                          name: 'Egypt',
                          countryCode: 'EG',
                          phoneCode: '+20',
                        ),
                        showPhoneCode: true,
                        width: 120,
                        contentPadding: const EdgeInsets.only(left: 10),
                        flagHeight: 25,
                        flagWidth: 25,
                        searchBarHintText: 'Search by name',
                        countryPhoneCodeTextStyle:
                            const TextStyle(fontSize: 16),
                        actionIcon: const Icon(
                          Icons.keyboard_arrow_down_rounded,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 50),
                  CustomButtom(
                    title: 'Next',
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            const SizedBox(height: 100),
          ],
        ),
      ),
    );
  }
}
