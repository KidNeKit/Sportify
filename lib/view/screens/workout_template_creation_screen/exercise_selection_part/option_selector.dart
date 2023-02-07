import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sportify/cubits/exercise_template/exercise_template_cubit.dart';

import 'option.dart';

class OptionSelector extends StatefulWidget {
  const OptionSelector({super.key});

  @override
  State<OptionSelector> createState() => _OptionSelectorState();
}

class _OptionSelectorState extends State<OptionSelector> {
  bool _showAll = true;

  @override
  Widget build(BuildContext context) {
    double marginHor = 15.0;
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: marginHor),
      child: Stack(
        children: [
          Container(
            height: 50,
            width: screenWidth,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(20.0),
            ),
          ),
          AnimatedContainer(
            margin: _showAll
                ? EdgeInsets.zero
                : EdgeInsets.only(left: ((screenWidth - 2 * marginHor) / 2)),
            duration: const Duration(milliseconds: 200),
            child: Container(
              height: 50,
              width: (screenWidth - 2 * marginHor) / 2,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: Colors.purple,
              ),
            ),
          ),
          SizedBox(
            height: 50.0,
            child: Row(
              children: [
                Option(
                  label: 'Show All',
                  isActive: _showAll,
                  onSelectOptionFunc: () =>
                      setState(() => _showAll = !_showAll),
                ),
                Option(
                  label: 'Show Selected',
                  isActive: !_showAll,
                  onSelectOptionFunc: () =>
                      setState(() => _showAll = !_showAll),
                ),
              ],
            ),
          ),
          Positioned(
            right: 0,
            top: 0,
            child: Container(
              padding: const EdgeInsets.all(6.0),
              decoration: const BoxDecoration(
                color: Colors.black,
                shape: BoxShape.circle,
              ),
              child: BlocBuilder<ExerciseTemplateCubit, ExerciseTemplateState>(
                buildWhen: (previous, current) =>
                    previous.templates.length != current.templates.length,
                builder: (context, state) {
                  return Text(
                    state.templates.length.toString(),
                    style: const TextStyle(color: Colors.white),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
