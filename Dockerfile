# Docker version 17.05.0-ce
# CTF scoreboard application on Raspberry Pi with L-tika

FROM yuki/ctfscore:v1.1

MAINTAINER yuki

ENV APP_DIR /var/www/ctfscore
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install patch -y

RUN apt-get update && \
    apt-get install python python-pip python-dev gcc make vim -y && \
    pip install rpi.gpio

COPY etc/* $APP_DIR/etc/scripts/

RUN chmod +x $APP_DIR/etc/scripts/ltika.py

RUN /usr/bin/patch /var/www/ctfscore/fuel/app/classes/controller/score.php $APP_DIR/etc/scripts/controller-score.patch

RUN /usr/bin/patch /var/www/ctfscore/fuel/app/classes/model/score.php $APP_DIR/etc/scripts/model-score.patch

COPY container-entrypoint.sh $APP_DIR/etc/scripts/.
RUN chmod +x $APP_DIR/etc/scripts/container-entrypoint.sh

EXPOSE 80 3306 8080
CMD $APP_DIR/etc/scripts/container-entrypoint.sh
