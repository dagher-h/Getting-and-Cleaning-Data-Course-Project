## Getting and Cleaning Data Course Project
## Run_analysis.R

library(dplyr)

# قراءة ملفات الميزات والأنشطة
features <- read.table("UCI HAR Dataset/features.txt")
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt")

# قراءة بيانات التدريب
x_train <- read.table("UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")

# قراءة بيانات الاختبار
x_test <- read.table("UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")

# دمج التدريب والاختبار
x_data <- rbind(x_train, x_test)
y_data <- rbind(y_train, y_test)
subject_data <- rbind(subject_train, subject_test)

# تسمية الأعمدة
colnames(x_data) <- features[,2]
colnames(y_data) <- "Activity"
colnames(subject_data) <- "Subject"

# استخراج المتوسط والانحراف المعياري
mean_std_cols <- grep("mean\\(\\)|std\\(\\)", features[,2])
x_data <- x_data[, mean_std_cols]

# استخدام أسماء الأنشطة الوصفية
y_data$Activity <- activity_labels[y_data$Activity, 2]

# دمج كل البيانات
merged_data <- cbind(subject_data, y_data, x_data)

# إنشاء مجموعة بيانات مرتبة ثانية
tidy_data <- merged_data %>%
  group_by(Subject, Activity) %>%
  summarise(across(everything(), mean))

# حفظ البيانات المرتبة
write.table(tidy_data, "tidy_data.txt", row.name = FALSE)
