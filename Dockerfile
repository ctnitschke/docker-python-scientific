FROM debian:latest

RUN apt-get -y update \
&& apt-get install -y libopenblas-dev liblapack-dev python3 python3-pip \
&& pip3 install --upgrade pip \
&& pip3 install numpy scipy matplotlib scikit-learn pandas ipython jupyter \
&& mkdir /data \
&& rm -rf /var/lib/apt/lists/* \
&& groupadd -r einstein \
&& useradd -r -g einstein -d /data -s /sbin/nologin einstein \
&& chown -R einstein:einstein /data

USER einstein
WORKDIR /data

EXPOSE 8888
CMD ["jupyter", "notebook", "--no-browser", "--ip=0.0.0.0", "--notebook-dir=/data"]
