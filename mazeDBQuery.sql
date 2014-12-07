CREATE schema mazeDB;

use mazeDB;

CREATE table `users`(
`username` VARCHAR(20) NOT NULL,
`password` CHAR(32) NOT NULL,
`email` VARCHAR(255) NOT NULL,
PRIMARY KEY(`username`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8; 

INSERT INTO `users`(`username`, `password`, `email`) VALUES
('bori','admin1','bori@gmail.com'),
('borko','admin2','borko@abv.bg'),
('halil','admin3','halil@mail.bg'),
('tanya','admin4','tanya@yahoo.com');

SELECT username FROM `users`;

CREATE table `userstatistics`(
`user` VARCHAR(20) NOT NULL,
`level` INT(100) NOT NULL,
`high score` INT NOT NULL,
`wins` INT NOT NULL,
FOREIGN KEY(`user`) REFERENCES `users`(`username`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

SELECT user FROM `userstatistics`;
ALTER TABLE `userstatistics`
  ADD CONSTRAINT `user_statistics_1` FOREIGN KEY (`user`) REFERENCES `users` (`username`) ON DELETE CASCADE ON UPDATE CASCADE;
 
INSERT INTO `users`(`username`, `password`, `email`) VALUES
('vladi','vladi','vladi@gmail.com');

INSERT INTO `userstatistics`(`user`, `level`, `high score`,`wins`) VALUES
('bori',1,0,0),
('borko',1,0,0),
('halil',1,0,0),
('tanya',1,0,0);

SELECT * FROM `users` AS users
LEFT JOIN `userstatistics` AS stat
on users.username=stat.user;

DELETE FROM users WHERE username=`vladi` limit 1;

INSERT INTO `userstatistics`(`user`, `level`, `high score`,`wins`) VALUES
('vladi',1,0,0);