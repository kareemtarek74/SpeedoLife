part of 'offer_products_cubit.dart';

abstract class OfferProductsState {}

class OfferProductsInitial extends OfferProductsState {}

class OfferProductsLoading extends OfferProductsState {}

class OfferProductsLoaded extends OfferProductsState {
  final List<Product> products;
  OfferProductsLoaded(this.products);
}

class OfferProductsError extends OfferProductsState {
  final String message;
  OfferProductsError(this.message);
}
