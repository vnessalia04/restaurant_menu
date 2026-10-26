import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Restaurant Menu',
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFFFF3E8),
      ),
      home: const MenuScreen(),
    );
  }
}

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFFF8A65),
        foregroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          'Pizza Menu 🍕',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          SizedBox(height: 16),
          FoodCard(
            name: 'Vegetable Pizza',
            description:
                'Fresh tomatoes, peppers, mushrooms and olives on a crispy base.',
          ),
          FoodCard(
            name: 'Chicken Pizza',
            description:
                'Juicy grilled chicken with mozzarella and tangy tomato sauce.',
          ),
          FoodCard(
            name: 'Cheese Pizza',
            description: 'Melty mozzarella and cheddar, simple and delicious.',
          ),
        ],
      ),
    );
  }
}

class PizzaImage extends StatelessWidget {
  final double size;

  const PizzaImage({super.key, required this.size});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        width: size,
        height: size,
        color: const Color(0xFFFFE0B2),
        child: Image.asset(
          'assets/pizza.png',
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) =>
              Icon(Icons.local_pizza, size: size * 0.6, color: Colors.orange),
        ),
      ),
    );
  }
}

class FoodCard extends StatelessWidget {
  final String name;
  final String description;

  const FoodCard({
    super.key,
    required this.name,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      color: Colors.white,
      shadowColor: Colors.orange.shade200,
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(28),
        side: const BorderSide(color: Color(0xFFFFCC80), width: 2),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(28),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailScreen(
                name: name,
                description: description,
              ),
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Row(
            children: [
              const PizzaImage(size: 90),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  name,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF8D4B2F),
                  ),
                ),
              ),
              const Icon(Icons.chevron_right_rounded,
                  size: 32, color: Colors.pinkAccent),
            ],
          ),
        ),
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  final String name;
  final String description;

  const DetailScreen({
    super.key,
    required this.name,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFFF8A65),
        foregroundColor: Colors.white,
        centerTitle: true,
        title: Text(name),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              const PizzaImage(size: 200),
              const SizedBox(height: 24),
              Text(
                name,
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF8D4B2F),
                ),
              ),
              const SizedBox(height: 12),
              Text(
                description,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 24),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFF8A65),
                  foregroundColor: Colors.white,
                ),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Yay! $name added 🍕')),
                  );
                },
                icon: const Icon(Icons.shopping_bag_rounded),
                label: const Text('Order now'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}