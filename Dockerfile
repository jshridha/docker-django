FROM django:1.8.6-python3

RUN apt-get update && \
    apt-get install -y build-essential && \
    apt-get install -y libblas-dev liblapack-dev libatlas-base-dev gfortran libjpeg-dev supervisor && \
    apt-get -y clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN pip install wheel && \
    pip install numpy && \
    pip install scipy && \
    pip install Pillow && \
	pip install celery[redis] && \
	pip install django-bootstrap3 && \
	pip install django-user-accounts

ADD *.conf /etc/supervisor/conf.d/

ADD startup.sh /root/startup.sh

RUN chmod +x /root/startup.sh
	
VOLUME /usr/src/app

WORKDIR /usr/src/app

CMD ["/root/startup.sh"]
