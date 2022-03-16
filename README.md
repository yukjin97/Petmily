# Petmily

``
CREATE TABLE `product`
(
    `prod_num`           int          NOT NULL,
    `prod_img`           varchar(255) NULL,
    `prod_title`         varchar(30)  NULL,
    `prod_category`      varchar(10)  NULL,
    `prod_name`          varchar(50)  NULL,
    `prod_price`         int          NULL,
    `prod_solo`          int          NULL,
    `prod_silver`        int          NULL,
    `prod_gold`          int          NULL,
    `prod_create_date`   datetime     NULL,
    `prod_update_date`   datetime     NULL,
    `prod_modified_date` datetime     NULL,
    `prod_view_cnt`      int          NULL,
    `prod_content`       varchar(255) NULL,
    `prod_allamount`     int          NULL,
    `remain_amount`      int          NULL,
    `prod_amount`        int          NULL
);

CREATE TABLE `Membership`
(
    `user_id`          varchar(15) NULL,
    `mem_grade`        varchar(20) NULL,
    `mem_start_date`   datetime    NULL,
    `mem_restart_date` datetime    NULL,
    `mem_next_date`    datetime    NULL,
    `mem_last_date`    datetime    NULL
);

CREATE TABLE `review`
(
    `review_num`           int          NOT NULL,
    `prod_num`             int          NOT NULL,
    `review_content`       varchar(255) NULL,
    `review_rate`          varchar(10)  NULL,
    `review_create_date`   datetime     NULL,
    `review_modified_date` datetime     NULL,
    `review_title`         varchar(15)  NOT NULL
);

CREATE TABLE `user`
(
    `user_id`         varchar(15)  NULL,
    `user_pwd`        varchar(20)  NULL,
    `user_name`       varchar(15)  NULL,
    `user_nickname`   varchar(20)  NULL,
    `user_email`      varchar(30)  NULL,
    `user_address1`   varchar(100) NULL,
    `user_address2`   varchar(100) NULL,
    `user_zipcode`    varchar(15)  NULL,
    `user_totaddress` varchar(200) NULL,
    `user_phone`      varchar(20)  NULL,
    `user_type`       varchar(10)  NULL
);

CREATE TABLE `Order`
(
    `Order_num`    int         NOT NULL,
    `user_id`      varchar(15) NULL,
    `prod_num`     int         NOT NULL,
    `Order_status` varchar(20) NULL,
    `Order_count`  int         NULL,
    `Order_date`   datetime    NULL
);

CREATE TABLE `Cart`
(
    `Cart_amount` int         NOT NULL COMMENT '' df '',
    `user_id`     varchar(15) NULL,
    `prod_num`    int         NOT NULL,
    `cart_num`    int         NULL
);

ALTER TABLE `product`
    ADD CONSTRAINT `PK_PRODUCT` PRIMARY KEY (
                                             `prod_num`
        );

ALTER TABLE `review`
    ADD CONSTRAINT `PK_REVIEW` PRIMARY KEY (
                                            `review_num`
        );

ALTER TABLE `user`
    ADD CONSTRAINT `PK_USER` PRIMARY KEY (
                                          `user_id`
        );

ALTER TABLE `Order`
    ADD CONSTRAINT `PK_ORDER` PRIMARY KEY (
                                           `Order_num`
        );

ALTER TABLE `Cart`
    ADD CONSTRAINT `PK_CART` PRIMARY KEY (
                                          `Cart_amount`
        );


``

https://www.youtube.com/watch?v=teV65V_MJAk
