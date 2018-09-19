import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:coffee/models/product.dart';

part 'serializers.g.dart';

@SerializersFor([Product])
final Serializers serializers = (
    _$serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();