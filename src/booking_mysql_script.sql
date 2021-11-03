CREATE TABLE `users` (
	`id` 		int 		NOT NULL 	AUTO_INCREMENT,
	`login` 	varchar(20) NOT NULL 	AUTO_INCREMENT 	UNIQUE,
	`password`  varchar(20) NOT NULL 	AUTO_INCREMENT 	UNIQUE,
	PRIMARY KEY (`id`)
);

CREATE TABLE `roles` (
	`id` 		BINARY 		NOT NULL 	AUTO_INCREMENT,
	`name` 		varchar(5) 	NOT NULL 					UNIQUE,
	PRIMARY KEY (`id`)
);

CREATE TABLE `users_roles` (
	`id` 		int 		NOT NULL 	AUTO_INCREMENT,
	`user_id` 	int 		NOT NULL 	AUTO_INCREMENT,
	`roles_id` 	BINARY 		NOT NULL 	AUTO_INCREMENT,
	PRIMARY KEY (`id`)
);

CREATE TABLE `booking_info` (
	`id` 		int 		NOT NULL 	AUTO_INCREMENT,
	`booking_date` DATE 	NOT NULL,
	`room_id` 	int 		NOT NULL,
	`user_id` 	int 		NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `rooms` (
	`id` 		int 		NOT NULL 	AUTO_INCREMENT,
	`number` 	int 		NOT NULL 	AUTO_INCREMENT,
	`hotel_id` 	int 		NOT NULL,
	`type_id` 	tinyint 	NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `types` (
	`id` 		tinyint 	NOT NULL 	AUTO_INCREMENT,
	`name` 		varchar(8) 	NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `hotels` (
	`id` 		int 		 NOT NULL 	AUTO_INCREMENT,
	`name` 		varchar(20)  NOT NULL 						UNIQUE,
	`image` 	varchar(100) NOT NULL 						UNIQUE,
	PRIMARY KEY (`id`)
);

CREATE TABLE `reviews` (
	`id` 		int 		 NOT NULL 	AUTO_INCREMENT,
	`text` 		varchar(300) NOT NULL,
	`raiting` 	int 		 NOT NULL,
	`created_date` DATE 	 NOT NULL,
	`hotels_id` int 		 NOT NULL,
	`users_id` 	int 		 NOT NULL,
	PRIMARY KEY (`id`)
);

ALTER TABLE `users_roles` ADD CONSTRAINT `users_roles_fk0` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`);

ALTER TABLE `users_roles` ADD CONSTRAINT `users_roles_fk1` FOREIGN KEY (`roles_id`) REFERENCES `roles`(`id`);

ALTER TABLE `booking_info` ADD CONSTRAINT `booking_info_fk0` FOREIGN KEY (`room_id`) REFERENCES `rooms`(`id`);

ALTER TABLE `booking_info` ADD CONSTRAINT `booking_info_fk1` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`);

ALTER TABLE `rooms` ADD CONSTRAINT `rooms_fk0` FOREIGN KEY (`hotel_id`) REFERENCES `hotels`(`id`);

ALTER TABLE `rooms` ADD CONSTRAINT `rooms_fk1` FOREIGN KEY (`type_id`) REFERENCES `types`(`id`);

ALTER TABLE `reviews` ADD CONSTRAINT `reviews_fk0` FOREIGN KEY (`hotels_id`) REFERENCES `hotels`(`id`);

ALTER TABLE `reviews` ADD CONSTRAINT `reviews_fk1` FOREIGN KEY (`users_id`) REFERENCES `users`(`id`);









