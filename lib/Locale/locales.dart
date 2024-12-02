import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart' show SynchronousFuture;
import 'package:flutter/material.dart';

import 'Languages/arabic.dart';
import 'Languages/english.dart';
import 'Languages/french.dart';
import 'Languages/german.dart';
import 'Languages/indonesian.dart';
import 'Languages/italian.dart';
import 'Languages/portuguese.dart';
import 'Languages/romanian.dart';
import 'Languages/spanish.dart';
import 'Languages/swahili.dart';
import 'Languages/turkish.dart';

class AppLocalizations {
  final Locale locale;

  AppLocalizations(this.locale);

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static final Map<String, Map<String, String>> _localizedValues = {
    'en': english(),
    'ar': arabic(),
    'pt': portuguese(),
    'fr': french(),
    'id': indonesian(),
    'es': spanish(),
    'it': italian(),
    'tr': turkish(),
    'sw': swahili(),
    'ro': romanian(),
    'de': german(),
  };

  String get letsPlay {
    return _localizedValues[locale.languageCode]!['letsPlay'] ?? '';
  }

  String get phoneNumber {
    return _localizedValues[locale.languageCode]!['phoneNumber'] ?? '';
  }

  String get enterPhoneNumber {
    return _localizedValues[locale.languageCode]!['enterPhoneNumber'] ?? '';
  }

  String get skipLogin {
    return _localizedValues[locale.languageCode]!['skipLogin'] ?? '';
  }

  String get orContinueWith {
    return _localizedValues[locale.languageCode]!['orContinueWith'] ?? '';
  }

  String get facebook {
    return _localizedValues[locale.languageCode]!['facebook'] ?? '';
  }

  String get google {
    return _localizedValues[locale.languageCode]!['google'] ?? '';
  }

  String get register {
    return _localizedValues[locale.languageCode]!['register'] ?? '';
  }

  String get inLessThanAMinute {
    return _localizedValues[locale.languageCode]!['inLessThanAMinute'] ?? '';
  }

  String get fullName {
    return _localizedValues[locale.languageCode]!['fullName'] ?? '';
  }

  String get enterFullName {
    return _localizedValues[locale.languageCode]!['enterFullName'] ?? '';
  }

  String get emailAddress {
    return _localizedValues[locale.languageCode]!['emailAddress'] ?? '';
  }

  String get enterEmailAddress {
    return _localizedValues[locale.languageCode]!['enterEmailAddress'] ?? '';
  }

  String get birthdate {
    return _localizedValues[locale.languageCode]!['birthdate'] ?? '';
  }

  String get selectBirthdate {
    return _localizedValues[locale.languageCode]!['selectBirthdate'] ?? '';
  }

  String get wellSendVerificationCode {
    return _localizedValues[locale.languageCode]!['wellSendVerificationCode'] ??
        '';
  }

  String get verification {
    return _localizedValues[locale.languageCode]!['verification'] ?? '';
  }

  String get weveSentSixDigitCode {
    return _localizedValues[locale.languageCode]!['weveSentSixDigitCode'] ?? '';
  }

  String get enterCode {
    return _localizedValues[locale.languageCode]!['enterCode'] ?? '';
  }

  String get enterSixDigitCode {
    return _localizedValues[locale.languageCode]!['enterSixDigitCode'] ?? '';
  }

  String get cashTables {
    return _localizedValues[locale.languageCode]!['cashTables'] ?? '';
  }

  String get leaderboard {
    return _localizedValues[locale.languageCode]!['leaderboard'] ?? '';
  }

  String get seats {
    return _localizedValues[locale.languageCode]!['seats'] ?? '';
  }

  String get name {
    return _localizedValues[locale.languageCode]!['name'] ?? '';
  }

  String get rank {
    return _localizedValues[locale.languageCode]!['rank'] ?? '';
  }

  String get points {
    return _localizedValues[locale.languageCode]!['points'] ?? '';
  }

  String get winnings {
    return _localizedValues[locale.languageCode]!['winnings'] ?? '';
  }

  String get check {
    return _localizedValues[locale.languageCode]!['check'] ?? '';
  }

  String get fold {
    return _localizedValues[locale.languageCode]!['fold'] ?? '';
  }

  String get callAny {
    return _localizedValues[locale.languageCode]!['callAny'] ?? '';
  }

  String get menu {
    return _localizedValues[locale.languageCode]!['menu'] ?? '';
  }

  String get leaveTheTable {
    return _localizedValues[locale.languageCode]!['leaveTheTable'] ?? '';
  }

