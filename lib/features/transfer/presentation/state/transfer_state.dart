import 'package:equatable/equatable.dart';
import '../../../../domain/entities/transfer.dart';

class TransferState extends Equatable {
  final List<Transfer> transfers;
  final bool isLoading;
  final String? error;

  const TransferState({
    this.transfers = const [],
    this.isLoading = false,
    this.error,
  });

  const TransferState.initial() : this();

  const TransferState.loading() : this(isLoading: true);

  const TransferState.success(List<Transfer> transfers) : this(transfers: transfers);

  const TransferState.error(String error) : this(error: error);

  @override
  List<Object?> get props => [transfers, isLoading, error];
}