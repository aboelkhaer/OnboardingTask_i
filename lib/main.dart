import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_i/app.dart';
import 'package:task_i/app_bloc_observer.dart';

void main() {
  Bloc.observer = AppBlocObserver();
  runApp(const MyApp());
}
