# Codebook

## Data Source
Human Activity Recognition Using Smartphones Dataset
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

## Variables
- Subject: Identifier of the subject who performed the activity (1–30)
- Activity: Descriptive activity name
- All other variables are averages of mean and standard deviation measurements
  from accelerometer and gyroscope signals

## Transformations Performed
- Training and test datasets were merged
- Only mean() and std() measurements were extracted
- Activity IDs were replaced with descriptive names
- Data was grouped by Subject and Activity
- Mean calculated for each variable
