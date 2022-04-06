


import 'app_localizations.dart';

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get language => 'English';

  @override
  String get languageTitle => 'Language';

  @override
  String get appTitle => 'QR-Reader';

  @override
  String get abrirPersonalizacion => 'Open Settings';

  @override
  String get settingsTitle => 'Settings';

  @override
  String get darkmode => 'Dark Mode';

  @override
  String get homeTitle => 'History';

  @override
  String get helpTitle => 'Help';

  @override
  String get aboutTitle => 'About';

  @override
  String get version => 'Version';

  @override
  String get buildNumber => 'Build Number';

  @override
  String get author => '@ 2021-2022 Xavi Rambla';

  @override
  String get copyright => 'All Rights Reserved';

  @override
  String get mapTitle => 'Map';

  @override
  String get addressTitle => 'Address';

  @override
  String get deleteAll => 'Delete all';

  @override
  String get help_description_1 => 'QR reader to obtain URLs or GPS coordinates.';

  @override
  String get help_description_2 => 'The lower menu has the scan button and includes two buttons to visit the history of maps or addresses.';

  @override
  String get help_description_3 => 'All readings will be stored in an internal database within the mobile to be consulted';

  @override
  String get help_description_4 => 'It\'s possible, the individual deletion of a reading or the deletion of all readings by clicking the corresponding button.';

  @override
  String get help_title_5 => 'No data sharing';

  @override
  String get help_description_5 => 'The readings made will NOT be transmitted over the net, your information not share to third parties';
}
