import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gac/core/cubits/language/language_cubit.dart';
import 'package:gac/core/utils/app_colors.dart';

class LanguageSwitcherTile extends StatelessWidget {
   final VoidCallback navigateToHomeScreen;
  const LanguageSwitcherTile({
    super.key, required this.navigateToHomeScreen,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LanguageCubit, Locale>(
      builder: (context, locale) {
        return ListTile(
          contentPadding: EdgeInsets.zero,
          leading: const Icon(Icons.language, color: AppColors.primaryColor),
          title: Text(
            context.read<LanguageCubit>().getCurrentLocale().languageCode ==
                    'ar'
                ? 'اللغة'
                : 'Language',
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          trailing: DropdownButton<Locale>(
            value: locale,
            underline: const SizedBox(),
            items: const [
              DropdownMenuItem(
                value: Locale('ar'),
                child: Text('العربية'),
              ),
              DropdownMenuItem(
                value: Locale('en'),
                child: Text('English'),
              ),
            ],
            onChanged: (newLocale) {
              if (newLocale != null) {
                context.read<LanguageCubit>().toggleLanguage();
                navigateToHomeScreen();
              }
            },
          ),
        );
      },
    );
  }
}
