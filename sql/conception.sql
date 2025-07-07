CREATE TABLE finance_Etablissement_Financier (
   id INT,
   nom_etablissement VARCHAR(50),
   fonds INT,
   PRIMARY KEY(id)
);

CREATE TABLE finance_Type_Pret (
   id INT,
   libelle VARCHAR(50),
   taux DECIMAL(10,2),
   duree_max INT,
   PRIMARY KEY(id)
);

CREATE TABLE finance_Clients (
   id INT,
   nom VARCHAR(50),
   email VARCHAR(50),
   PRIMARY KEY(id)
);

CREATE TABLE finance_Pret (
   id_type_pret INT,
   id_client INT,
   id INT,
   montant_mensuel INT,
   montant_pret INT,
   date_pret DATE,
   date_fin DATE,
   PRIMARY KEY(id_type_pret, id_client, id),
   FOREIGN KEY(id_type_pret) REFERENCES Type_Pret(id),
   FOREIGN KEY(id_client) REFERENCES Clients(id)
);

CREATE TABLE finance_Type_Transaction (
   id INT,
   libelle VARCHAR(50),
   PRIMARY KEY(id)
);

CREATE TABLE finance_Type_Mouvement (
   id INT,
   libelle VARCHAR(50),
   PRIMARY KEY(id)
);

CREATE TABLE finance_Transaction (
   id_type_pret INT,
   id_client INT,
   id_pret INT,
   id_etablissement INT,
   id_type_transaction INT,
   id INT,
   date_transaction DATE,
   montant INT,
   PRIMARY KEY(id_type_pret, id_client, id_pret, id_etablissement, id_type_transaction, id),
   FOREIGN KEY(id_type_pret, id_client, id_pret) REFERENCES Pret(id_type_pret, id_client, id),
   FOREIGN KEY(id_etablissement) REFERENCES Etablissement_Financier(id),
   FOREIGN KEY(id_type_transaction) REFERENCES Type_Transaction(id)
);