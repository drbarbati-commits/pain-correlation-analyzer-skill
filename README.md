# Pain Correlation Analyzer Skill for manus.im

A specialized Agent Skill for chronic pain tracking applications built with Flutter.

## 🎯 Purpose

This Skill enables AI agents to:
- Analyze correlations between lifestyle factors and pain levels
- Generate patient-friendly insights and reports
- Create clinician-ready exports with privacy safeguards
- Visualize time-series pain data

## 📦 Installation

1. Fork this repository to your GitHub account
2. In manus.im: **Skills** → **+ Add** → **Import from GitHub**
3. Paste your repository URL
4. Use with `/pain-correlation-analyzer` in chat

## 🔐 Privacy & Compliance

- HIPAA-aware data handling patterns
- Local-first analysis (on-device when possible)
- Explicit consent flows for data sharing
- Audit logging for compliance

## 📚 Dependencies

```yaml
dependencies:
  flutter:
    sdk: flutter
  fl_chart: ^0.65.0
  hive: ^2.2.3
  pdf: ^3.10.7
  intl: ^0.18.1
