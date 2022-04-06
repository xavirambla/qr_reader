


import 'app_localizations.dart';

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get language => 'Français';

  @override
  String get languageTitle => 'Langue';

  @override
  String get appTitle => 'QR-Reader';

  @override
  String get abrirPersonalizacion => 'Ouvrir la personnalisation';

  @override
  String get settingsTitle => 'Personnalisation';

  @override
  String get darkmode => 'Mode sombre';

  @override
  String get homeTitle => 'Disque';

  @override
  String get helpTitle => 'Aider';

  @override
  String get aboutTitle => 'À propos de';

  @override
  String get version => 'Version';

  @override
  String get buildNumber => 'Numéro de Construction';

  @override
  String get author => '@ 2021-2022 Xavi Rambla';

  @override
  String get copyright => 'Tous droits réservés';

  @override
  String get mapTitle => 'Carte';

  @override
  String get addressTitle => 'Adresses';

  @override
  String get deleteAll => 'Tout effacer';

  @override
  String get help_description_1 => 'Lecteur QRS pour obtenir des URL ou des coordonnées de positionnement.';

  @override
  String get help_description_2 => 'Le menu inférieur a le bouton de numérisation et comprend deux boutons pour visiter l\'historique des cartes ou des adresses.';

  @override
  String get help_description_3 => 'Toutes les lectures seront stockées dans une base de données interne au sein du mobile pour être consultées';

  @override
  String get help_description_4 => 'Il est possible, la suppression individuelle d\'une lecture ou la suppression de toutes les lectures en cliquant sur le bouton correspondant.';

  @override
  String get help_title_5 => 'Pas de partage de données';

  @override
  String get help_description_5 => 'Les lectures effectuées ne seront PAS transmises sur Internet, rendant impossible l\'utilisation desdites informations par des tiers.';
}
