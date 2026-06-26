import 'package:flutter/material.dart';

class HoverButton extends StatefulWidget {
  final Widget child;
  final VoidCallback? onTap;
  final Color defaultColor;
  final Color hoverColor;
  final BorderRadiusGeometry borderRadius;
  final EdgeInsetsGeometry padding;
  final MouseCursor cursor;

  const HoverButton({
    super.key,
    required this.child,
    this.onTap,
    this.defaultColor = Colors.grey,
    this.hoverColor = Colors.blue,
    this.borderRadius = const BorderRadius.all(Radius.circular(8)),
    this.padding = const EdgeInsets.all(16),
    this.cursor = SystemMouseCursors.click,
  });

  @override
  State<HoverButton> createState() => _HoverButtonState();
}

class _HoverButtonState extends State<HoverButton> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: widget.cursor,
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: Container(
          padding: widget.padding,
          decoration: BoxDecoration(
            color: isHovered ? widget.hoverColor : widget.defaultColor,
            borderRadius: widget.borderRadius,
          ),
          child: widget.child,
        ),
      ),
    );
  }
}
