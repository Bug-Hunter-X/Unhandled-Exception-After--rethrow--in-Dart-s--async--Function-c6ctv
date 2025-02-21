```dart
Future<void> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      print(jsonData['key']);
    } else {
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  } catch (e) {
    rethrow; // Re-throw the exception
  }
}

void main() async {
  try {
    await fetchData();
  } catch (e) {
    // More robust error handling
    print('An error occurred: $e');
    // Add additional error handling logic here (e.g., retry mechanism, fallback)
    // For example, use a default value if the API fails:
    final defaultValue = {'key': 'default'};
    print('Using default data: $defaultValue');
  }
}
```