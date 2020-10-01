FROM python:3.8

LABEL author="bynect <bynect@gmail.com>"

RUN pip install hypercorn[uvloop] hypercorn[trio] fastapi \
    --no-cache-dir --no-color --no-python-version-warning --disable-pip-version-check

COPY ./start.sh /start.sh
RUN chmod +x /start.sh

COPY ./hypercorn_conf.py /hypercorn_conf.py

COPY ./reload.sh /start-reload.sh
RUN chmod +x /start-reload.sh

COPY ./app /app

WORKDIR /app

ENV PYTHON_PATH=/app

EXPOSE 80
EXPOSE 443

CMD ["/start.sh"]