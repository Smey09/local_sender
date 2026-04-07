import 'package:flutter/material.dart';
import '../../../../domain/entities/transfer.dart';
import 'progress_bar.dart';

class TransferItem extends StatelessWidget {
  final Transfer transfer;

  const TransferItem({super.key, required this.transfer});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              transfer.fileName,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 8),
            Text(
              'Size: ${transfer.fileSize} bytes',
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const SizedBox(height: 8),
            Text(
              'Status: ${transfer.status.name}',
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const SizedBox(height: 8),
            ProgressBar(progress: transfer.progress),
          ],
        ),
      ),
    );
  }
}