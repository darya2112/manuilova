FROM ubuntu:20.04
COPY . /1.sh
RUN chmod ugo+rwx 1.sh
WORKDIR /1.sh
CMD bash 1.sh
