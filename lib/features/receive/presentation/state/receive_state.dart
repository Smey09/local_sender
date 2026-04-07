import 'package:equatable/equatable.dart';

class ReceiveState extends Equatable {
  final bool isLoading;
  final String? error;
  final bool isSuccess;

  const ReceiveState({
    this.isLoading = false,
    this.error,
    this.isSuccess = false,
  });

  const ReceiveState.initial() : this();

  const ReceiveState.loading() : this(isLoading: true);

  const ReceiveState.success() : this(isSuccess: true);

  const ReceiveState.error(String error) : this(error: error);

  @override
  List<Object?> get props => [isLoading, error, isSuccess];
}