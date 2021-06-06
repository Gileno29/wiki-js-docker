# wiki-js-docker

<img src="https://res.cloudinary.com/practicaldev/image/fetch/s--31kz0eFU--/c_imagga_scale,f_auto,fl_progressive,h_420,q_auto,w_1000/https://dev-to-uploads.s3.amazonaws.com/i/qrfrajefv1o01zv8nfju.png"/> <img src="https://img.shields.io/badge/JavaScript-323330?style=for-the-badge&logo=javascript&logoColor=F7DF1E"/> <img src="https://img.shields.io/badge/Node.js-43853D?style=for-the-badge&logo=node-dot-js&logoColor=white"/> 


*******
<h3>Sobre:</h3>


O Wiki.js é um software de documentação que segue em estilo wiki rodando no Node.js e escrito em JavaScript.


<div id='requerimentos'/>

*******
<h3>Requerimentos:</h3>


<ul>
  <li>Sistema operacional Linux. No projeto foi usado um ambiente controlado, uma VM criada no Virtual Box e usando o SO <a href="https://docs.docker.com/compose/install/">CentOS 7.</a></li>
  <li>Git</li>
  <li>Deve possuir o <a href="https://docs.docker.com/engine/install/centos/">Docker</a> e também o <a href="https://docs.docker.com/engine/install/centos/">Docker-compose</a> para a segunda parte do projeto
</ul>


Todos os comandos aqui podem ser consultados  na <a href="https://docs.requarks.io/">documentção oficial</a> do software


*******
<h2>Instalação Docker Centos 7 via respositório:</h2>
  Caso possua uma instalação antiga, remova:
  
    sudo yum remove docker \
                  docker-client \
                  docker-client-latest \
                  docker-common \
                  docker-latest \
                  docker-latest-logrotate \
                  docker-logrotate \
                  docker-engine

  Após remover qualquer versão antiga do Docker será nessário a instalação de alguns utilitários para adicionar o source-list do Docker ao Centos e em seguida 
  a adicionar o source-list:
  
     sudo yum install -y yum-utils

     sudo yum-config-manager \
           --add-repo \
           https://download.docker.com/linux/centos/docker-ce.repo
    
   
  
  Agora basta apenas fazer a instalação:
  
      sudo yum install docker-ce docker-ce-cli containerd.io
    
 
 *******
<h2>configurando o Dockerfile:</h2>

para esse projeto foi usado 2 Dockerfiles que estão em diretórios diferentes, eles foram criados com as configurações básicas para buildar as imagens que serão executadas no ambiente para subir o serviço, sendo que o Dockerfile da imagem do postgres contém um arquivo .sql que vai executar no entrypoint do serviço um script que cria o banco de dados da apilicação e o usuário e senha.

   Crie  a estrutura de diretórios:
            
       mkdir bd-setup && mkdir wiki-setup
    
   Dentro do bd-setup crie o arqui init.sql e o Dockerfile:
      
       vi init.sql
       
   conteudo do arquivo init.sql:
       
       CREATE USER wikiuser WITH password 'wiki1234';

       ALTER USER wikiuser WITH SUPERUSER CREATEDB CREATEROLE INHERIT LOGIN REPLICATION;

       CREATE DATABASE wikijs WITH OWNER wikiuser;
       
   criando o Dockerfile:
  
       vi init.sql
       
   conteudo do arquivo Dockerfile:
  
       FROM postgres:11-alpine
       COPY init.sql /docker-entrypoint-initdb.d/
       LABEL CUSTON_BY="seunome"
       
       

  
   acesso o diretório do wiki-setup para criar o Dockerfile da do serviço:
   
       cd ../wiki-setup
      
       vi Dockerfile
      
   
   conteudo do Dockerfile da wiki:
   
       FROM requarks/wiki:2
       ENV WIKI_ADMIN_EMAIL=seuemail@dominio.com
       ENV DB_HOST=postgres-db
       ENV DB_TYPE=postgres
       ENV DB_PORT=5432
       ENV DB_USER=wikiuser
       ENV DB_PASS=wiki1234
       ENV DB_NAME=wikijs

 
 
  OBS: o arquivo Dockerfile deve ser criado exatamente com essa nomenclatura.
 
 *******
 <h3>Buildando as imagens do apartir dos Dockerfiles:</h3>
     
   acesse os respectivos diretórios para buildar as imagens:
        
      cd /db-setup
      Docker build -t postgres-wiki .
      
      cd /wiki-setup
      Docker build -t my-wiki-js .
    
   você pode checar se as imagens foram criadas com o seguinte comando:
     
      docker image ls -a
      
 *******    
 <h3>Criando os containers Docker:</h3>
 
   Com a build das imagens prontas pode ser criado os containers, os crie exatamente nessa ordem:
    
      docker run -d -p 5432:5432 --name postgres-db -p 5432:5432 -e POSTGRES_PASSWORD=123456  postgres-wiki:latest
      
      docker run -d -p 8080:3000  --link postgres-db:db --name wiki --restart unless-stopped  my-wiki-js:latest
    
 
 
 
