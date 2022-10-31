import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_i/app.dart';
import 'package:task_i/app_bloc_observer.dart';
import 'injection.dart' as injector;

void main() async {
  Bloc.observer = AppBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  await injector.init();
  runApp(const MyApp());
}
