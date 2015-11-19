FROM django:1.8.6-python3

RUN apt-get update && \
    apt-get install -y build-essential && \
    apt-get install -y libblas-dev liblapack-dev libatlas-base-dev gfortran libjpeg-dev && \
    apt-get -y clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN pip install wheel && \
    pip install numpy && \
    pip install scipy && \
    pip install Pillow

VOLUME /usr/src/app

WORKDIR /usr/src/app

CMD ["python", "-u", "manage.py", "runserver", "0.0.0.0:8000"]
