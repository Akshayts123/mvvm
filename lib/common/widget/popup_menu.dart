import 'package:flutter/material.dart';
import 'package:lilac_mvvm_user/core/app_extensions.dart';

class PopupMenu<T> extends StatelessWidget {
  const PopupMenu({
    super.key,
    required this.items,
    required this.onChanged,
    this.icon = Icons.more_vert,
  });

  final List<T> items;
  final ValueChanged<T> onChanged;
  final IconData? icon;

  String checkType(T item) {
    if (item!.isEnum) return item.getEnumString;
    return item.toString();
  }

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<T>(
      icon: Icon(icon,color: Theme.of(context).cardColor,),
      color: Theme.of(context).cardColor,
      surfaceTintColor: Theme.of(context).cardColor,
      shape: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
        borderSide:  BorderSide(color: Theme.of(context).cardColor),
      ),
      onSelected: (T item) {
        onChanged(item);
      },
      itemBuilder: (BuildContext context) {
        return items
            .map(
              (T item) => PopupMenuItem<T>(
            value: item,
            child: InkWell(
              child: Text(checkType(item)),
            ),
          ),
        )
            .toList();
      },
    );
  }
}
