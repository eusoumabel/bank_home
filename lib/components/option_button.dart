import 'package:flutter/material.dart';
import 'package:flutter_challenge_3/model/Option.dart';
import 'package:flutter_svg/svg.dart';

class OptionBtn extends StatelessWidget {
  const OptionBtn({
    Key key,
    @required this.option,
  }) : super(key: key);

  final Option option;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.grey[350],
              blurRadius: 5.0,
              offset: Offset(3, 4),
            )
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SvgPicture.asset(
              option.iconPath,
              height: 20,
            ),
            FittedBox(
              fit: BoxFit.cover,
              child: Text(
                option.title,
                style: Theme.of(context).textTheme.bodyText1.copyWith(
                      color: Theme.of(context).primaryColorDark,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
