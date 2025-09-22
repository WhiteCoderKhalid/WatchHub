

import 'package:watch_app/features/myOrder/model/order.dart';

class OrderRepository {
  List<Order> getOrders(){
    return [
      Order(
        OrderNumber: '123432',
        itemCount: 2,
        totalAmount: 2938.3,
        status: OrderStatus.active,
        imageUrl: "assets/images/laptop.jpg",
        orderDate: DateTime.now().subtract(const Duration(hours: 2)), 
      ), 
         Order(
        OrderNumber: '324587',
        itemCount: 2,
        totalAmount: 2178.3,
        status: OrderStatus.active,
        imageUrl: "assets/images/shoe.jpg",
        orderDate: DateTime.now().subtract(const Duration(hours: 2)), 
      ), 
         Order(
        OrderNumber: '123432',
        itemCount: 6,
        totalAmount: 4563.3,
        status: OrderStatus.completed,
        imageUrl: "assets/images/shoe2.jpg",
        orderDate: DateTime.now().subtract(const Duration(hours: 7)), 
      ), 
         Order(
        OrderNumber: '343290',
        itemCount: 2,
        totalAmount: 2938.3,
        status: OrderStatus.cancelled,
        imageUrl: "assets/images/shoe.jpg",
        orderDate: DateTime.now().subtract(const Duration(hours: 9)), 
      ), 
    ];
  }

  List<Order> getOrdersByStatus (OrderStatus status) {
  return getOrders().where((order) => order.status == status).toList();
}
}