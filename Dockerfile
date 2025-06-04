FROM python:3.11
RUN apt-get update && apt-get install -y python3-distutils
ENV PYTHONUNBUFFERED 1
WORKDIR /code

COPY . /code/

RUN pip install -r requirements.txt

VOLUME ["/code/db"]
EXPOSE 8000
CMD sh init.sh && python3 manage.py runserver 0.0.0.0:8000
