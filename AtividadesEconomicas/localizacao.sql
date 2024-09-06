CREATE TABLE "tipo_logradouro" (
	"sigla"	TEXT NOT NULL,
	"nome"	TEXT,
	PRIMARY KEY("sigla")
);

insert into tipo_logradouro values('ACS','Acesso');
insert into tipo_logradouro values('ALA','Alameda');
insert into tipo_logradouro values('AVE','Avenida');
insert into tipo_logradouro values('BEC','Beco');
insert into tipo_logradouro values('EST','Estrada');
insert into tipo_logradouro values('LRG','Largo');
insert into tipo_logradouro values('PCA','Praça');
insert into tipo_logradouro values('ROD','Rodvia');
insert into tipo_logradouro values('RUA','Rua');
insert into tipo_logradouro values('TRE','Trevo');
insert into tipo_logradouro values('TRV','Travessa');
insert into tipo_logradouro values('VDP','Via de Pedestre');
insert into tipo_logradouro values('VDT','Viaduto');
insert into tipo_logradouro values('VIA','Via');

CREATE TABLE "regional" (
	"nome"	TEXT NOT NULL,
	PRIMARY KEY("nome")
);

insert into regional values('Barreiro');
insert into regional values('Centro-Sul');
insert into regional values('Leste');
insert into regional values('Nordeste');
insert into regional values('Noroeste');
insert into regional values('Norte');
insert into regional values('Oeste');
insert into regional values('Pampulha');
insert into regional values('Venda Nova');

CREATE TABLE "bairro" (
	"nome"	TEXT NOT NULL,
	PRIMARY KEY("nome")
);

CREATE TABLE "logradouro" (
	"id"	INTEGER NOT NULL,
	"tipo"  TEXT NOT NULL,
	"nome"	TEXT NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);

CREATE TABLE "endereco" (
	"logradouro"	INTEGER NOT NULL,
	"numero" INTEGER NOT NULL,
	"bairro"  TEXT NOT NULL,
	"cep"	  TEXT NOT NULL,
	"regional"	TEXT NOT NULL,
	PRIMARY KEY("logradouro", "numero" ),
	FOREIGN KEY("logradouro") REFERENCES "logradouro"("id"),
	FOREIGN KEY("bairro") REFERENCES "bairro"("nome"),
	FOREIGN KEY("regional") REFERENCES "regional"("nome")
);
