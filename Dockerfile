FROM debian:testing
MAINTAINER yan <a0726h77@gmail.com>

ADD apt.conf /etc/apt/

RUN apt-get update
RUN apt-get install -y git python2.7-minimal wget

RUN wget --no-check-certificate https://bitbucket.org/pypa/setuptools/raw/bootstrap/ez_setup.py
RUN python2.7 ez_setup.py
RUN easy_install pip

RUN git clone https://github.com/a0726h77/flask-mvc.git
RUN pip install -r flask-mvc/requirements.txt

EXPOSE 8080

WORKDIR /flask-mvc
ENTRYPOINT ["python2.7"]
CMD ["runserver.py"]
