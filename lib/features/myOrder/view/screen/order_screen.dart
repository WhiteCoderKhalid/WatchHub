import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:watch_app/features/myOrder/model/order.dart';
import 'package:watch_app/features/myOrder/repository/order_repository.dart';
import 'package:watch_app/features/myOrder/view/widget/orderCard.dart';
import 'package:watch_app/utils/app_textstyle.dart';

class OrderScreen extends StatelessWidget {
    final OrderRepository repository = OrderRepository();
   OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(
            Icons.arrow_back_ios,
            color: isDark ? Colors.white : Colors.black,
          ), // Icon
        ),
        title: Text(
          "My Order",
          style: AppTextstyle.withColor(
            AppTextstyle.h3,
            isDark ?Colors.white : Colors.black
          ),
        ),
        bottom: TabBar(
          labelColor: Theme.of(context).primaryColor,
          unselectedLabelColor:isDark ?Colors.grey[400] : Colors.grey[600] ,
          indicatorColor: Theme.of(context).primaryColor,
          tabs: const [
            Tab(text: "Active"),
             Tab(text: "Completed"),
              Tab(text: " Cancelled"),
          ]),
      ),
      body: TabBarView(
        children: [
          BuildOrderList(context, OrderStatus.active),
           BuildOrderList(context, OrderStatus.completed),
            BuildOrderList(context, OrderStatus.cancelled),
        ]),
      ),
    );
  }



 Widget BuildOrderList(BuildContext context, OrderStatus status) {
    final order = repository.getOrdersByStatus(status);

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: order.length,
      itemBuilder: (context, index) => OrderCard(
        order: order[index],
        onViewDetails: (){},
      ), // The method '
    ); // ListView.builder
}





}