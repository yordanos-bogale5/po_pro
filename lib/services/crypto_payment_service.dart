import 'dart:convert';
import 'package:http/http.dart' as http;

class CryptoPaymentService {
  final String apiKey = "YOUR_COINBASE_COMMERCE_API_KEY"; // Replace with your API key

  // Function to create a payment request
  Future<String> createPaymentRequest(double amount) async {
    final url = Uri.parse('https://api.commerce.coinbase.com/charges');
    
    // The body of the request
    final requestBody = jsonEncode({
      "name": "Poker Game Tournament Entry",
      "description": "Join Poker Tournament",
      "pricing_type": "fixed_price",
      "local_price": {
        "amount": amount.toString(),
        "currency": "USD"
      },
      "redirect_url": "https://yourapp.com/success", // URL to redirect after payment
      "cancel_url": "https://yourapp.com/cancel" // URL to redirect if payment is canceled
    });

    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
        'X-CC-Api-Key': apiKey, // API Key
      },
      body: requestBody,
    );

    if (response.statusCode == 201) {
      final Map<String, dynamic> responseData = jsonDecode(response.body);
      return responseData['data']['hosted_url']; // URL for the payment page
    } else {
      throw Exception('Failed to create payment request');
    }
  }
}
