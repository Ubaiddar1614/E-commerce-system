import 'dart:io';
import 'product.dart';
import 'user.dart';
import 'order.dart';
import 'ecommerce_system.dart';

void main() {
  var productManager = ProductManager();
  var userManager = UserManagement();
  var orderManager = OrderManager();
  var system = ECommerceSystem(productManager, userManager, orderManager);
  
  // dummy products
  productManager.addProduct(Product(1, "Gaming Laptop", "RTX 4060, 16GB RAM", 350000, 3));
  productManager.addProduct(Product(2, "iPhone 15 Pro", "256GB, Titanium", 450000, 8));
  productManager.addProduct(Product(3, "AirPods Pro", "Noise Cancellation", 75000, 15));
  productManager.addProduct(Product(4, "MacBook Air M3", "13-inch, 512GB SSD", 380000, 5));
  productManager.addProduct(Product(5, "Samsung S24 Ultra", "1TB, S-Pen", 320000, 6));
  productManager.addProduct(Product(6, "Gaming Mouse", "RGB, Wireless", 12000, 25));
  productManager.addProduct(Product(7, "Mechanical Keyboard", "Cherry MX Blue", 25000, 12));
  productManager.addProduct(Product(8, "27inch Monitor", "4K, 144Hz Gaming", 85000, 7));
  
  print(" Welcome to  ByteBazaar Terminal");
  
  while (true) {
    _printMenu();
    stdout.write("Enter an option: ");
    String? choice = stdin.readLineSync();
    
    try {
      switch (choice) {
        case '1':
          productManager.viewAllProducts();
          break;
        case '2':
          _handleRegistration(system);
          break;
        case '3':
          _handleLogin(system);
          break;
        case '4':
          _handleAddToCart(system);
          break;
        case '5':
          system.viewCart();
          break;
        case '6':
          system.placeOrder();
          break;
        case '7':
          system.viewMyOrders();
          break;
        case '8':
          system.logout();
          break;
        case '0':
          print("Thank you for visiting ByteBazaar Terminal! ");
          exit(0);
        default:
          print(" Invalid choice. Please choose from the given options.");
      }
    } catch (e) {
      print(" An error occurred: $e");
    }
    
    _pauseForUser();
  }
}

void _printMenu() {
  print("\n" + "=" * 40);
  print("          MAIN MENU");
  print("=" * 40);
  print("1.  View Products");
  print("2.  Register");  
  print("3.  Log in");
  print("4.  Add to Cart");
  print("5.  View Cart");
  print("6.  Place Order");
  print("7.  View My Orders");
  print("8.  Log out");
  print("0.  Exit");
  print("=" * 40);
}

void _handleRegistration(ECommerceSystem system) {
  stdout.write("Enter your name: ");
  String? name = stdin.readLineSync();
  stdout.write("Enter your email: ");
  String? email = stdin.readLineSync();
  stdout.write("Enter your password: ");
  String? password = stdin.readLineSync();
  
  if (name != null && email != null && password != null) {
    if (name.trim().isEmpty || email.trim().isEmpty || password.trim().isEmpty) {
      print(" All fields are required!");
      return;
    }
    if (!_isValidEmail(email)) {
      print(" Please enter a valid email address!");
      return;
    }
    system.register(name.trim(), email.trim(), password);
  } else {
    print(" Registration cancelled.");
  }
}

void _handleLogin(ECommerceSystem system) {
  stdout.write("Enter your email: ");
  String? email = stdin.readLineSync();
  stdout.write("Enter your password: ");
  String? password = stdin.readLineSync();
  
  if (email != null && password != null) {
    system.login(email.trim(), password);
  } else {
    print(" Login cancelled.");
  }
}
void _handleAddToCart(ECommerceSystem system) {
  stdout.write("Enter product ID: ");
  int? id = int.tryParse(stdin.readLineSync() ?? '');
  stdout.write("Enter quantity: ");
  int? qty = int.tryParse(stdin.readLineSync() ?? '');
  
  if (id != null && qty != null) {
    if (qty <= 0) {
      print(" Quantity must be greater than 0!");
      return;
    }
    system.addToCart(id, qty);
  } else {
    print(" Invalid input. Please enter valid numbers.");
  }
}
bool _isValidEmail(String email) {
  return email.contains('@');
}
void _pauseForUser() {
  stdout.write("\nPress Enter to continue...");
  stdin.readLineSync();
}
