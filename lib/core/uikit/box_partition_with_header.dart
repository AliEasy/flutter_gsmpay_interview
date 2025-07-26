import 'package:flutter/material.dart';

class BoxPartitionWithHeader extends StatelessWidget {
  final String title;
  final Widget child;

  const BoxPartitionWithHeader({
    super.key,
    required this.child,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(16)),
        color: Theme.of(context).colorScheme.surfaceContainerLow,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 15),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 40,
                width: 4,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(4.0),
                    bottomLeft: Radius.circular(4.0),
                  ),
                ),
              ),
              const SizedBox(width: 15),
              Expanded(
                child: Text(title, style: Theme.of(context).textTheme.titleLarge),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.only(
                bottom: 30,
                top: 10,
                left: 20,
                right: 20,
              ),
              child: child,
            ),
          ),
        ],
      ),
    );
  }
}
