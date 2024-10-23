void main() {
  // Map of pizza prices
  const pizzaPrices = {
    'margherita': 5.5,
    'pepperoni': 7.5,
    'vegetarian': 6.5,
  };

  // Example order
  const order = ['margherita', 'pepperoni', 'pineapple'];

  // Initialize total price and a list to track unavailable pizzas
  double totalPrice = 0;
  List<String> unavailablePizzas = [];

  for (var pizza in order) {
    if (pizzaPrices.containsKey(pizza)) {
      totalPrice += pizzaPrices[pizza]!; // Add the price if the pizza exists
    } else {
      unavailablePizzas.add(pizza); // Track unavailable pizzas
    }
  }

  print('Total: \$${totalPrice}');

  if (unavailablePizzas.isNotEmpty) {
    for (var pizza in unavailablePizzas) {
      print('$pizza is not available on the menu');
    }
  }
}
