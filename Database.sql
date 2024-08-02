CREATE TABLE `questions` (
  `question_id` bigint PRIMARY KEY AUTO_INCREMENT,
  `set_id` bigint,
  `question_name` varchar(255),
  `created_date` datetime NOT NULL,
  `modified_date` datetime
);

CREATE TABLE `question_answers` (
  `answer_id` bigint PRIMARY KEY AUTO_INCREMENT,
  `question_id` bigint,
  `answer_text` varchar(255),
  `suggestion_text` varchar(255),
  `created_date` datetime NOT NULL,
  `modified_date` datetime
);

CREATE TABLE `sets` (
  `set_id` bigint PRIMARY KEY AUTO_INCREMENT,
  `set_name` varchar(255),
  `domain_name` varchar(255),
  `created_by` bigint,
  `status` enum(Initiated,Completed,Rejected),
  `created_date` datetime NOT NULL,
  `modified_date` datetime
);

CREATE TABLE `users` (
  `user_id` bigint PRIMARY KEY AUTO_INCREMENT,
  `username` varchar(255),
  `survey_id` bigint,
  `company_name` varchar(255),
  `domain` varchar(255),
  `status` enum(Initiated,Completed,Rejected),
  `created_date` datetime NOT NULL,
  `modified_date` datetime
);

CREATE TABLE `surveys` (
  `survey_id` bigint PRIMARY KEY AUTO_INCREMENT,
  `domain` varchar(255),
  `email_id` varchar(255),
  `company_name` varchar(255),
  `status` enum(Initiated,Completed,Rejected),
  `created_date` datetime NOT NULL
);

ALTER TABLE `questions` ADD FOREIGN KEY (`set_id`) REFERENCES `sets` (`set_id`);

ALTER TABLE `question_answers` ADD FOREIGN KEY (`question_id`) REFERENCES `questions` (`question_id`);

ALTER TABLE `sets` ADD FOREIGN KEY (`created_by`) REFERENCES `users` (`user_id`);

ALTER TABLE `users` ADD FOREIGN KEY (`survey_id`) REFERENCES `surveys` (`survey_id`);
