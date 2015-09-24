CREATE TABLE tenderEntry (
  
  recordID uuid NOT NULL,
  transactionID uuid NOT NULL,
  tenderType Char(10) NOT NULL,
  amount numeric(10,2) NOT NULL,
  createdon timestamp without time zone NOT NULL,
  
  CONSTRAINT tenderEntry_pkey PRIMARY KEY (recordID),
  CONSTRAINT tenderEntry_fkey FOREIGN KEY (transactionID)
      REFERENCES transaction (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
  -- I need to check that the tenderType is one of a set of valid values
  -- The valid values are: Cash, gift, Mastercard, VISA, Discover, AMEX, Debit
  -- Also. I can't execute the script in pgAdmin. It says there's some kind of error, but doesn't specify what it is

)

WITH (
  OIDS = FALSE
);

ALTER TABLE tenderEntry
  OWNER TO postgres;