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

  #Crie  a estrutura de diretórios:
            
       mkdir bd-setup && mkdir wiki-setup
    
  #Dentro do bd-setup crie o arqui init.sql e o Dockerfile:
      
       vi init.sql
       
  #conteudo do arquivo init.sql:
       
       CREATE USER wikiuser WITH password 'wiki1234';

       ALTER USER wikiuser WITH SUPERUSER CREATEDB CREATEROLE INHERIT LOGIN REPLICATION;

       CREATE DATABASE wikijs WITH OWNER wikiuser;

       
 
#Technologies & Tools
<img src="https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white"> <img src="https://img.shields.io/badge/Linux-FCC624?style=for-the-badge&logo=linux&logoColor=black"> <img src="https://img.shields.io/badge/Python-3776AB?style=for-the-badge&logo=python&logoColor=white"> <img src="https://img.shields.io/badge/HTML5-E34F26?style=for-the-badge&logo=html5&logoColor=white"> <img src="https://img.shields.io/badge/JavaScript-F7DF1E?style=for-the-badge&logo=javascript&logoColor=black"> <img src="https://img.shields.io/badge/CSS3-1572B6?style=for-the-badge&logo=css3&logoColor=white"> <img src="https://img.shields.io/badge/PHP-777BB4?style=for-the-badge&logo=php&logoColor=white"> <img src="https://img.shields.io/badge/Bootstrap-563D7C?style=for-the-badge&logo=bootstrap&logoColor=white"> <img src="https://img.shields.io/badge/jQuery-0769AD?style=for-the-badge&logo=jquery&logoColor=white">

<img src="https://img.shields.io/badge/Django-092E20?style=for-the-badge&logo=django&logoColor=white"> <img src="https://img.shields.io/badge/MySQL-00000F?style=for-the-badge&logo=mysql&logoColor=white"> <img src="https://img.shields.io/badge/PostgreSQL-316192?style=for-the-badge&logo=postgresql&logoColor=white">




[![Anurag's GitHub stats](https://github-readme-stats.vercel.app/api?username=Gileno29&show_icons=true&theme=dark)](https://github.com/anuraghazra/github-readme-stats)    [![Top Langs](https://github-readme-stats.vercel.app/api/top-langs/?username=Gileno29&langs_count=8&layout=compact&show_icons=true&theme=dark)](https://github.com/anuraghazra/github-readme-stats)
