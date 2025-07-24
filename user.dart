import 'cart_item.dart';

class User {
  int id;
  String name;
  String email;
  String password;
  List<CartItem> cart = [];
  
  User(this.id, this.name, this.email, this.password);
}

class UserManagement {
  List<User> allUsers = [];
  
  void registerUser(User user) {
    // Check if email already exists
    for (var u in allUsers) {
      if (u.email.toLowerCase() == user.email.toLowerCase()) {
        print("Email already registered!");
        return;
      }
    }
    
    allUsers.add(user);
    print("User registered: ${user.name}");
  }
  
  User? loginUser(String email, String password) {
    for (var u in allUsers) {
      if (u.email.toLowerCase() == email.toLowerCase() && u.password == password) {
        print("Login successful! Welcome ${u.name}");
        return u;
      }
    }
    print("Incorrect email or password!");
    return null;
  }
}