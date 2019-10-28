import 'dart:async';

class SignUpValidators {
  //validators
  static final validateEmail =
      StreamTransformer<String, String>.fromHandlers(handleData: (email, sink) {
    if (email.contains("@") && email.contains("."))
      sink.add(email);
    else
      sink.addError("Digite um e-mail válido");
  });

  static final validateName =
      StreamTransformer<String, String>.fromHandlers(handleData: (name, sink) {
    if (name.contains(" "))
      sink.add(name);
    else
      sink.addError("Digite seu nome completo.");
  });

  static final validateUseTerms =
      StreamTransformer<bool, bool>.fromHandlers(handleData: (useTerms, sink) {
    if (useTerms)
      sink.add(useTerms);
    else
      sink.addError("Você deve aceitar os termos.");
  });

  static final validatePassword =
      StreamTransformer<String, String>.fromHandlers(
          handleData: (password, sink) {
    if (password.length >= 6)
      sink.add(password);
    else
      sink.addError("Mínimo 6 caracteres");
  });

  static final validateCPF =
      StreamTransformer<String, String>.fromHandlers(handleData: (cpf, sink) {
    if (isCPFValid(cpf))
      sink.add(cpf);
    else
      sink.addError("Insira um CPF valido.");
  });

  static const List<String> BLACKLIST = [
    "00000000000",
    "11111111111",
    "22222222222",
    "33333333333",
    "44444444444",
    "55555555555",
    "66666666666",
    "77777777777",
    "88888888888",
    "99999999999",
    "12345678909"
  ];

  static const STRIP_REGEX = r'[^\d]';

  // Compute the Verifier Digit (or "Dígito Verificador (DV)" in PT-BR).
  // You can learn more about the algorithm on [wikipedia (pt-br)](https://pt.wikipedia.org/wiki/D%C3%ADgito_verificador)
  static int _verifierDigit(String cpf) {
    List<int> numbers =
        cpf.split("").map((number) => int.parse(number, radix: 10)).toList();

    int modulus = numbers.length + 1;

    List<int> multiplied = [];

    for (var i = 0; i < numbers.length; i++) {
      multiplied.add(numbers[i] * (modulus - i));
    }

    int mod = multiplied.reduce((buffer, number) => buffer + number) % 11;

    return (mod < 2 ? 0 : 11 - mod);
  }

  static String format(String cpf) {
    RegExp regExp = RegExp(r'^(\d{3})(\d{3})(\d{3})(\d{2})$');

    return strip(cpf).replaceAllMapped(
        regExp, (Match m) => "${m[1]}.${m[2]}.${m[3]}-${m[4]}");
  }

  static String strip(String cpf) {
    RegExp regExp = RegExp(STRIP_REGEX);
    cpf = cpf == null ? "" : cpf;

    return cpf.replaceAll(regExp, "");
  }

  static bool isCPFValid(String cpf, [stripBeforeValidation = true]) {
    if (stripBeforeValidation) {
      cpf = strip(cpf);
    }

    // CPF must be defined
    if (cpf == null || cpf.isEmpty) {
      return false;
    }

    // CPF must have 11 chars
    if (cpf.length != 11) {
      return false;
    }

    // CPF can't be blacklisted
    if (BLACKLIST.indexOf(cpf) != -1) {
      return false;
    }

    String numbers = cpf.substring(0, 9);
    numbers += _verifierDigit(numbers).toString();
    numbers += _verifierDigit(numbers).toString();

    return numbers.substring(numbers.length - 2) ==
        cpf.substring(cpf.length - 2);
  }
}
