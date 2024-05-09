part of 'basket_bloc.dart';

abstract class BasketEvent extends Equatable {
  const BasketEvent();

  @override
  // TODO: implement props
  List<Object> get props => [];
}

class StartBasket extends BasketEvent {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class AddItem extends BasketEvent {
  final MenuItem item;

  const AddItem(this.item);

  @override
  // TODO: implement props
  List<Object> get props => [];
}

class RemoveItem extends BasketEvent {
  final MenuItem item;

  const RemoveItem(this.item);

  @override
  // TODO: implement props
  List<Object> get props => [];
}

class ToggleSwitch extends BasketEvent {
  const ToggleSwitch();

  @override
  // TODO: implement props
  List<Object> get props => [];
}