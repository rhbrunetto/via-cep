import 'package:freezed_annotation/freezed_annotation.dart';

part 'uf.g.dart';

@immutable
@JsonSerializable(createToJson: false)
class Uf {
  const Uf({
    required this.sigla,
    required this.nome,
  });

  final String sigla;
  final String nome;
}
