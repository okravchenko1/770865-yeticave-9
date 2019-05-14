INSERT INTO categories (id, category_name, code)
VALUES ('1', 'Доски и лыжи', 'boards'),
       ('2', 'Крепления', 'attachment'),
       ('3', 'Ботинки', 'boots'),
       ('4', 'Одежда', 'clothing'),
       ('5', 'Инструменты', 'tools'),
       ('6', 'Разное', 'other');

-- добавление пользователей
INSERT INTO users (id, reg_date, email, username, password, avatar, contact)
VALUES ('1', '2019-05-10 13:21:15', 'vladimir@mail.ru', 'Владимир', 'GbnFr6!ff', 'img/user.jpg',
        'Россия, Москва, ул. Севастопольская, д. 12, кв. 55 тел. 495 324-55-37'),
       ('2', '2019-05-10 14:47:31', 'akrupnov@yandex.ru', 'Андрей', '123456qqr', 'img/user.jpg',
        'Россия, Москва, ул. Полярная, д. 97, кв. 31 тел. 495 608-14-56');

-- добавление объявлений
INSERT INTO lots (id, creation_date, name, description, image, start_price, end_date, lot_step, category_id, author_id,
                  win_id)
VALUES ('1', '2019-05-10 09:15:46', '2014 Rossignol District Snowboard', 'no description', 'img/lot-1.jpg', 10999,
        '2019-05-30 23:59:59', 200, 1, 2, NULL),
       ('2', '2019-05-11 14:47:11', 'DC Ply Mens 2016/2017 Snowboard', 'no description', 'img/lot-2.jpg', 159999,
        '2019-05-30 23:59:59', 1000, 1, 1, NULL),
       ('3', '2019-05-09 18:52:07', 'Крепления Union Contact Pro 2015 года размер L/XL', 'no description',
        'img/lot-3.jpg', 8000, '2019-05-30 23:59:59', 100, 2, 2, NULL),
       ('4', '2019-05-08 11:20:03', 'Ботинки для сноуборда DC Mutiny Charocal', 'no description', 'img/lot-4.jpg',
        10999, '2019-05-30 23:59:59', 200, 3, 2, NULL),
       ('5', '2019-05-09 08:16:57', 'Куртка для сноуборда DC Mutiny Charocal', 'no description', 'img/lot-5.jpg', 7500,
        '2019-05-30 23:59:59', 100, 4, 1, NULL),
       ('6', '2019-05-11 17:50:33', 'Маска Oakley Canopy', 'no description', 'img/lot-6.jpg', 5400,
        '2018-05-30 23:59:59', 100, 6, 1, NULL),
       ('7', '2019-05-11 12:29:10', 'Сноуборд Snow Snake CUSTOM U1 (15-16), 140 см', 'no description', 'img/lot-7.jpg',
        7000, '2019-05-30 23:59:59', 100, 4, 1, NULL);

-- добавление ставок
INSERT INTO bets (date, bet_sum, user_id, lot_id)
VALUES ('2019-05-10 21:15:02', 8200, 1, 3),
       ('2019-05-10 17:25:30', 7600, 2, 5),
       ('2019-05-12 19:23:11', 160999, 1, 2);

-- выбор всех категорий (получить все категории)
SELECT id, category_name, code
FROM categories;

-- выбор новых лотов (получить самые новые, открытые лоты. Каждый лот должен включать название, стартовую цену, ссылку на изображение, цену, количество ставок, название категории)
SELECT l.id,
       l.name,
       l.start_price,
       l.image,
       MAX(b.bet_sum)  AS bet_price,
       COUNT(b.lot_id) AS bet_count,
       c.category_name
FROM bets b
         LEFT JOIN lots l
                   ON b.lot_id = l.id
         JOIN categories c
              ON l.category_id = c.id
WHERE NOW() < l.end_date
GROUP BY l.id
ORDER BY l.creation_date DESC;

-- выбор лота по его id (показать лот по его id. Получение названия категории, к которой принадлежит лот)
SELECT l.id, l.name, c.category_name
FROM lots l
         LEFT JOIN categories c
                   ON l.category_id = c.id
WHERE c.id = '2';

-- обновление лота (обновить название лота по его идентификатору)
UPDATE lots
SET name = 'Крепления Union Contact Pro 2015 года размер L/XL S++'
WHERE id = '3';

-- выбор свежих ставок (получить список самых свежих ставок для лота по его идентификатору;)
SELECT *
FROM bets
WHERE lot_id = '2'
ORDER BY date DESC;