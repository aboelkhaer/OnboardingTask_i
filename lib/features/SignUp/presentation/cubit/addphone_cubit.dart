import 'package:bloc/bloc.dart';
import 'package:country_phone_code_picker/country_phone_code_picker.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'addphone_state.dart';

class AddphoneCubit extends Cubit<AddphoneState> {
  static AddphoneCubit get(context) => BlocProvider.of<AddphoneCubit>(context);
  TextEditingController phoneController = TextEditingController();
  CountryController countryController = CountryController();
  AddphoneCubit() : super(AddphoneInitial());
}
