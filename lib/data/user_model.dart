import 'dart:convert';

import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final String name;
  final String id;
  final String company;
  final String orderId;
  final String invoicepaid;
  final String invoicePending;

  const UserModel({
    required this.name,
    required this.id,
    required this.company,
    required this.orderId,
    required this.invoicepaid,
    required this.invoicePending,
  });

  @override
  List<Object> get props {
    return [
      name,
      id,
      company,
      orderId,
      invoicepaid,
      invoicePending,
    ];
  }

  UserModel copyWith({
    String? name,
    String? id,
    String? company,
    String? orderId,
    String? invoicepaid,
    String? invoicepending,
  }) {
    return UserModel(
      name: name ?? this.name,
      id: id ?? this.id,
      company: company ?? this.company,
      orderId: orderId ?? this.orderId,
      invoicepaid: invoicepaid ?? this.invoicepaid,
      invoicePending: invoicepending ?? this.invoicePending,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'id': id,
      'company': company,
      'orderId': orderId,
      'invoicepaid': invoicepaid,
      'invoicePending': invoicePending,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'],
      id: map['id'],
      company: map['company'],
      orderId: map['orderId'],
      invoicepaid: map['invoicepaid'],
      invoicePending: map['invoicePending'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));

  @override
  bool get stringify => true;
}
