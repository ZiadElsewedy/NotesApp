import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:notesapp/Cubits/AddNoteCubit/cubit/add_note_cubit_cubit.dart';

String getCurrentFormattedDateTime() {
  return DateFormat('yyyy-MM-dd – kk:mm').format(DateTime.now());
}

class ColorItem extends StatelessWidget {
  final Color color;
  final bool isSelected;
  final VoidCallback onTap;

  const ColorItem({
    super.key,
    required this.color,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap, // Handle tap to toggle selection
      child: CircleAvatar(
        radius: 20,
        backgroundColor: color,
        child: isSelected
            ? const Icon(
                Icons.check,
                color: Colors.white,
                size: 27,
              )
            : null, // Show check icon if selected
      ),
    );
  }
}

class ColorListView extends StatefulWidget {
  const ColorListView({super.key});

  @override
  State<ColorListView> createState() => _ColorListViewState();
}

class _ColorListViewState extends State<ColorListView> {
  int selectedIndex = -1; // Tracks the selected color index

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView.builder(
        itemCount: Colors.primaries.length, // Use available primary colors
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final color = Colors.primaries[index];
          final isSelected = index == selectedIndex;

          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ColorItem(
              color: color,
              isSelected: isSelected,
              onTap: () {
                setState(() {
                  selectedIndex = index; // Update selected index
                  BlocProvider.of<AddNoteCubitCubit>(context).SelectedColor = color;
                      
                    
                });
              },
            ),
          );
        },
      ),
    );
  }
}
