import 'package:equatable/equatable.dart';
import '../../../../domain/entities/device.dart';

class HomeState extends Equatable {
  final List<Device> devices;
  final bool isLoading;
  final String? error;

  const HomeState({
    this.devices = const [],
    this.isLoading = false,
    this.error,
  });

  const HomeState.initial() : this();

  const HomeState.loading() : this(isLoading: true);

  const HomeState.success(List<Device> devices) : this(devices: devices);

  const HomeState.error(String error) : this(error: error);

  @override
  List<Object?> get props => [devices, isLoading, error];
}