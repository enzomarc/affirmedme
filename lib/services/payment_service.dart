import 'package:dio/dio.dart';
import 'package:kronosme/core/networker.dart';

class PaymentService {
  /// Create new payment method/card.
  Future createCard(Map<String, dynamic> data) async {
    try {
      Response response = await worker.post('/payments/cards', params: data);

      // return created payment method id
      if (response.statusCode == 201) return response.data['id'];

      return false;
    } on DioError catch (e) {
      print(e);
      return false;
    }
  }

  /// Initialize a new payment and wait
  /// for buyer confirmation.
  Future createPayment({String currency = 'usd'}) async {
    try {
      Response response =
          await worker.post('/payments/create', params: {'currency': currency});

      if (response.statusCode == 201) return response.data['payment'];

      return false;
    } on DioError catch (e) {
      print(e);
      return false;
    }
  }

  /// Confirm a payment with the given buyer card/method.
  Future confirmPayment(String paymentId, String paymentMethod) async {
    try {
      Response response = await worker.post("/payments/$paymentId/confirm",
          params: {'method': paymentMethod});

      if (response.statusCode == 200) return response.data['payment'];

      return false;
    } on DioError catch (e) {
      print(e);
      return false;
    }
  }
}

PaymentService paymentService = PaymentService();
