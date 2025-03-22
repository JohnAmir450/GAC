import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gac/core/helper_functions/cache_helper.dart';
import 'package:gac/core/utils/chache_helper_keys.dart';

class LanguageCubit extends Cubit<Locale> {
  LanguageCubit() : super(const Locale('ar')) {
    _loadSavedLanguage();
  }

  void _loadSavedLanguage() {
    String? savedLocale = CacheHelper.getData(key: kAppLanguageKey);
    if (savedLocale != null) {
      emit(Locale(savedLocale));
    }
  }

  void toggleLanguage() {
    Locale newLocale = state.languageCode == 'ar' ? const Locale('en') : const Locale('ar');
    CacheHelper.saveData(key: kAppLanguageKey, value: newLocale.languageCode);
    emit(newLocale);
  }

    Locale getCurrentLocale() {
    return state;
  }
}
