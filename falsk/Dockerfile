# run with:
# docker run -p 5000:5000 -it --rm -v $(PWD):/srv/app superr4y/falsk:latest

# NOTE: use app.run(host='0.0.0.0') to run falsk in your app

FROM python:2.7
MAINTAINER superr4y
EXPOSE 5000

# install all tools
RUN pip install flask
RUN mkdir /srv/app
WORKDIR /srv/app
VOLUME /srv/app

CMD python ./app.py