  String get addCash {
    return _localizedValues[locale.languageCode]!['addCash'] ?? '';
  }

  String get replay {
    return _localizedValues[locale.languageCode]!['replay'] ?? '';
  }

  String get lobby {
    return _localizedValues[locale.languageCode]!['lobby'] ?? '';
  }

  String get tableInformation {
    return _localizedValues[locale.languageCode]!['tableInformation'] ?? '';
  }

  String get tableName {
    return _localizedValues[locale.languageCode]!['tableName'] ?? '';
  }

  String get numberOfPlayers {
    return _localizedValues[locale.languageCode]!['numberOfPlayers'] ?? '';
  }

  String get minMaxBuyIn {
    return _localizedValues[locale.languageCode]!['minMaxBuyIn'] ?? '';
  }

  String get stakesSmallBig {
    return _localizedValues[locale.languageCode]!['stakesSmallBig'] ?? '';
  }

  String get settings {
    return _localizedValues[locale.languageCode]!['settings'] ?? '';
  }

  String get sound {
    return _localizedValues[locale.languageCode]!['sound'] ?? '';
  }

  String get tableShowWhenYourTurn {
    return _localizedValues[locale.languageCode]!['tableShowWhenYourTurn'] ??
        '';
  }

  String get wait {
    return _localizedValues[locale.languageCode]!['wait'] ?? '';
  }

  String get autoPostBlinds {
    return _localizedValues[locale.languageCode]!['autoPostBlinds'] ?? '';
  }

  String get autoMuckCards {
    return _localizedValues[locale.languageCode]!['autoMuckCards'] ?? '';
  }

  String get displayBetAmounts {
    return _localizedValues[locale.languageCode]!['displayBetAmounts'] ?? '';
  }

  String get vibration {
    return _localizedValues[locale.languageCode]!['vibration'] ?? '';
  }

  String get hand {
    return _localizedValues[locale.languageCode]!['hand'] ?? '';
  }

  String get whoWeAre {
    return _localizedValues[locale.languageCode]!['whoWeAre'] ?? '';
  }

  String get howWeStarted {
    return _localizedValues[locale.languageCode]!['howWeStarted'] ?? '';
  }

  String get howToPlay {
    return _localizedValues[locale.languageCode]!['howToPlay'] ?? '';
  }

  String get howToAddMoney {
    return _localizedValues[locale.languageCode]!['howToAddMoney'] ?? '';
  }

  String get howToSelectPlayer {
    return _localizedValues[locale.languageCode]!['howToSelectPlayer'] ?? '';
  }

  String get howToChangeProfilePicture {
    return _localizedValues[locale.languageCode]![
            'howToChangeProfilePicture'] ??
        '';
  }

  String get howToSendMoney {
    return _localizedValues[locale.languageCode]!['howToSendMoney'] ?? '';
  }

  String get howToShop {
    return _localizedValues[locale.languageCode]!['howToShop'] ?? '';
  }

  String get howToChangeLanguage {
    return _localizedValues[locale.languageCode]!['howToChangeLanguage'] ?? '';
  }

  String get canILogin {
    return _localizedValues[locale.languageCode]!['canILogin'] ?? '';
  }

  String get howToLogout {
    return _localizedValues[locale.languageCode]!['howToLogout'] ?? '';
  }

  String get faqs {
    return _localizedValues[locale.languageCode]!['faqs'] ?? '';
  }

  String get getYourAnswers {
    return _localizedValues[locale.languageCode]!['getYourAnswers'] ?? '';
  }

  String get youAreOnLevel {
    return _localizedValues[locale.languageCode]!['youAreOnLevel'] ?? '';
  }

  String get earnPointsToReach {
    return _localizedValues[locale.languageCode]!['earnPointsToReach'] ?? '';
  }

  String get howItWorks {
    return _localizedValues[locale.languageCode]!['howItWorks'] ?? '';
  }

  String get youllGetPoints {
    return _localizedValues[locale.languageCode]!['youllGetPoints'] ?? '';
  }

  String get joinedMatch {
    return _localizedValues[locale.languageCode]!['joinedMatch'] ?? '';
  }

  String get ifYouJoinedAndWon {
    return _localizedValues[locale.languageCode]!['ifYouJoinedAndWon'] ?? '';
  }

  String get earnedPoints {
    return _localizedValues[locale.languageCode]!['earnedPoints'] ?? '';
  }

