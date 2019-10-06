enum PaymentMethod {
  applePay,
}

String displayPaymentMethod(PaymentMethod paymentMethod) {
  switch (paymentMethod) {
    case PaymentMethod.applePay:
      return 'Apply Pay';
    default:
      return '';
  }
}
