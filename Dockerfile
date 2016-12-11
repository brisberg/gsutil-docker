FROM debian:jessie

RUN apt-get update && apt-get install -y --no-install-recommends python wget ca-certificates && apt-get clean

RUN wget https://storage.googleapis.com/pub/gsutil.tar.gz  && tar xfz gsutil.tar.gz -C $HOME && rm gsutil.tar.gz
ENV PATH ${PATH}:/root/gsutil

CMD ["gsutil","--version"]
