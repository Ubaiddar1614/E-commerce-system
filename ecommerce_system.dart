import 'product.dart';
import 'user.dart';
import 'cart_item.dart';
import 'order.dart';

class ECommerceSystem {
  final ProductManager productManager;
  final UserManagement userManager;
  final OrderManager orderManager;
  
  User? _user; // Currently logged in user
  
  ECommerceSystem(this.productManager, this.userManager, this.orderManager);
  
  void register(String name, String email, String password) {
    var id = userManager.allUsers.length + 1;
    userManager.registerUser(User(id, name, email, password));
  }
  
  void login(String email, String password) {
    _user = userManager.loginUser(email, password);
  }
  
  void logout() {
    if (_user != null) {
      print("Goodbye, ${_user!.name}!");
      _user = null;
    } else {
      print("No user is currently logged in.");
    }
  }
  
  void addToCart(int productId, int quantity) {
    if (_user == null) {
      print("Please log in first!");
      return;
    }
    
    var product = productManager.getProductById(productId);
    if (product == null) {
      print("Product not found!");
      return;
    }
    
    if (product.stock < quantity) {
      print("Not enough stock! Available: ${product.stock}");
      return;
    }
    
    // Check if product already exists in cart
    for (var item in _user!.cart) {
      if (item.product.id == productId) {
        int newQuantity = item.quantity + quantity;
        if (product.stock < newQuantity) {
          print("Cannot add $quantity more. Total would exceed stock!");
          return;
        }
        item.quantity = newQuantity;
        print("Updated cart: ${product.name} x${item.quantity}");
        return;
      }
    }
    
    // Add new item to cart
    _user!.cart.add(CartItem(product, quantity));
    print("Added to cart: ${product.name} x$quantity");
  }
  
  void viewCart() {
    if (_user == null) {
      print("Please log in first!");
      return;
    }
    
    if (_user!.cart.isEmpty) {
      print("Your cart is empty");
      return;
    }
    
    print("\n========== YOUR CART ==========");
    
    double total = 0;
    for (var item in _user!.cart) {
      double itemTotal = item.product.price * item.quantity;
      total += itemTotal;
      print("${item.product.name}");
      print("  Quantity: ${item.quantity} x ${item.product.price.toStringAsFixed(2)}PKR");
      print("  Subtotal: \$${itemTotal.toStringAsFixed(2)}");
      print("------------------------------");
    }
    
    print("TOTAL: ${total.toStringAsFixed(2)} PKR");
  }
  
  void placeOrder() {
    if (_user == null) {
      print("Please log in first!");
      return;
    }
    orderManager.placeOrder(_user!);
  }
  
  void viewMyOrders() {
    if (_user == null) {
      print("Please log in first!");
      return;
    }
    orderManager.viewUserOrder(_user!);
  }
}