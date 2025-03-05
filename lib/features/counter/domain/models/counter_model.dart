class CounterModel {
  final int value;
  final DateTime lastUpdated;

  const CounterModel({required this.value, required this.lastUpdated});

  factory CounterModel.initial() =>
      CounterModel(value: 0, lastUpdated: DateTime.now());

  factory CounterModel.fromJson(Map<String, dynamic> json) => CounterModel(
    value: (json['value'] as num).toInt(),
    lastUpdated: DateTime.parse(json['lastUpdated'] as String),
  );

  Map<String, dynamic> toJson() => {
    'value': value,
    'lastUpdated': lastUpdated.toIso8601String(),
  };

  CounterModel copyWith({int? value, DateTime? lastUpdated}) {
    return CounterModel(
      lastUpdated: lastUpdated ?? this.lastUpdated,
      value: value ?? this.value,
    );
  }
}
