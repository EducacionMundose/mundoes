

#curl -sS https://www.eksworkshop.com/intermediate/230_logging/deploy.files/es_domain.json \
#| envsubst > ~/environment/logging/es_domain.json

aws es create-elasticsearch-domain --cli-input-json file://~/environment/logging/es_domain.json

# Comprobar si se desplego
#
if [ $(aws es describe-elasticsearch-domain --domain-name "eksworkshop-logging" --query 'DomainStatus.Processing') == "false" ]; then tput setaf 2; echo "The Elasticsearch cluster is ready"; else tput setaf 1;echo "The Elasticsearch cluster is NOT
ready"; fi