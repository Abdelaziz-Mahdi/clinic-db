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

CREATE TABLE invoice_items {
  id int GENERATED ALWAYS AS IDENTITY,
  unit_price decimal,
  quantity int,
  total_price decimal,
  invoice_id int,
  treatment_id int
  PRIMARY KEY(id),
  FOREIGN KEY(treatment_id) REFERENCES treatments(id),
  FOREIGN KEY(invoice_id) REFERENCES invoices(id)
};
CREATE TABLE treatments {
  id int GENERATED ALWAYS AS IDENTITY,
  type varchar,
  name varchar
  PRIMARY KEY(id)
};
CREATE TABLE medical_treatments {
  medical_histories_id int,
  treatments_id int,
  PRIMARY KEY(medical_histories_id, treatments_id),
  FOREIGN KEY(medical_histories_id) REFERENCES medical_histories(id)
  FOREIGN KEY(treatments_id) REFERENCES treatments(id)
};