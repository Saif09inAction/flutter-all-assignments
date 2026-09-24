import 'package:flutter/material.dart';

void main() {
  runApp(const ProductApp());
}

// Data Model Class
class Product {
  final String name;
  final double price;
  final String category;

  Product({
    required this.name,
    required this.price,
    required this.category,
  });
}

class ProductApp extends StatelessWidget {
  const ProductApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Product Listing',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ProductListPage(),
    );
  }
}

class ProductListPage extends StatefulWidget {
  const ProductListPage({super.key});

  @override
  State<ProductListPage> createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  // Product data
  final List<Product> products = [
    Product(
      name: 'Laptop',
      price: 55000,
      category: 'Electronics',
    ),
    Product(
      name: 'Smartphone',
      price: 25000,
      category: 'Electronics',
    ),
    Product(
      name: 'Headphones',
      price: 2500,
      category: 'Accessories',
    ),
    Product(
      name: 'Running Shoes',
      price: 3500,
      category: 'Fashion',
    ),
    Product(
      name: 'Backpack',
      price: 1800,
      category: 'Fashion',
    ),
    Product(
      name: 'Smart Watch',
      price: 4500,
      category: 'Electronics',
    ),
    Product(
      name: 'Water Bottle',
      price: 800,
      category: 'Accessories',
    ),
  ];

  // List that will be displayed after filtering
  List<Product> filteredProducts = [];

  @override
  void initState() {
    super.initState();

    // Initially show all products
    filteredProducts = products;
  }

  // Search / Filter function
  void searchProducts(String query) {
    setState(() {
      filteredProducts = products.where((product) {
        return product.name.toLowerCase().contains(query.toLowerCase()) ||
            product.category.toLowerCase().contains(query.toLowerCase());
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Listing'),
      ),

      body: Column(
        children: [
          // Search Bar
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              onChanged: searchProducts,
              decoration: InputDecoration(
                hintText: 'Search products...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),

          // Product List
          Expanded(
            child: filteredProducts.isEmpty
                ? const Center(
                    child: Text(
                      'No products found',
                      style: TextStyle(fontSize: 18),
                    ),
                  )
                : ListView.builder(
                    itemCount: filteredProducts.length,
                    itemBuilder: (context, index) {
                      final product = filteredProducts[index];

                      return Card(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 6,
                        ),
                        child: ListTile(
                          leading: CircleAvatar(
                            child: Text(
                              product.name[0],
                            ),
                          ),
                          title: Text(
                            product.name,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Text(product.category),
                          trailing: Text(
                            '₹${product.price.toStringAsFixed(0)}',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}