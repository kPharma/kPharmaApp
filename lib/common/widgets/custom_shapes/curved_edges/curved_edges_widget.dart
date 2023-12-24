import 'package:flutter/material.dart';
import 'curved_edges.dart';

class KCurvedEdgesWidget extends StatelessWidget {
  const KCurvedEdgesWidget({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: KCustomCurvedEdges(),
      child: child,
    );
  }
}
