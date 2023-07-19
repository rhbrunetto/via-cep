import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart' show visibleForTesting, immutable;

import 'uf.dart';

part 'uf_list.g.dart';

// ignore: invalid_annotation_target, we need const here
@JsonLiteral('local.uf_list.json', asConst: true)
@visibleForTesting
const Map<String, dynamic> localUfList = _$localUfListJsonLiteral;

class UfList {
  factory UfList({
    @visibleForTesting Map<String, dynamic>? data,
  }) {
    if (_instance != null) return _instance!;
    _instance = UfList._(data: data ?? localUfList);

    return _instance!;
  }

  UfList._({
    required Map<String, dynamic> data,
  }) : _parsedContent = _ParsedContent.fromJson(data);

  static UfList? _instance;
  final _ParsedContent _parsedContent;

  Iterable<Uf> get ufs => _parsedContent.ufs;

  Uf? findUfBySigla(String sigla) {
    final query = sigla.toLowerCase();
    return ufs.firstWhereOrNull((t) => t.sigla.toLowerCase() == query);
  }
}

@immutable
@JsonSerializable(createToJson: false)
class _ParsedContent {
  const _ParsedContent({
    required this.ufs,
  });

  final List<Uf> ufs;

  factory _ParsedContent.fromJson(Map<String, dynamic> json) =>
      _$ParsedContentFromJson(json);
}
