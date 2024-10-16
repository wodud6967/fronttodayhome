import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

class OrderModel {
  final OrderDTO order;
  final List<OrderDetailDTO> orderDetails;

  OrderModel({required this.order, required this.orderDetails});

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    var orderDetailsJson = json['orderDetails'] as List;
    List<OrderDetailDTO> orderDetailsList = orderDetailsJson
        .map((detailJson) => OrderDetailDTO.fromJson(detailJson))
        .toList();

    return OrderModel(
      order: OrderDTO.fromJson(json['order']),
      orderDetails: orderDetailsList,
    );
  }
}

class OrderDTO {
  final int orderId;
  final String partnerOrderId;
  final int totalAmount;
  final int quantity;
  final String userName;
  final String phone;
  final String address;

  OrderDTO({
    required this.orderId,
    required this.partnerOrderId,
    required this.totalAmount,
    required this.quantity,
    required this.userName,
    required this.phone,
    required this.address,
  });

  factory OrderDTO.fromJson(Map<String, dynamic> json) {
    return OrderDTO(
      orderId: json['orderId'],
      partnerOrderId: json['partnerOrderId'],
      totalAmount: json['totalAmount'],
      quantity: json['quantity'],
      userName: json['userName'],
      phone: json['phone'],
      address: json['address'],
    );
  }
}

class OrderDetailDTO {
  final int inventoryId;
  final int count;
  final int price;
  final int totalPrice;
  final String name;
  final String mainPhoto;
  final String title;
  final String brandName;

  OrderDetailDTO({
    required this.inventoryId,
    required this.count,
    required this.price,
    required this.totalPrice,
    required this.name,
    required this.mainPhoto,
    required this.title,
    required this.brandName,
  });

  factory OrderDetailDTO.fromJson(Map<String, dynamic> json) {
    return OrderDetailDTO(
      inventoryId: json['inventoryId'],
      count: json['count'],
      price: json['price'],
      totalPrice: json['totalPrice'],
      name: json['name'],
      mainPhoto: json['mainPhoto'],
      title: json['title'],
      brandName: json['brandName'],
    );
  }
}

class OrderVm extends StateNotifier<OrderModel?> {
  OrderVm(super.state);


  notifyInit(Map<String, dynamic> orderJson) {
    final OrderModel orderModel = OrderModel.fromJson(orderJson);
    Logger().d(orderModel.orderDetails.length);
    state = orderModel;
}


}

final orderProviderInit = StateNotifierProvider.autoDispose.family<OrderVm, OrderModel?, dynamic>((ref, order) {
  return OrderVm(null)..notifyInit(order);
});