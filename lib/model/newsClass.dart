import 'package:json_annotation/json_annotation.dart';
part 'newsClass.g.dart';

@JsonSerializable()
class News {
  List<Map<dynamic, dynamic>> value;

  News({
    required this.value,
  });

  factory News.fromJson(Map<String, dynamic> json) => _$NewsFromJson(json);
  Map<String, dynamic> toJson() => _$NewsToJson(this);
}