  String get ifYouJoinedAndLose {
    return _localizedValues[locale.languageCode]!['ifYouJoinedAndLose'] ?? '';
  }

  String get losePoints {
    return _localizedValues[locale.languageCode]!['losePoints'] ?? '';
  }

  String get knowWhereYouStandInCompetition {
    return _localizedValues[locale.languageCode]![
            'knowWhereYouStandInCompetition'] ??
        '';
  }

  String get aboutUs {
    return _localizedValues[locale.languageCode]!['aboutUs'] ?? '';
  }

  String get whoWeAreAndStarted {
    return _localizedValues[locale.languageCode]!['whoWeAreAndStarted'] ?? '';
  }

  String get referNEarn {
    return _localizedValues[locale.languageCode]!['referNEarn'] ?? '';
  }

  String get referYourFriendsAndFamily {
    return _localizedValues[locale.languageCode]![
            'referYourFriendsAndFamily'] ??
        '';
  }

  String get support {
    return _localizedValues[locale.languageCode]!['support'] ?? '';
  }

  String get connectUsForIssue {
    return _localizedValues[locale.languageCode]!['connectUsForIssue'] ?? '';
  }

  String get privacyPolicy {
    return _localizedValues[locale.languageCode]!['privacyPolicy'] ?? '';
  }

  String get knowOurPrivacyPolicies {
    return _localizedValues[locale.languageCode]!['knowOurPrivacyPolicies'] ??
        '';
  }

  String get changeLanguage {
    return _localizedValues[locale.languageCode]!['changeLanguage'] ?? '';
  }

  String get setYourPreferredLanguage {
    return _localizedValues[locale.languageCode]!['setYourPreferredLanguage'] ??
        '';
  }

  String get getYourQuestionsAnswered {
    return _localizedValues[locale.languageCode]!['getYourQuestionsAnswered'] ??
        '';
  }

  String get myProfile {
    return _localizedValues[locale.languageCode]!['myProfile'] ?? '';
  }

  String get level {
    return _localizedValues[locale.languageCode]!['level'] ?? '';
  }

  String get everythingAboutYou {
    return _localizedValues[locale.languageCode]!['everythingAboutYou'] ?? '';
  }

  String get teamName {
    return _localizedValues[locale.languageCode]!['teamName'] ?? '';
  }

  String get logout {
    return _localizedValues[locale.languageCode]!['logout'] ?? '';
  }

  String get howWeWork {
    return _localizedValues[locale.languageCode]!['howWeWork'] ?? '';
  }

  String get termsOfUse {
    return _localizedValues[locale.languageCode]!['termsOfUse'] ?? '';
  }

  String get connectUs {
    return _localizedValues[locale.languageCode]!['connectUs'] ?? '';
  }

  String get callUs {
    return _localizedValues[locale.languageCode]!['callUs'] ?? '';
  }

  String get mailUs {
    return _localizedValues[locale.languageCode]!['mailUs'] ?? '';
  }

  String get writeUs {
    return _localizedValues[locale.languageCode]!['writeUs'] ?? '';
  }

  String get letsKnowYourQuery {
    return _localizedValues[locale.languageCode]!['letsKnowYourQuery'] ?? '';
  }

  String get phoneNumberEmail {
    return _localizedValues[locale.languageCode]!['phoneNumberEmail'] ?? '';
  }

  String get addContactInfo {
    return _localizedValues[locale.languageCode]!['addContactInfo'] ?? '';
  }

  String get addYourIssueFeedback {
    return _localizedValues[locale.languageCode]!['addYourIssueFeedback'] ?? '';
  }

  String get writeYourMessage {
    return _localizedValues[locale.languageCode]!['writeYourMessage'] ?? '';
  }

  String get submit {
    return _localizedValues[locale.languageCode]!['submit'] ?? '';
  }

  String get myTables {
    return _localizedValues[locale.languageCode]!['myTables'] ?? '';
  }

  String get goToTable {
    return _localizedValues[locale.languageCode]!['goToTable'] ?? '';
  }

  String get june {
    return _localizedValues[locale.languageCode]!['june'] ?? '';
  }

  String get pokerEntry {
    return _localizedValues[locale.languageCode]!['pokerEntry'] ?? '';
  }

  String get earningAdded {
    return _localizedValues[locale.languageCode]!['earningAdded'] ?? '';
  }

  String get moneyAdded {
    return _localizedValues[locale.languageCode]!['moneyAdded'] ?? '';
  }

  String get moneyWithdrawal {
    return _localizedValues[locale.languageCode]!['moneyWithdrawal'] ?? '';
  }

