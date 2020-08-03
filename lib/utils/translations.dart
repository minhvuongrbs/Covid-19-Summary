import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

class Translations {
  Translations(this.locale);
  Locale locale;
  static Map<dynamic, dynamic> _localizedValues;
  static String _trackingLanguage = 'en';

  String get trackingLanguage => _trackingLanguage;
  String get currentLanguage => locale.languageCode;

  static Translations of(BuildContext context) {
    return Localizations.of<Translations>(context, Translations);
  }

  static String text(String key, {Map args}) {
    String result = _localizedValues[key];
    if (args != null) {
      args.forEach((key, value) {
        result = result.replaceAll('{$key}', value);
      });
    }
    return result ?? '** $key not found';
  }

  static Future<Translations> load(Locale locale) async {
    final Translations translations = new Translations(locale);
    _trackingLanguage = translations.currentLanguage;
    final String jsonContent =
        await rootBundle.loadString('assets/langs/$_trackingLanguage.json');
    _localizedValues = json.decode(jsonContent);
    return translations;
  }
}

class TranslationsDelegate extends LocalizationsDelegate<Translations> {
  const TranslationsDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'vi'].contains(locale.languageCode);

  @override
  Future<Translations> load(Locale locale) => Translations.load(locale);

  @override
  bool shouldReload(TranslationsDelegate old) => false;
}
