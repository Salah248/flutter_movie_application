import 'package:flutter_movie_application/core/entity/trailer.dart';
import 'package:flutter_movie_application/core/models/trailers.dart';

class TrailerMapper {
  static TrailerEntity toEntity(TrailerModel trailerModel) {
    return TrailerEntity(
        iso6391: trailerModel.iso6391,
        iso31661: trailerModel.iso31661,
        name: trailerModel.name,
        key: trailerModel.key,
        site: trailerModel.site,
        size: trailerModel.size,
        type: trailerModel.type,
        official: trailerModel.official,
        publishedAt: trailerModel.publishedAt,
        id: trailerModel.id);
  }
}
