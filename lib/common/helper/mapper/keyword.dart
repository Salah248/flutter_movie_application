import 'package:flutter_movie_application/core/entity/keyword.dart';
import 'package:flutter_movie_application/core/models/keyword.dart';

class KeywordMapper {
  static KeywordEntity toEntity(KeywordModel keywordModel) {
    return KeywordEntity(
      name: keywordModel.name,
      id: keywordModel.id,
    );
  }
}
