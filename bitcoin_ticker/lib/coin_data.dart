import 'dart:convert';
import 'package:http/http.dart' as http;

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

// const bitcoinAverageURL = 'https://apiv2.bitcoinaverage.com/indices/global/ticker';
const coinAPIURL = 'https://rest.coinapi.io/v1/exchangerate';
const apiKey = '5FE6F01B-EAD1-4D97-9CA3-FEBCD4EF3229';


class CoinData {
    Future getCoinData(String selectedCurrency) async{
      Map<String, String> cryptoPrices = {};
      for (String crypto in cryptoList) {
        //Update the URL to use the crypto symbol from the cryptoList
        String requestURL =
            '$coinAPIURL/$crypto/$selectedCurrency?apikey=$apiKey';
        http.Response response = await http.get(Uri.parse('https://rest.coinapi.io/v1/exchangerate/BTC/USD?apikey=5FE6F01B-EAD1-4D97-9CA3-FEBCD4EF3229'));
      // String requestURL = '$bitcoinAverageURL/BTC$selectedCurrency';
      // http.Response response = await http.get(Uri.parse('https://rest.coinapi.io/v1/exchangerate/BTC/USD?apikey=5FE6F01B-EAD1-4D97-9CA3-FEBCD4EF3229'));

      if(response.statusCode == 200){
        var decodedData = jsonDecode(response.body);
        double lastPrice = decodedData['rate'];
        cryptoPrices[crypto] = lastPrice.toStringAsFixed(0);
      }else {
        print(response.statusCode);
        throw 'Problem with the get request';
      }
    }
      return cryptoPrices;
}
}