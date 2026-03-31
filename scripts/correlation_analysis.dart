import 'dart:math';

/// Statistical correlation analysis for pain tracking data
class PainCorrelationAnalyzer {
  /// Calculate Pearson correlation coefficient
  static double pearsonCorrelation(List<double> x, List<double> y) {
    if (x.length != y.length || x.length < 3) return 0.0;
    
    final n = x.length;
    final meanX = x.reduce((a, b) => a + b) / n;
    final meanY = y.reduce((a, b) => a + b) / n;
    
    double numerator = 0;
    double sumSqX = 0;
    double sumSqY = 0;
    
    for (int i = 0; i < n; i++) {
      final dx = x[i] - meanX;
      final dy = y[i] - meanY;
      numerator += dx * dy;
      sumSqX += dx * dx;
      sumSqY += dy * dy;
    }
    
    final denominator = sqrt(sumSqX * sumSqY);
    return denominator == 0 ? 0.0 : numerator / denominator;
  }
  
  /// Analyze time-lagged correlations (e.g., food → pain 2h later)
  static Map<String, double> analyzeTimeLaggedCorrelations(
    List<PainEntry> entries,
    List<String> factors,
    Duration lagWindow,
  ) {
    final results = <String, double>{};
    
    for (final factor in factors) {
      final xValues = <double>[];
      final yValues = <double>[];
      
      for (int i = 0; i < entries.length; i++) {
        final entry = entries[i];
        final factorValue = entry.getFactorValue(factor);
        
        // Find pain entries within lag window after this factor
        for (int j = i + 1; j < entries.length; j++) {
          final timeDiff = entries[j].timestamp.difference(entry.timestamp);
          if (timeDiff <= lagWindow) {
            xValues.add(factorValue);
            yValues.add(entries[j].painScore.toDouble());
            break;
          }
        }
      }
      
      if (xValues.length >= 3) {
        results[factor] = pearsonCorrelation(xValues, yValues);
      }
    }
    
    return results;
  }
}

/// Data model for pain tracking entries
class PainEntry {
  final DateTime timestamp;
  final double painScore;
  final Map<String, dynamic> factors;
  
  PainEntry({
    required this.timestamp,
    required this.painScore,
    required this.factors,
  });
  
  double getFactorValue(String factorName) {
    final value = factors[factorName];
    if (value == null) return 0.0;
    if (value is bool) return value ? 1.0 : 0.0;
    if (value is num) return value.toDouble();
    return 0.0;
  }
}
