import 'package:dfunc/dfunc.dart';

// TODO(rhbrunetto): move to l10n
enum Uf {
  ac('AC', 'Acre'),
  al('AL', 'Alagoas'),
  ap('AP', 'Amapá'),
  am('AM', 'Amazonas'),
  ba('BA', 'Bahia'),
  ce('CE', 'Ceará'),
  df('DF', 'Distrito Federal'),
  es('ES', 'Espírito Santo'),
  go('GO', 'Goiás'),
  ma('MA', 'Maranhão'),
  mt('MT', 'Mato Grosso'),
  ms('MS', 'Mato Grosso do Sul'),
  mg('MG', 'Minas Gerais'),
  pa('PA', 'Pará'),
  pb('PB', 'Paraíba'),
  pr('PR', 'Paraná'),
  pe('PE', 'Pernambuco'),
  pi('PI', 'Piauí'),
  rj('RJ', 'Rio de Janeiro'),
  rn('RN', 'Rio Grande do Norte'),
  rs('RS', 'Rio Grande do Sul'),
  ro('RO', 'Rondônia'),
  rr('RR', 'Roraima'),
  sc('SC', 'Santa Catarina'),
  sp('SP', 'São Paulo'),
  se('SE', 'Sergipe'),
  to('TO', 'Tocantins');

  const Uf(this.sigla, this.nome);

  final String nome;
  final String sigla;
}

extension UfExt on Uf {
  Uf ufFromSigla(String sigla) => sigla
      .toLowerCase()
      .let((it) => Uf.values.firstWhere((e) => e.sigla.toLowerCase() == it));
}
