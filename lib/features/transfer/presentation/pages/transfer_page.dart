import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/transfer_controller.dart';
import '../widgets/transfer_item.dart';

class TransferPage extends GetView<TransferController> {
  const TransferPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transfers'),
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.transfers.isEmpty) {
          return const Center(
            child: Text('No transfers yet'),
          );
        }

        return ListView.builder(
          itemCount: controller.transfers.length,
          itemBuilder: (context, index) {
            final transfer = controller.transfers[index];
            return TransferItem(transfer: transfer);
          },
        );
      }),
    );
  }
}