FROM python:3.11.10-slim

WORKDIR /app/
ADD ./requirements.txt /app/

RUN python -m pip install --upgrade pip setuptools wheel -i https://nexus3.gs.dogwof.com:8088/repository/pip-group/simple
RUN pip install -r requirements.txt -i https://nexus3.gs.dogwof.com:8088/repository/pip-group/simple

WORKDIR /app/
ADD . /app/

VOLUME /app/data
EXPOSE 7837

ENTRYPOINT ["sh", "./action.sh"]