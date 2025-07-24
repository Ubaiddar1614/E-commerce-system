import 'user.dart';
import 'cart_item.dart';

class Order {
  int orderId;
  User user;
  List<CartItem> items;
  double totalPrice;
  DateTime orderDate;
  
  Order(this.orderId, this.user, this.items, this.totalPrice, this.orderDate);
}

class OrderManager {
  List<Order> allOrders = [];
  
  void placeOrder(User user) {
    if (user.cart.isEmpty) {
      print("Cart is empty!");
      return;
    }
    
    // Check stock before placing order
    for (var item in user.cart) {
      if (item.product.stock < item.quantity) {
        print("Not enough stock for ${item.product.name}!");
        return;
      }
    }
    
    double total = 0;
    for (var item in user.cart) {
      total += item.product.price * item.quantity;
      item.product.stock -= item.quantity; // Reduce stock
    }
    
    Order order = Order(
      allOrders.length + 1,
      user,
      List.from(user.cart),
      total,
      DateTime.now(),
    );
    
    allOrders.add(order);
    user.cart.clear();
    print("Order placed! Total: \$${total.toStringAsFixed(2)} PKR");
  }
  
  void viewUserOrder(User user) {
    List<Order> userOrders = allOrders.where((order) => order.user == user).toList();
    
    if (userOrders.isEmpty) {
      print("No orders found for ${user.name}");
      return;
    }
    
    for (var order in userOrders) {
      print("Order #${order.orderId} - \$${order.totalPrice.toStringAsFixed(2)} PKR");
      print("Date: ${order.orderDate.day}/${order.orderDate.month}/${order.orderDate.year}");
      for (var item in order.items) {
        print("  ${item.product.name} x${item.quantity}");
      }
      print("---");
    }
  }
}