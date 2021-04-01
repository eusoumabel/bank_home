import 'package:flutter_challenge_3/model/Option.dart';

class OptionsDAO {
  List<Option> options = [];

  List<Option> getOptions() {
    createOptions();
    return options;
  }

  void createOptions() {
    Option pix = Option("Pix", "icons/pix.svg");
    Option pagar = Option("Pagar", "icons/barcode.svg");
    Option transferir = Option("Transferir", "icons/transfer.svg");
    Option cartaoDeCredito =
        Option("Cartão de\n Crédito", "icons/credit-card.svg");
    Option bloquearCartao = Option("Bloquear\n Cartao", "icons/lock.svg");
    Option ajuda = Option("Ajuda", "icons/help.svg");
    options.add(pix);
    options.add(pagar);
    options.add(transferir);
    options.add(cartaoDeCredito);
    options.add(bloquearCartao);
    options.add(ajuda);
  }
}
