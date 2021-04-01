import 'package:flutter/material.dart';
import 'package:flutter_challenge_3/bloc/options_bloc.dart';
import 'package:flutter_challenge_3/components/home_button.dart';
import 'package:flutter_challenge_3/components/option_button.dart';
import 'package:flutter_challenge_3/model/Option.dart';
import 'package:flutter_challenge_3/service/config/base_response.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final format = new NumberFormat("#,##0.00", "en_US");

  OptionsBloc _bloc = OptionsBloc();
  List<Option> options;
  bool isMoneyVisible = true;
  double moneyAmount = 5720.00;
  @override
  void initState() {
    super.initState();
    options = _bloc.getOptions();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight - 24) / 2.9;
    final double itemWidth = size.width / 2;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(24, 16, 24, 16),
            child: Column(
              children: [
                _header(),
                _body(itemWidth, itemHeight),
                _footer(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Padding _footer() {
    return Padding(
      padding: const EdgeInsets.only(top: 32),
      child: Column(
        children: [
          HomeBtn(
            onTap: () {},
            title: "Extrato",
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: HomeBtn(
              onTap: () {},
              title: "Investimentos",
            ),
          ),
        ],
      ),
    );
  }

  Padding _body(double itemWidth, double itemHeight) {
    return Padding(
      padding: const EdgeInsets.only(top: 40),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.fromLTRB(16, 16, 16, 40),
        decoration: BoxDecoration(
          color: Theme.of(context).accentColor,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Saldo disponível",
                    style: Theme.of(context).textTheme.headline6.copyWith(
                          color: Theme.of(context).primaryColorDark,
                        ),
                  ),
                  IconButton(
                      icon: IconTheme(
                        data: Theme.of(context).iconTheme.copyWith(
                              size: 20,
                            ),
                        child: Icon(
                          !isMoneyVisible
                              ? Icons.remove_red_eye
                              : Icons.visibility_off,
                        ),
                      ),
                      onPressed: () {
                        setState(() {
                          isMoneyVisible = !isMoneyVisible;
                        });
                      })
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: Text(
                isMoneyVisible ? "${format.format(moneyAmount)}" : "********",
                style: Theme.of(context).textTheme.headline3.copyWith(
                      color: Theme.of(context).primaryColorDark,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40),
              child: GridView.builder(
                  padding: EdgeInsets.all(8),
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 30.0,
                    childAspectRatio: (itemWidth / itemHeight),
                    mainAxisSpacing: 40.0,
                  ),
                  itemCount: options.length,
                  itemBuilder: (BuildContext ctx, index) {
                    return OptionBtn(
                      option: options[index],
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }

  Row _header() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: "Bem-vinde\n",
                style: Theme.of(context).textTheme.headline5,
              ),
              TextSpan(
                text: "Anne",
                style: Theme.of(context).textTheme.headline5.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ],
          ),
        ),
        FloatingActionButton(
          child: IconTheme(
            data: Theme.of(context).iconTheme,
            child: Icon(Icons.settings),
          ),
          onPressed: () {},
        ),
      ],
    );
  }
}
