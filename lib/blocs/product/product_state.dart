// ignore_for_file: prefer_const_constructors_in_immutables

part of 'product_bloc.dart';

abstract class ProductState extends Equatable {
  const ProductState();
  
  @override
  List<Object> get props => [];
}

class ProductLoading extends ProductState {}

class ProductLoaded extends ProductState {
  final List<Product> products;

  ProductLoaded({this.products = const <Product>[]});

  @override
  List<Object> get props => [products];
}
