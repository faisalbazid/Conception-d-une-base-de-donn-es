/*==============================================================*/
/* Nom de SGBD :  MySQL 5.0                                     */
/* Date de création :  3/1/2022 12:51:59 PM                     */
/*==============================================================*/


drop table if exists Client;

drop table if exists Commande;

drop table if exists DetailCommande;

drop table if exists Produit;

/*==============================================================*/
/* Table : Client                                               */
/*==============================================================*/
create table Client
(
   ClientCode           varchar(254) not null,
   Nom                  varchar(254),
   Prenom               varchar(254),
   Adress               varchar(254),
   Phone                varchar(254),
   Email                varchar(254),
   Password             varchar(254),
   primary key (ClientCode)
);

/*==============================================================*/
/* Table : Commande                                             */
/*==============================================================*/
create table Commande
(
   Reference            int not null,
   ClientCode           varchar(254) not null,
   OrderDate            date,
   DeliveryAdresse      varchar(254),
   primary key (Reference)
);

/*==============================================================*/
/* Table : DetailCommande                                       */
/*==============================================================*/
create table DetailCommande
(
   ProduitCode          int not null,
   Reference            int not null,
   OrderQuantite        int,
   primary key (ProduitCode, Reference)
);

/*==============================================================*/
/* Table : Produit                                              */
/*==============================================================*/
create table Produit
(
   ProduitCode          int not null,
   Libelle              varchar(254),
   Description          varchar(254),
   Prixunitaire         double,
   QuantiteStock        int,
   Image                varchar(254),
   primary key (ProduitCode)
);

alter table Commande add constraint FK_Association2 foreign key (ClientCode)
      references Client (ClientCode) on delete restrict on update restrict;

alter table DetailCommande add constraint FK_Association1 foreign key (Reference)
      references Commande (Reference) on delete restrict on update restrict;

alter table DetailCommande add constraint FK_Association1 foreign key (ProduitCode)
      references Produit (ProduitCode) on delete restrict on update restrict;

