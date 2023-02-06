-- Eliminamos la base de de datos en caso de que exista y se vuelve a crear
CREATE OR REPLACE DATABASE metro CHARACTER SET = 'utf8mb4' COLLATE = 'utf8mb4_unicode_ci';

USE metro;


CREATE TABLE IF NOT EXISTS `trains_types` (
    `id` BIGINT(20) UNSIGNED AUTO_INCREMENT,
    `name` VARCHAR(255) NOT NULL,
    `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    `deleted_at` TIMESTAMP NULL,
    CONSTRAINT `PK_trains_types` PRIMARY KEY (id),
    CONSTRAINT `UQ_train_type_name` UNIQUE (`name`, `deleted_at`)
) DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `trains` (
    `serial_number` VARCHAR(10),
    `type_id` BIGINT(20) UNSIGNED NOT NULL,
    `year` YEAR(4) NOT NULL,
    `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    `deleted_at` TIMESTAMP NULL,
    CONSTRAINT `PK_trains` PRIMARY KEY (serial_number),
    CONSTRAINT `FK_trains_train_type` FOREIGN KEY (`type_id`) REFERENCES trains_types(`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `lines` (
    `id` BIGINT(20) UNSIGNED AUTO_INCREMENT,
    `name` VARCHAR(255) NOT NULL,
    `colour`CHAR(7) NOT NULL,
    `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    `deleted_at` TIMESTAMP NULL,
    CONSTRAINT `PK_lines` PRIMARY KEY (id),
    CONSTRAINT `UQ_line_name` UNIQUE (`name`, `deleted_at`),
    CONSTRAINT `UQ_colour` UNIQUE (`colour`, `deleted_at`),
    CONSTRAINT `CHK_hex_colour` CHECK (colour REGEXP '^#([0-9a-f]{3}){1,2}$')
) DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `trains_lines` (
    `id` BIGINT(20) UNSIGNED AUTO_INCREMENT,
    `train_serial_number` VARCHAR(10) NOT NULL,
    `line_id` BIGINT(20) UNSIGNED NOT NULL,
    `start_date` DATE NOT NULL,
    `end_date` DATE NULL,
    `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    `deleted_at` TIMESTAMP NULL,
    CONSTRAINT `PK_trains_lines` PRIMARY KEY (id),
    CONSTRAINT `UQ_union_serial_number_line_id_start_date` UNIQUE (`train_serial_number`, `line_id`, `start_date`, `deleted_at`),
    CONSTRAINT `FK_trains_lines_serial_number` FOREIGN KEY (`train_serial_number`) REFERENCES trains(`serial_number`) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `FK_line_id` FOREIGN KEY (`line_id`) REFERENCES `lines`(`id`) ON DELETE CASCADE ON UPDATE CASCADE
) DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `stations` (
    `id` BIGINT(20) UNSIGNED AUTO_INCREMENT,
    `name` VARCHAR(255) NOT NULL,
    `location` POINT NOT NULL,
    `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    `deleted_at` TIMESTAMP NULL,
    CONSTRAINT `PK_stations` PRIMARY KEY (id),
    CONSTRAINT `UQ_station_name` UNIQUE (`name`, `deleted_at`)
) DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `lines_stations` (
    `id` BIGINT(20) UNSIGNED AUTO_INCREMENT,
    `station_id` BIGINT(20) UNSIGNED NOT NULL,
    `line_id` BIGINT(20) UNSIGNED NOT NULL,
    `start_date` DATE NOT NULL,
    `end_date` DATE NULL,
    `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    `deleted_at` TIMESTAMP NULL,
    CONSTRAINT `PK_lines_stations` PRIMARY KEY (id),
    CONSTRAINT `UQ_union_station_id_line_id_start_date` UNIQUE (`station_id`, `line_id`, `start_date`, `deleted_at`),
    CONSTRAINT `FK_station_id` FOREIGN KEY (`station_id`) REFERENCES stations(`id`) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `FK_line_id_stations` FOREIGN KEY (`line_id`) REFERENCES `lines`(`id`) ON DELETE CASCADE ON UPDATE CASCADE
) DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;