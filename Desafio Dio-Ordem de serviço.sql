--- criacao de banco de dados para o cenario Oficina
create database oficina;
use oficina;

--- criar tabela cliente

create table clients( 
       idClient int auto_increment primary key,
       Fname varchar(10),
       Minit char(3),
       Lname varchar(20),
       CPF char(11) not null,
       Address varchar(30),
       constraint unique_cpf_cliente unique (CPF)
);

desc client;

--- criar tabela produto

create table product(
        idProduct int auto_increment primary key,
        Pname varchar(10),
		Carmodel varchar(15);
        Quantityestoque int
    
);

desc product;

 create table payments(
        idCient int,
        idPayment int,
        typePayment enum ('boleto', 'cartao',' transferencia bancaria'),
	    primary key( idClient, idpayment)
);        
         
desc payments;

 --- criar tabela Ordem de servico
 
 create table ordersService(
		idOrder int auto_increment primary key,
        idOrderClient int,
        orderStatus enum('cancelado','confirmado','em andamento') default 'em processamento',
        orderDescription varchar(255),
        idproduct int,
        Idservice int,
        finaldate date,
        workhours numeric,
        constraint fk_order_client foreign key (idOrderClient) references clients(idCliente)
                    on update cascade
);

desc ordersService;

--- criar tabela estoque

create table productStorage(
       idprodStorage int auto_increment primary key,
       storageLocation varchar(255),
       quantity int default 0
);      

desc productStorage;
        
--- criar tabela empregado (Mecanicos)

create table employee(
        idemployee int auto_increment primary key,
        Name varchar (255) not null,
        Cpf char(15) not null,
        especiality varchar(100) not null,
        constraint unique_employee unique (CPF)
);        
 
 desc employee;
 
  
 create table productOrder(
        idPOproduct int,
        idPOorder int,
        poQuantity int default 1,
        poStatus enum ('disponivel','sem estoque') default 'disponivel',
        primary key (idPOproduct, idPOorder),
        constraint fk_productorder_selller foreign key (idPOproduct) references product(idProduct),
        constraint fk_productorder_product foreign key (ipPOorder) references orders(idOrder)
  );      
        
desc productOrder;
        

  
desc productSuplier;
  
show tables;

show databases;
use information_schema;
show tables;
desc referential_constraints;
select * from referential_constraints where constraint_schema = 'ecommerce';

  