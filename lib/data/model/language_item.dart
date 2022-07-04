import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class LanguageItem extends Equatable {
  final String languageLocaleKey;
  final String flag;
  final String? description;
  final Locale locale;

  LanguageItem({
    required this.flag,
    required this.languageLocaleKey,
    required this.locale,
    this.description,
  });

  @override
  List<Object?> get props => [
        languageLocaleKey,
        locale,
      ];
}
