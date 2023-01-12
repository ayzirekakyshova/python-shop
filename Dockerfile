FROM ubuntu

WORKDIR /

COPY . .

RUN apt-get update
RUN apt-get install -y apt-utils
RUN apt install -y python3-pip 
RUN pip install --upgrade pip
RUN pip install wheel gunicorn
RUN pip install -r req.txt 

ENV SECRET_KEY=n8baw0t4tg1#$m*$em$$&8*5kl!h^@-+mj3d(*mn19beo5+%7p 
ENV DB_NAME=railway
ENV DB_USER=postgrest
ENV DB_PASSWORD=postgresql://postgres:iOWJstDmC2HLYWTVFH1T
ENV DEBUG=1
ENV DB_HOST =containers-us-west-120.railway.app
ENV DB_PORT = 8059
ENV ALLOWED_HOSTS = 0.0.0.0,127.0.0.1,django-shop-products
ENV PORT=8000

RUN python3 manage.oy migrate
RUN python3 manage.py collectstatic

CMD gunicorn --bind 0.0.0.0.:$PORT config.wsgi:application
