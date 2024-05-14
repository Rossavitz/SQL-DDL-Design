DROP DATABASE IF EXISTS medical_center;

CREATE DATABASE medical_center;

\c medical_center

CREATE TABLE hospital
(
    id SERIAL PRIMARY KEY,
    hospital_name TEXT NOT NULL,
    city TEXT NOT NULL,
    phone INTEGER NOT NULL
);

INSERT INTO hospital
(hospital_name, city, phone)
VALUES
('Southside', 'Bayshore', 1234567),
('Peconic Bay', 'Riverhead', 9876543),
('Manhattan General', 'New York City', 8888888);

CREATE TABLE diseases
(
    id SERIAL PRIMARY KEY,
    disease TEXT NOT NULL,
    contagious BOOLEAN NOT NULL,
    deadly BOOLEAN NOT NULL
);

INSERT INTO diseases
(disease, contagious, deadly)
VALUES
('Congenital Heart Disease', false, false),
('COVID 19', true, true),
('Chicken Pox', true, false);

CREATE TABLE patients
(
    id SERIAL PRIMARY KEY,
    f_name TEXT NOT NULL,
    l_name TEXT NOT NULL,
    age INTEGER NOT NULL,
    insurance BOOLEAN NOT NULL,
    diseases_id INTEGER REFERENCES diseases(id)
);

INSERT INTO patients
(f_name, l_name, age, insurance, diseases_id)
VALUES
('Justin', 'Mather', 27, TRUE, 1),
('Justin', 'Mather', 27, TRUE, 2),
('Sarah', 'Finch', 48, TRUE, 2),
('Sarah', 'Finch', 48, TRUE, 3),
('Brandi', 'Hasper', 8, FALSE, 3);

CREATE TABLE doctors
(
    id SERIAL PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    specialty TEXT NOT NULL,
    patients_id INTEGER REFERENCES patients (id),
    hospital_id INTEGER REFERENCES hospital (id)
);

INSERT INTO doctors
(first_name, last_name, specialty, patients_id, hospital_id)
VALUES
('John', 'Smith', 'Cardiologist', 1, 1),
('John', 'Smith', 'Cardiologist', 3, 3),
('Lisa', 'Turner', 'Surgeon', 2, 1),
('Lisa', 'Turner', 'Surgeon', 4, 2),
('Bob', 'Walsh', 'Infection Specialist', 5, 2);