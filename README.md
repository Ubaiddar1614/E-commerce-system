# E-commerce-system
A fully functional **Dart-based command-line e-commerce system** that supports user registration, login, product browsing, cart management, and order placement. All logic is written **100% in Dart** with clean modular structure and OOP principles.

> 🚧 **Firebase and REST API integration coming soon.**
> This version is completely local with no backend or database dependencies – ideal for practicing Dart and system design.

---

## 📂 Project Structure
├── main.dart # CLI entry point
├── product.dart # Product class + product management
├── user.dart # User class + registration/login/cart logic
├── order.dart # Order class + order tracking
├── ecommerce_system.dart # Central class to manage users, orders & product interface


---

## ✨ Features

### 🧑 User Management
- **Register New User** (Name, Email, Password)
- **Login/Logout** session
- Unique user sessions with individual carts & orders
- In-memory user list for now (will link with Firebase later)

### 📦 Product Management
- Add new products (hardcoded for now)
- View all products
- Update stock levels
- Validate stock before adding to cart

### 🛒 Cart System
- Add products to cart
- Quantity validation
- View cart contents
- Clears cart after order placement

### 📑 Orders
- Place order (deducts from product stock)
- View previous orders (current user only)
- Order details include items, quantities, and total price

### 🧠 ECommerceSystem Controller
- Handles:
  - Auth flow (register/login/logout)
  - Adding to cart
  - Viewing orders
  - Placing orders
  - User state persistence across function calls

---

## 🚀 How to Run

Make sure you have Dart SDK installed.

```bash
dart run main.dart
