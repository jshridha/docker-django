FROM django:1.9-python3

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
	pip install git+https://github.com/pinax/django-user-accounts.git@3200318e208b5f3a3f2fd01e6c1af19f7f2aaa8e && \
	pip install djangorestframework

ADD *.conf /etc/supervisor/conf.d/

ADD startup.sh /root/startup.sh

RUN chmod +x /root/startup.sh
	
VOLUME /usr/src/app

WORKDIR /usr/src/app

CMD ["/root/startup.sh"]