  String get offer1 {
    return _localizedValues[locale.languageCode]!['offer1'] ?? '';
  }

  String get offer1Subtitle {
    return _localizedValues[locale.languageCode]!['offer1Subtitle'] ?? '';
  }

  String get offer2 {
    return _localizedValues[locale.languageCode]!['offer2'] ?? '';
  }

  String get offer2Subtitle {
    return _localizedValues[locale.languageCode]!['offer2Subtitle'] ?? '';
  }

  String get offer3 {
    return _localizedValues[locale.languageCode]!['offer3'] ?? '';
  }

  String get offer3Subtitle {
    return _localizedValues[locale.languageCode]!['offer3Subtitle'] ?? '';
  }

  String get offer4 {
    return _localizedValues[locale.languageCode]!['offer4'] ?? '';
  }

  String get offer4Subtitle {
    return _localizedValues[locale.languageCode]!['offer4Subtitle'] ?? '';
  }

  String get offer5 {
    return _localizedValues[locale.languageCode]!['offer5'] ?? '';
  }

  String get offer5Subtitle {
    return _localizedValues[locale.languageCode]!['offer5Subtitle'] ?? '';
  }

  String get apply {
    return _localizedValues[locale.languageCode]!['apply'] ?? '';
  }

  String get walletBalance {
    return _localizedValues[locale.languageCode]!['walletBalance'] ?? '';
  }

  String get topUpYourWalletBalance {
    return _localizedValues[locale.languageCode]!['topUpYourWalletBalance'] ??
        '';
  }

  String get enterAmountToAdd {
    return _localizedValues[locale.languageCode]!['enterAmountToAdd'] ?? '';
  }

  String get enterAmount {
    return _localizedValues[locale.languageCode]!['enterAmount'] ?? '';
  }

  String get addAQuickAmount {
    return _localizedValues[locale.languageCode]!['addAQuickAmount'] ?? '';
  }

  String get bonus {
    return _localizedValues[locale.languageCode]!['bonus'] ?? '';
  }

  String get referToYourContacts {
    return _localizedValues[locale.languageCode]!['referToYourContacts'] ?? '';
  }

  String get alreadyHaveACouponCode {
    return _localizedValues[locale.languageCode]!['alreadyHaveACouponCode'] ??
        '';
  }

  String get applyCouponCode {
    return _localizedValues[locale.languageCode]!['applyCouponCode'] ?? '';
  }

  String get enterCouponCode {
    return _localizedValues[locale.languageCode]!['enterCouponCode'] ?? '';
  }

  String get applyCode {
    return _localizedValues[locale.languageCode]!['applyCode'] ?? '';
  }

  String get wallet {
    return _localizedValues[locale.languageCode]!['wallet'] ?? '';
  }

  String get unplayed {
    return _localizedValues[locale.languageCode]!['unplayed'] ?? '';
  }

  String get earnBonus {
    return _localizedValues[locale.languageCode]!['earnBonus'] ?? '';
  }

  String get earning {
    return _localizedValues[locale.languageCode]!['earning'] ?? '';
  }

  String get withdraw {
    return _localizedValues[locale.languageCode]!['withdraw'] ?? '';
  }

  String get history {
    return _localizedValues[locale.languageCode]!['history'] ?? '';
  }

  String get offers {
    return _localizedValues[locale.languageCode]!['offers'] ?? '';
  }

  String get myTable {
    return _localizedValues[locale.languageCode]!['myTable'] ?? '';
  }

  String get more {
    return _localizedValues[locale.languageCode]!['more'] ?? '';
  }

  String get language {
    return _localizedValues[locale.languageCode]!['language'] ?? '';
  }

  String get preferredLanguage {
    return _localizedValues[locale.languageCode]!['preferredLanguage'] ?? '';
  }

  String get continuee {
    return _localizedValues[locale.languageCode]!['continuee'] ?? '';
  }
}

class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => [
        'en',
        'id',
        'pt',
        'ar',
        'fr',
        'es',
        'it',
        'tr',
        'sw',
        'ro',
        'de',
      ].contains(locale.languageCode);

  @override
  Future<AppLocalizations> load(Locale locale) {
    // Returning a SynchronousFuture here because an async "load" operation
    // isn't needed to produce an instance of AppLocalizations.
    return SynchronousFuture<AppLocalizations>(AppLocalizations(locale));
  }

  @override
  bool shouldReload(AppLocalizationsDelegate old) => false;
}
