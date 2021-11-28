// ignore_for_file: prefer_const_constructors_in_immutables

part of 'product_bloc.dart';

abstract class ProductEvent extends Equatable {
  const ProductEvent();

  @override
  List<Object> get props => [];
}

class LoadProducts extends ProductEvent {}

class UpdateProducts extends ProductEvent {
  final List<Product> products;

  UpdateProducts(this.products);

  @override
  List<Object> get props => [products];
}

