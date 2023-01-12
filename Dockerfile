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

CMD gunicorn --bind 0.0.0.0.:8000 config.wsgi:application
