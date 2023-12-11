import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../utils/constants/constants.dart';
import '../../../widgets/fit_circular_loading_indicator.dart';
import '../bloc/extras_bloc.dart';

Container whatIsFIT() {
  return Container(
    width: double.maxFinite, //365,
    margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 7.5),
    decoration: BoxDecoration(
      color: const Color(0XFFEAF0FE),
      border: Border.all(color: kPrimaryColor),
      borderRadius: BorderRadius.circular(
        8,
      ),
      boxShadow: const [
        BoxShadow(
          color: Color(0x26000000),
          offset: Offset(0, 1.5),
          blurRadius: 0.8,
        ),
      ],
    ),

    child: ExpansionTile(
      collapsedShape: const RoundedRectangleBorder(
        side: BorderSide(color: Colors.transparent),
      ),
      shape: const RoundedRectangleBorder(
        side: BorderSide(color: Colors.transparent),
      ),
      textColor: Colors.black,
      title: const Text(
        'What is FIT',
        style: TextStyle(
          fontSize: 16,
          color: Color(0XFF1E2E69),
          fontWeight: FontWeight.bold,
        ),
      ),
      children: [
        BlocBuilder<ExtrasBloc, ExtrasState>(
          builder: (context, state) {
            switch (state.status) {
              case ExtrasStatus.loading:
                return const FITCircularLoadingIndicator();
              case ExtrasStatus.loaded:
                return Padding(
                  padding: const EdgeInsets.all(15),
                  child: Text.rich(
                    textAlign: TextAlign.justify,
                    kRich(
                      kConvertNewLine(state.extrasModel!.whatIsFit ?? ''),
                    ),
                  ),
                );

              default:
                return Center(child: Text(state.errorMessage));
            }
          },
        )
      ],
    ),
  );
}
