-- MySchool Sample Database Schema

DROP DATABASE IF EXISTS `MySchool`;
CREATE DATABASE IF NOT EXISTS `MySchool`;
USE `MySchool`;

-- -----------------------------------------------------
-- Table `MySchool`.`Students`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MySchool`.`Students` (
  `id` INT(1) NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(20),
  `last_name` VARCHAR(20),
  `age` INT(1),
  PRIMARY KEY (`id`),
  INDEX `first_name` (`first_name` ASC)
) Engine = InnoDB;

-- -----------------------------------------------------
-- Table `MySchool`.`Exams`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MySchool`.`Grades` (
  `id` INT(1) NOT NULL AUTO_INCREMENT,
  `grade` INT(1),
  `student_id` INT(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `grade` (`grade` ASC),
    FOREIGN KEY (`student_id`)
    REFERENCES `MySchool`.`Students` (`id`)
    ON DELETE CASCADE
) Engine = InnoDB;

-- -----------------------------------------------------
-- Table `MySchool`.`Exams`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MySchool`.`Exams` (
  `id` INT(1) NOT NULL AUTO_INCREMENT,
  `student_id` INT(1) NULL DEFAULT NULL,
  `score` INT(1) NULL DEFAULT NULL,
  `status` VARCHAR(20) DEFAULT NULL,
  `exam_status` BOOLEAN,
  PRIMARY KEY (`id`),
  INDEX `score` (`score` DESC),
    FOREIGN KEY (`student_id`)
    REFERENCES `MySchool`.`Students` (`id`)
    ON DELETE CASCADE
) Engine = InnoDB;


-- Tables created, starting Dumping now;

#
# Dumping data for table 'Students'
#
INSERT INTO `MySchool`.`Students` (`first_name`, `last_name`, `age`)
VALUES
  ('Jorge', 'Nends', 37),
  ('Ana', 'Flor', 23),
  ('Joana', 'Bela', 33),
  ('Andre', 'Molina', 23),
  ('Betina', 'Mendes', 35),
  ('Carlos', 'Berer', 31),
  ('Betina', 'Mendes', 35),
  ('Gregor', 'Hands', 23);

#
# Dumping data for table 'Grades'
#
INSERT INTO `MySchool`.`Grades` (`grade`, `student_id`)
VALUES
  (5, 1),
  (5, 2),
  (5, 7),
  (5, 8),
  (6, 3),
  (6, 4),
  (6, 5),
  (6, 6);

#
# Dumping data for table 'Exams'
#
INSERT INTO `MySchool`.`Exams` (`student_id`, `score`, `status`, `exam_status`)
VALUES
  (1, 88, 'Approved', true),
  (2, 78, 'Not approved yet', true),
  (3, 98, 'Approved', true),
  (4, 68, 'Not approved yet', true),
  (5, 35, 'Not approved yet', true),
  (6, NULL, NULL, false),
  (7, NULL, NULL, false),
  (8, NULL, NULL, false);

