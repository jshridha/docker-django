FROM django:1.9-python3

RUN apt-get update && \
    apt-get install -y build-essential && \
    apt-get install -y libblas-dev liblapack-dev libatlas-base-dev gfortran libjpeg-dev supervisor git && \
    apt-get -y clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN pip install wheel && \
    pip install numpy && \
    pip install scipy && \
    pip install Pillow && \
	pip install celery[redis] && \
	pip install django-bootstrap3==6.2.2 && \
	pip install django-user-accounts==1.3.1 && \
	pip install djangorestframework==3.3.2 && \
	pip install django-debug-toolbar==1.4

ADD *.conf /etc/supervisor/conf.d/

ADD startup.sh /root/startup.sh

RUN chmod +x /root/startup.sh
	
VOLUME /usr/src/app

WORKDIR /usr/src/app

CMD ["/root/startup.sh"]
