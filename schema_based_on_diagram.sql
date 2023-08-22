CREATE TABLE medical_histories {
  id int GENERATED ALWAYS AS IDENTITY,
  admitted_at timestamp,
  patient_id int,
  status varchar,
  PRIMARY KEY(id),
  FOREIGN KEY(patient_id) REFERENCES patients(id)
};

CREATE TABLE patients {
  id int GENERATED ALWAYS AS IDENTITY,
  name varchar,
  date_of_birth date
  PRIMARY KEY(id)
};

CREATE TABLE invoices {
  id int GENERATED ALWAYS AS IDENTITY,
  total_amount decimal,
  generated_at timestamp,
  payed_at timestamp,
  medical_history_id int
  PRIMARY KEY(id),
  FOREIGN KEY(medical_history_id) REFERENCES medical_histories(id)
};