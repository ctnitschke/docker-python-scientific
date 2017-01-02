FROM ubuntu:latest

RUN apt-get -y update \
&& apt-get install -y libopenblas-dev liblapack-dev python3 python3-pip \
&& pip3 install --upgrade pip \
&& pip3 install numpy scipy matplotlib scikit-learn pandas ipython jupyter \
&& mkdir /data \
&& rm -rf /var/lib/apt/lists/*

CMD echo "done" > /dev/null