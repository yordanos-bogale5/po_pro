class WalletHistory {
  TransactionType transactionType;
  String amount;

  WalletHistory(this.transactionType, this.amount);
}

enum TransactionType {
  pokerEntry,
  earningAdded,
  moneyAdded,
  moneyWithdrawal,
}
