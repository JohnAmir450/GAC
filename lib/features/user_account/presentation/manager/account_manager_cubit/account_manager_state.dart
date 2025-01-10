part of 'account_manager_cubit.dart';

@immutable
sealed class AccountManagerState {}

final class AccountManagerInitialState extends AccountManagerState {}

final class AccountManagerUpdateUserDataSuccessState extends AccountManagerState {}

final class AccountManagerUpdateUserDataLoadingState extends AccountManagerState {}
final class AccountManagerHasChangesState extends AccountManagerState {}
final class AccountManagerUpdateUserDataFailureState extends AccountManagerState {
  final String errorMessage;

  AccountManagerUpdateUserDataFailureState({required this.errorMessage});
}

final class DeleteAccountSuccessState extends AccountManagerState {}
final class DeleteAccountFailureState extends AccountManagerState {
    final String errorMessage;

  DeleteAccountFailureState({required this.errorMessage});
}

final class FetchUserOrdersLoadingState extends AccountManagerState {}

final class FetchUserOrdersSuccessState extends AccountManagerState {
  final List<OrderModel> orders;

  FetchUserOrdersSuccessState({required this.orders});
}


final class FetchUserOrdersLFailureState extends AccountManagerState {
  final String errorMessage;

  FetchUserOrdersLFailureState({required this.errorMessage});
}
final class ChangeProductDetailsVisibilityState extends AccountManagerState {}