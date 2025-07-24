class Product {
  int id;
  String name;
  String description;
  int stock;
  double price;
  
  Product(this.id, this.name, this.description, this.price, this.stock);
}

class ProductManager {
  List<Product> allProducts = [];
  
  void addProduct(Product product) {
    allProducts.add(product);
    print("Product added: ${product.name}");
  }
  
  void removeProduct(int id) {
    allProducts.removeWhere((p) => p.id == id);
    print("Product with ID $id removed");
  }
  
  void updateStock(int id, int newStock) {
    for (var p in allProducts) {
      if (p.id == id) {
        p.stock = newStock;
        print("Stock updated for product ID $id");
        return;
      }
    }
    print("Product not found!");
  }
  
  void viewAllProducts() {
    if (allProducts.isEmpty) {
      print("No products in stock");
      return;
    }
    
    for (var p in allProducts) {
      print("${p.id}: ${p.name} - \PKR ${p.price.toStringAsFixed(2)} (Stock: ${p.stock})");
    }
  }
  
  Product? getProductById(int id) {
    try {
      return allProducts.firstWhere((p) => p.id == id);
    } catch (e) {
      return null;
    }
  }
}