-- SpotifyClone Sample Database Schema

    DROP DATABASE IF EXISTS `SpotifyClone`;
    CREATE DATABASE IF NOT EXISTS `SpotifyClone`;
    USE `SpotifyClone`;

    -- -----------------------------------------------------
    -- Table `SpotifyClone`.`plans`
    -- -----------------------------------------------------
    CREATE TABLE IF NOT EXISTS `SpotifyClone`.`plans` (
      `id` INT(11) NOT NULL AUTO_INCREMENT,
      `plan` VARCHAR(20),
      `price` DECIMAL(19,2),
      PRIMARY KEY (`id`),
      INDEX `plan` (`plan` ASC)
    ) Engine = InnoDB;

    -- -----------------------------------------------------
    -- Table `SpotifyClone`.`users`
    -- -----------------------------------------------------
    CREATE TABLE IF NOT EXISTS `SpotifyClone`.`users` (
      `id` INT(11) NOT NULL AUTO_INCREMENT,
      `plan_id` INT(11) NULL DEFAULT NULL,
      `user_name` VARCHAR(50),
      `age` INT(11),
      PRIMARY KEY (`id`),
      INDEX `user_name` (`user_name` ASC),
        FOREIGN KEY (`plan_id`)
        REFERENCES `SpotifyClone`.`plans` (`id`)
        ON DELETE NO ACTION
        ON UPDATE NO ACTION
    ) Engine = InnoDB;

    -- -----------------------------------------------------
    -- Table `SpotifyClone`.`artists`
    -- -----------------------------------------------------
    CREATE TABLE IF NOT EXISTS `SpotifyClone`.`artists` (
      `id` INT(11) NOT NULL AUTO_INCREMENT,
      `artist_name` VARCHAR(20),
      PRIMARY KEY (`id`),
      INDEX `artist_name` (`artist_name` ASC)
    ) Engine = InnoDB;

    -- -----------------------------------------------------
    -- Table `SpotifyClone`.`albums`
    -- -----------------------------------------------------
    CREATE TABLE IF NOT EXISTS `SpotifyClone`.`albums` (
      `id` INT(11) NOT NULL AUTO_INCREMENT,
      `album_name` VARCHAR(20),
      `artist_id` INT(11),
      `released` YEAR(4),
      PRIMARY KEY (`id`),
      INDEX `album_name` (`album_name` ASC),
        FOREIGN KEY (`artist_id`)
        REFERENCES `SpotifyClone`.`artists` (`id`)
        ON DELETE NO ACTION
        ON UPDATE NO ACTION
    ) Engine = InnoDB;

    -- -----------------------------------------------------
    -- Table `SpotifyClone`.`tracks`
    -- -----------------------------------------------------
    CREATE TABLE IF NOT EXISTS `SpotifyClone`.`tracks` (
      `id` INT(11) NOT NULL AUTO_INCREMENT,
      `track` VARCHAR(50),
      `album_id` INT NOT NULL,
      `duration` TIME,
      PRIMARY KEY (`id`),
        FOREIGN KEY (`album_id`)
        REFERENCES `SpotifyClone`.`albums` (`id`)
        ON DELETE NO ACTION
        ON UPDATE NO ACTION
      ) Engine = InnoDB;

    -- -----------------------------------------------------
    -- Table `SpotifyClone`.`followed_artist`
    -- -----------------------------------------------------
    CREATE TABLE IF NOT EXISTS `SpotifyClone`.`followed_artist` (
      `id` INT(11) NOT NULL AUTO_INCREMENT,
      `user_id` INT(11),
      `artist_id` INT(11),
      PRIMARY KEY (`id`, `user_id`, `artist_id`),
        FOREIGN KEY (`user_id`)
        REFERENCES `SpotifyClone`.`users` (`id`)
        ON DELETE NO ACTION
        ON UPDATE NO ACTION,
        FOREIGN KEY (`artist_id`)
        REFERENCES `SpotifyClone`.`artists` (`id`)
        ON DELETE NO ACTION
        ON UPDATE NO ACTION
    ) Engine = InnoDB;

    -- -----------------------------------------------------
    -- Table `SpotifyClone`.`play_history`
    -- -----------------------------------------------------
    CREATE TABLE IF NOT EXISTS `SpotifyClone`.`play_history` (
      `id` INT(11) NOT NULL AUTO_INCREMENT,
      `user_id` INT(11),
      `track_id` INT(11),
      `date` DATETIME NULL DEFAULT NULL,
      PRIMARY KEY (`id`, `user_id`, `track_id`),
      INDEX `date` (`date` DESC),
        FOREIGN KEY (`user_id`)
        REFERENCES `SpotifyClone`.`users` (`id`)
        ON DELETE NO ACTION
        ON UPDATE NO ACTION,
        FOREIGN KEY (`track_id`)
        REFERENCES `SpotifyClone`.`tracks` (`id`)
        ON DELETE NO ACTION
        ON UPDATE NO ACTION
    ) Engine = InnoDB;


    -- Tables created, starting Dumping now;

    #
    # Dumping data for table 'plans'
    #
    INSERT INTO `SpotifyClone`.`plans` (`plan`, `price`)
    VALUES
      ('gratuito', 0),
      ('familiar', 7.99),
      ('universitário', 5.99),
      ('pessoal', 6.99);

    #
    # Dumping data for table 'users'
    #
    INSERT INTO `SpotifyClone`.`users` (`plan_id`, `user_name`, `age`)
    VALUES
      (1, 'Thati', 23),
      (2, 'Cintia', 35),
      (3, 'Bill', 20),
      (4, 'Roger', 45),
      (4, 'Norman', 58),
      (2, 'Patrick', 33),
      (3, 'Vivian', 26),
      (3, 'Carol', 19),
      (2, 'Angelina', 42),
      (2, 'Paul', 46);

    #
    # Dumping data for table 'artists'
    #
    INSERT INTO `SpotifyClone`.`artists` (`artist_name`)
    VALUES
      ('Fog'),
      ('Freedie Shannon'),
      ('Lance Day'),
      ('Tyler Isle'),
      ('Peter Strong'),
      ('Walter Phoenix');

    #
    # Dumping data for table 'artists'
    #
    INSERT INTO `SpotifyClone`.`albums` (`album_name`, `artist_id`, `released`)
    VALUES
      ('Envious', 6, '1990'),
      ('Exuberant', 6, '1993'),
      ('Hallowed Steam', 5, '1995'),
      ('Incandescent', 3, '1998'),
      ('Temporary Culture', 2, '2001'),
      ('Library of liberty', 2, '2003'),
      ('Chained Down', 4, '2007'),
      ('Cabinet of fools', 4, '2012'),
      ('No guarantees', 4, '2015'),
      ('Apparatus', 1, '2015');

    #
    # Dumping data for table 'tracks'
    #
    INSERT INTO `SpotifyClone`.`tracks` (`track`, `album_id`, `duration`)
    VALUES
      ('Soul For Us', 1, SEC_TO_TIME(200)),
      ('Reflections Of Magic', 1, SEC_TO_TIME(163)),
      ('Dance With Her Own', 1, SEC_TO_TIME(116)),
      ('Troubles Of My Inner Fire', 2, SEC_TO_TIME(203)),
      ('Time Fireworks', 2, SEC_TO_TIME(152)),
      ('Magic Circus', 3, SEC_TO_TIME(105)),
      ('Honey, So Do I', 3, SEC_TO_TIME(207)),
      ("Sweetie, Let's Go Wild", 3, SEC_TO_TIME(139)),
      ("She Knows", 3, SEC_TO_TIME(244)),
      ("Fantasy For Me", 4, SEC_TO_TIME(100)),
      ("Celebration Of More", 4, SEC_TO_TIME(146)),
      ("Rock His Everything", 4, SEC_TO_TIME(223)),
      ("Home Forever", 4, SEC_TO_TIME(231)),
      ("Diamond Power", 4, SEC_TO_TIME(241)),
      ("Let's Be Silly", 4, SEC_TO_TIME(132)),
      ("Thang Of Thunder", 5, SEC_TO_TIME(240)),
      ("Words Of Her Life", 5, SEC_TO_TIME(185)),
      ("Without My Streets", 5, SEC_TO_TIME(176)),
      ("Need Of The Evening", 6, SEC_TO_TIME(190)),
      ("History Of My Roses", 6, SEC_TO_TIME(222)),
      ("Without My Love", 6, SEC_TO_TIME(111)),
      ("Walking And Game", 6, SEC_TO_TIME(123)),
      ("Young And Father", 6, SEC_TO_TIME(197)),
      ("Finding My Traditions", 7, SEC_TO_TIME(179)),
      ("Walking And Man", 7, SEC_TO_TIME(229)),
      ("Hard And Time", 7, SEC_TO_TIME(135)),
      ("Honey, I'm A Lone Wolf", 7, SEC_TO_TIME(150)),
      ("She Thinks I Won't Stay Tonight", 8, SEC_TO_TIME(166)),
      ("He Heard You're Bad For Me", 8, SEC_TO_TIME(154)),
      ("He Hopes We Can't Stay", 8, SEC_TO_TIME(210)),
      ("I Know I Know", 8, SEC_TO_TIME(117)),
      ("He's Walking Away", 9, SEC_TO_TIME(159)),
      ("He's Trouble", 9, SEC_TO_TIME(138)),
      ("I Heard I Want To Bo Alone", 9, SEC_TO_TIME(120)),
      ("I Ride Alone", 9, SEC_TO_TIME(151)),
      ("Honey", 10, SEC_TO_TIME(79)),
      ("You Cheated On Me", 10, SEC_TO_TIME(95)),
      ("Wouldn't It Be Nice", 10, SEC_TO_TIME(213)),
      ("Baby", 10, SEC_TO_TIME(136)),
      ("You Make Me Feel So..", 10, SEC_TO_TIME(83));

    #
    # Dumping data for table 'play_history'
    #
    INSERT INTO `SpotifyClone`.`play_history` (`user_id`, `track_id`, `date`)
    VALUES
      (1, 36, '2020-02-28 10:45:55'),
      (1, 25, '2020-05-02 05:30:35'),
      (1, 23, '2020-03-06 11:22:33'),
      (1, 14, '2020-08-05 08:05:17'),
      (1, 15, '2020-09-14 16:32:22'),
      (2, 34, '2020-01-02 07:40:33'),
      (2, 24, '2020-05-16 06:16:22'),
      (2, 21, '2020-10-09 12:27:48'),
      (2, 39, '2020-09-21 13:14:46'),
      (3, 6, '2020-11-13 16:55:13'),
      (3, 3, '2020-12-05 18:38:30'),
      (3, 26, '2020-07-30 10:00:00'),
      (4, 2, '2021-08-15 17:10:10'),
      (4, 35, '2021-07-10 15:20:30'),
      (4, 27, '2021-01-09 01:44:33'),
      (5, 7, '2020-07-03 19:33:28'),
      (5, 12, '2017-02-24 21:14:22'),
      (5, 14, '2020-08-06 15:23:43'),
      (5, 1, '2020-11-10 13:52:27'),
      (6, 38, '2019-02-07 20:33:48'),
      (6, 29, '2017-01-24 00:31:17'),
      (6, 30, '2017-10-12 12:35:20'),
      (6, 22, '2018-05-29 14:56:41'),
      (7, 5, '2018-05-09 22:30:49'),
      (7, 4, '2020-07-27 12:52:58'),
      (7, 11, '2018-01-16 18:40:43'),
      (8, 39, '2018-03-21 16:56:40'),
      (8, 40, '2020-10-18 13:38:05'),
      (8, 32, '2019-05-25 08:14:03'),
      (8, 33, '2021-08-15 21:37:09'),
      (9, 16, '2021-05-24 17:23:45'),
      (9, 17, '2018-12-07 22:48:52'),
      (9, 8, '2021-03-14 06:14:26'),
      (9, 9, '2020-04-01 03:36:00'),
      (10, 20, '2017-02-06 08:21:34'),
      (10, 21, '2017-12-04 05:33:43'),
      (10, 12, '2017-07-27 05:24:49'),
      (10, 13, '2017-12-25 01:03:57');

    #
    # Dumping data for table 'followed_artist'
    #
    INSERT INTO `SpotifyClone`.`followed_artist` (`user_id`, `artist_id`)
    VALUES
      (1, 6),
      (1, 2),
      (1, 3),
      (2, 6),
      (2, 3),
      (3, 5),
      (3, 6),
      (4, 2),
      (5, 4),
      (5, 1),
      (6, 1),
      (6, 3),
      (6, 6),
      (7, 5),
      (7, 4),
      (8, 6),
      (8, 4),
      (9, 1),
      (9, 2),
      (9, 3),
      (10, 5),
      (10, 1);