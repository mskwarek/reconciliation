


CREATE TABLE ms.order (
    id              INTEGER NOT NULL,
    user_id         INTEGER NOT NULL,
    user_purchase   INTEGER NOT NULL,
    reconsiliated   CHAR(1) NOT NULL
);

ALTER TABLE ms.order ADD CONSTRAINT order_pk PRIMARY KEY ( id );

CREATE TABLE ms.order_to_orderer (
    id         INTEGER NOT NULL,
    order_id   INTEGER NOT NULL,
    user_id    INTEGER NOT NULL
);

ALTER TABLE ms.order_to_orderer ADD CONSTRAINT order_to_orderer_pk PRIMARY KEY ( id );

CREATE TABLE ms.user (
    name      VARCHAR(256) NOT NULL,
    id        INTEGER NOT NULL,
    account   VARCHAR(64)
);

ALTER TABLE ms.user ADD CONSTRAINT user_pk PRIMARY KEY ( id );

ALTER TABLE ms.order_to_orderer
    ADD CONSTRAINT order_to_orderer_order_fk FOREIGN KEY ( order_id )
        REFERENCES order ( id );

ALTER TABLE ms.order_to_orderer
    ADD CONSTRAINT order_to_orderer_user_fk FOREIGN KEY ( user_id )
        REFERENCES ms.user ( id );

ALTER TABLE ms.order
    ADD CONSTRAINT order_user_fk FOREIGN KEY ( user_id )
        REFERENCES ms.user ( id );
