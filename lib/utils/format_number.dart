import 'package:intl/intl.dart';

String formatToIDR(num value) {
  final NumberFormat formatter = NumberFormat.currency(
    locale: 'id_ID',
    symbol: 'Rp',
    decimalDigits: 0, // Set to 0 for whole numbers, or 2 for cents
  );
  return formatter.format(value);
}

String toStringAsFixed(num number, int fraction) {
  return number.toStringAsFixed(fraction);
}

String formatPhoneNumber(String phoneNumber, String countryCode) {
  // Remove all non-numeric characters
  phoneNumber = phoneNumber.replaceAll(RegExp(r'\D'), '');

  // Add country-specific formatting rules
  final Map<String, RegExp> countryFormats = {
    'ID': RegExp(r'^(\d{4})(\d{4})(\d{0,4})$'), // Indonesia: 0812-3456-7890
    'US': RegExp(r'^(\d{3})(\d{3})(\d{4})$'), // USA: (123) 456-7890
    'UK': RegExp(r'^(\d{5})(\d{6})$'), // UK: 12345 678901
    'IN': RegExp(r'^(\d{5})(\d{5})$'), // India: 12345 67890
  };

  // Check if the phone number includes the country code
  if (countryCode == 'ID' && phoneNumber.startsWith('62')) {
    phoneNumber = '0${phoneNumber.substring(2)}'; // Convert +62 to 0
  }

  // Get the correct RegExp for the country code
  RegExp? format = countryFormats[countryCode];

  // If no specific format is found, return the original number
  if (format == null) {
    return '+$countryCode $phoneNumber';
  }

  // Apply the format
  String formattedNumber = phoneNumber.replaceAllMapped(
    format,
    (match) {
      if (countryCode == 'ID') {
        return '${match[1]}-${match[2]}${match[3] != null && match[3]!.isNotEmpty ? "-${match[3]}" : ""}';
      } else if (countryCode == 'US') {
        return '(${match[1]}) ${match[2]}-${match[3]}';
      } else if (countryCode == 'UK' || countryCode == 'IN') {
        return '${match[1]} ${match[2]}';
      } else {
        return phoneNumber;
      }
    },
  );

  // Prepend the country code
  return '+$countryCode $formattedNumber';
}
