import 'package:business_tracker/config/theme/bloc/theme_event.dart';
import 'package:business_tracker/config/theme/bloc/theme_state.dart';
import 'package:business_tracker/config/theme/light_theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../purple_theme.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeState(lightTheme)) {
    on<ThemeChanged>((event, emit) {
      emit(ThemeState(event.theme));
    });
  }

  // @override
  // Stream<ThemeState> mapEventToState(ThemeEvent event) async* {
  //   if (event is ThemeChanged) {
  //     yield ThemeState(event.theme);
  //   }
  // }
}
