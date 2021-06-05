FROM requarks/wiki:2
ENV WIKI_ADMIN_EMAIL gileno.cr.duarte@gmail.com
COPY ./config.yml /var/wiki

