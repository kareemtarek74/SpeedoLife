part of 'offers_cubit.dart';

abstract class OffersState {}

class OffersInitial extends OffersState {}

class OffersLoading extends OffersState {}

class OffersLoaded extends OffersState {
  final List<Offer> offers;
  OffersLoaded({required this.offers});
}

class OffersError extends OffersState {
  final String message;
  OffersError(this.message);
}
