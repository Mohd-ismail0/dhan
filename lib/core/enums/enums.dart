enum PaymentOption {
  cash("Cash"),
  card("Credit & Debit Card"),
  upi_scan_qr("UPI - Scan OR"),
  upi_id("UPI Id"),
  wallets("Wallets"),
  paylater("Pay Later");

  final String value;
  const PaymentOption(this.value);
}

enum AuthType { login, signup }

enum CategoryOfBusiness {
  retailer("Retailer"),
  distributor("Distributor");

  final String value;
  const CategoryOfBusiness(this.value);
}
