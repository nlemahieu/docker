FROM elasticsearch:1.7.4

RUN plugin -install mobz/elasticsearch-head

EXPOSE 9200
EXPOSE 9300
