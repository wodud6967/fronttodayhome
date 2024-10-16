import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fronttodayhome/data/repository/shopping_list_repository.dart';
import 'package:logger/logger.dart';
class Review {
  final int id;
  final String content;
  final String url;
  final double star;
  final String createdAt;

  Review({
    required this.id,
    required this.content,
    required this.url,
    required this.star,
    required this.createdAt,
  });

  factory Review.fromJson(Map<String, dynamic> json) {
    return Review(
      id: json['id'],
      content: json['content'],
      url: json['url'],
      star: json['star'].toDouble(),
      createdAt: json['createdAt'],
    );
  }
}

class Product {
  final int id;
  final String title;
  final String content;
  final int price;
  final String mainPhoto;
  final String createdAt;
  final List<Review> reviews;

  Product({
    required this.id,
    required this.title,
    required this.content,
    required this.price,
    required this.mainPhoto,
    required this.createdAt,
    required this.reviews,
  });

  // 기존의 copyWith 메서드 추가
  Product copyWith({
    int? id,
    String? title,
    String? content,
    int? price,
    String? mainPhoto,
    String? createdAt,
    List<Review>? reviews,
  }) {
    return Product(
      id: id ?? this.id,
      title: title ?? this.title,
      content: content ?? this.content,
      price: price ?? this.price,
      mainPhoto: mainPhoto ?? this.mainPhoto,
      createdAt: createdAt ?? this.createdAt,
      reviews: reviews ?? this.reviews,
    );
  }

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      title: json['title'],
      content: json['content'],
      price: json['price'],
      mainPhoto: json['mainPhoto'],
      createdAt: json['createdAt'],
      reviews: (json['reviews'] as List<dynamic>)
          .map((reviewJson) => Review.fromJson(reviewJson))
          .toList(),
    );
  }
}
class ShoppingListModel {
  final List<Product> recentPosts;
  final List<Product> pageTotalSold;

  ShoppingListModel({
    required this.recentPosts,
    required this.pageTotalSold,
  });

  // Factory method to create ShoppingListModel from JSON
  factory ShoppingListModel.fromJson(Map<String, dynamic> json) {
    return ShoppingListModel(
      recentPosts: (json["body"]['recentPostsDTOS'] as List<dynamic>)
          .map((productJson) => Product.fromJson(productJson))
          .toList(),
      pageTotalSold: (json["body"]['pageTotalSoldDtos'] as List<dynamic>)
          .map((productJson) => Product.fromJson(productJson))
          .toList(),
    );
  }
}



class ShoppingListVm extends StateNotifier<ShoppingListModel?>{
  ShoppingListVm(super.state);

  Future<void> notifyInit(id) async {
    Map<String, dynamic> one = await ShoppingListRepository().findAllByCategoryId(id);
    ShoppingListModel shoppingListModel = ShoppingListModel.fromJson(one);
    state = shoppingListModel;
  }


}


final shoppingListProvider = StateNotifierProvider.autoDispose.family<ShoppingListVm, ShoppingListModel?,int>((ref, id) {
  return ShoppingListVm(null)..notifyInit(id);
});