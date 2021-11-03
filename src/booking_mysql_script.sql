DROP DATABASE IF EXISTS	`booking`;
CREATE DATABASE `booking` DEFAULT CHARACTER SET utf8;

USE `booking`;

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
	`id` 				int 		NOT NULL 	AUTO_INCREMENT,
	`login` 			varchar(20) NOT NULL 	AUTO_INCREMENT 		UNIQUE,
	`password`  		varchar(20) NOT NULL 	AUTO_INCREMENT 		UNIQUE,
	PRIMARY KEY (`id`)
);

DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles` (
	`id` 				BINARY 		NOT NULL 	AUTO_INCREMENT,
	`name` 				varchar(5) 	NOT NULL 						UNIQUE,
	PRIMARY KEY (`id`)
);

DROP TABLE IF EXISTS `users_roles`;
CREATE TABLE `users_roles` (
	`id` 				int 		NOT NULL 	AUTO_INCREMENT,
	`user_id` 			int 		NOT NULL 	AUTO_INCREMENT,
	`roles_id` 			BINARY 		NOT NULL 	AUTO_INCREMENT,
	PRIMARY KEY (`id`)
);

DROP TABLE IF EXISTS `bookinf_info`;
CREATE TABLE `booking_info` (
	`id` 				int 		NOT NULL 	AUTO_INCREMENT,
	`booking_date` 		DATE 		NOT NULL,
	`room_id` 			int 		NOT NULL,
	`user_id` 			int 		NOT NULL,
	PRIMARY KEY (`id`)
);

DROP TABLE IF EXISTS `rooms`;
CREATE TABLE `rooms` (
	`id` 				int 		NOT NULL 	AUTO_INCREMENT,
	`number` 			int 		NOT NULL 	AUTO_INCREMENT,
	`hotel_id` 			int 		NOT NULL,
	`type_id` 			tinyint 	NOT NULL,
	PRIMARY KEY (`id`)
);

DROP TABLE IF EXISTS `types`;
CREATE TABLE `types` (
	`id` 				tinyint 	NOT NULL 	AUTO_INCREMENT,
	`name` 				varchar(8) 	NOT NULL,
	PRIMARY KEY (`id`)
);

DROP TABLE IF EXISTS `hotels`;
CREATE TABLE `hotels` (
	`id` 				int 		 NOT NULL 	AUTO_INCREMENT,
	`name` 				varchar(20)  NOT NULL 						UNIQUE,
	`image` 			varchar(100) NOT NULL 						UNIQUE,
	PRIMARY KEY (`id`)
);

DROP TABLE IF EXISTS `reviews`;
CREATE TABLE `reviews` (
	`id` 				int 		 NOT NULL 	AUTO_INCREMENT,
	`text` 				varchar(300) NOT NULL,
	`raiting` 			int 		 NOT NULL,
	`created_date` 		DATE 	 NOT NULL,
	`hotels_id` 		int 		 NOT NULL,
	`users_id` 			int 		 NOT NULL,
	PRIMARY KEY (`id`)
);

ALTER TABLE `users_roles` 
	ADD CONSTRAINT `users_roles_fk0` 
	FOREIGN KEY (`user_id`) REFERENCES `users`(`id`)
		ON DELETE CASCADE 
		ON UPDATE CASCADE;
        
ALTER TABLE `users_roles` 
	ADD CONSTRAINT `users_roles_fk1` 
	FOREIGN KEY (`roles_id`) REFERENCES `roles`(`id`)
		ON DELETE CASCADE 
		ON UPDATE CASCADE;
        
ALTER TABLE `booking_info` 
	ADD CONSTRAINT `booking_info_fk0` 
	FOREIGN KEY (`room_id`) REFERENCES `rooms`(`id`)
		ON DELETE CASCADE 
		ON UPDATE CASCADE;

ALTER TABLE `booking_info` 
	ADD CONSTRAINT `booking_info_fk1` 
    FOREIGN KEY (`user_id`) REFERENCES `users`(`id`)
		ON DELETE CASCADE 
		ON UPDATE CASCADE;

ALTER TABLE `rooms` 
	ADD CONSTRAINT `rooms_fk0` 
	FOREIGN KEY (`hotel_id`) REFERENCES `hotels`(`id`)
		ON DELETE CASCADE 
		ON UPDATE CASCADE;

ALTER TABLE `rooms` 
	ADD CONSTRAINT `rooms_fk1` 
    FOREIGN KEY (`type_id`) REFERENCES `types`(`id`)
		ON DELETE CASCADE 
		ON UPDATE CASCADE;

ALTER TABLE `reviews` 
	ADD CONSTRAINT `reviews_fk0` 
    FOREIGN KEY (`hotels_id`) REFERENCES `hotels`(`id`)
		ON DELETE CASCADE 
		ON UPDATE CASCADE;

ALTER TABLE `reviews` 
	ADD CONSTRAINT `reviews_fk1` 
    FOREIGN KEY (`users_id`) REFERENCES `users`(`id`)
		ON DELETE CASCADE 
		ON UPDATE CASCADE;








