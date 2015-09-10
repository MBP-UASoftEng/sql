-- Table: transaction

-- DROP TABLE transaction;

CREATE TABLE transaction
(
  id uuid NOT NULL,
  cashierid uuid NOT NULL,
  amount numeric(10,2) NOT NULL,
  transactiontype integer NOT NULL,
  parentid uuid,
  createdon timestamp without time zone NOT NULL,
  CONSTRAINT transaction_pkey PRIMARY KEY (id),
  CONSTRAINT transaction_cashierid_fkey FOREIGN KEY (cashierid)
      REFERENCES employee (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT transaction_parentid_fkey FOREIGN KEY (parentid)
      REFERENCES product (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH (
  OIDS=FALSE
);
ALTER TABLE transaction
  OWNER TO postgres;