import 'package:json_annotation/json_annotation.dart';
part 'demo.g.dart';

@JsonSerializable()
class Demo {

  factory Demo.fromJson(Map<String, dynamic> json) => _$DemoFromJson(json);

  Map<String, dynamic> toJson() => _$DemoToJson(this);
}
import 'package:json_annotation/json_annotation.dart';
part 'demo.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class Demo<T> {
    
  factory Demo.fromJson(Map<String, dynamic> json, T Function(Object? json) fromJsonT) => _$DemoFromJson(json, fromJsonT);
}