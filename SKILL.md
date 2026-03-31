---
name: pain-correlation-analyzer
description: Analyzes patient-logged chronic pain data with lifestyle factors (food, drink, activity, sleep) to identify potential triggers and patterns. Generates patient-friendly insights and clinician-ready reports.
version: 1.0.0
author: Dr. MO
license: MIT
repository: https://github.com/YOUR_USERNAME/pain-correlation-analyzer-skill
requires:
  - FLUTTER_VERSION: ">=3.16.0"
  - DATA_PRIVACY_MODE: "enabled"
  - PACKAGES: "fl_chart, intl, pdf, hive"
---

# Chronic Pain Correlation Analyzer Skill

## 🎯 When to Trigger
- User requests "What might be causing my pain spikes?"
- User asks for weekly/monthly pattern reports
- User wants to export insights for their physician
- User queries correlation between specific activities and pain levels

## 📋 Core Workflow

### Step 1: Data Loading
1. Load patient's logged entries from local database (Hive/SQLite)
2. Required fields: pain_score (0-10), timestamp, food_log, drink_log, activity_log, sleep_hours, medication_log
3. Filter by date range (default: last 30 days)

### Step 2: Correlation Analysis
1. Apply time-window correlation analysis (2h, 6h, 12h, 24h lag windows)
2. Calculate Pearson correlation coefficients for each factor
3. Flag statistically significant associations (p<0.05, |r|>0.3)
4. Identify recurring patterns (e.g., "pain spikes every Tuesday after gym")

### Step 3: Insight Generation
1. Generate patient-friendly summary (avoid medical jargon)
2. Create clinician-ready CSV/PDF export
3. Suggest 1-3 actionable hypotheses (e.g., "Consider tracking caffeine intake")
4. Include confidence levels for each correlation

### Step 4: Visualization
1. Generate time-series pain trend chart
2. Create correlation heatmap (factors vs. pain levels)
3. Build scatter plots for strong correlations
4. Export as PNG for reports or in-app display

## 🔐 Privacy Safeguards
- All analysis runs locally on-device when possible
- Exported reports exclude raw identifiers by default
- Include consent reminder before generating shareable reports
- Encrypt stored data using AES-256
- Implement audit logs for data access

## 📊 Example Output Format
