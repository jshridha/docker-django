FROM django:1.9-python3

RUN apt-get update && \
    apt-get install -y build-essential && \
    apt-get install -y libblas-dev liblapack-dev libatlas-base-dev gfortran libjpeg-dev supervisor git nodejs npm && \
    ln -s /usr/bin/nodejs /usr/bin/node && \
    apt-get -y clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN pip install wheel && \
    pip install numpy && \
    pip install scipy

ADD *.conf /etc/supervisor/conf.d/

ADD startup.sh /root/startup.sh

RUN chmod +x /root/startup.sh
	
VOLUME /usr/src/app

WORKDIR /usr/src/app

CMD ["/root/startup.sh"]
