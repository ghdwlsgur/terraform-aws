FROM ubuntu 

RUN apt-get update && apt-get install -y curl 



COPY ./network-configs /network-configs
COPY ./aws-provider.tf / 
COPY ./instance.tf /
COPY ./key.tf / 
CMD curl -v https://releases.hashicorp.com/terraform-provider-tls/0.1.0/terraform-provider-tls_0.1.0_SHA256SUMS && tail -f /dev/null