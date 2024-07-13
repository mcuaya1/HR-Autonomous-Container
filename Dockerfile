FROM ubuntu:22.04


#Updating packages and install packages
RUN apt-get update && apt-get upgrade \
    && apt-get install --no-install-recommends -y build-essential libssl-dev libffi-dev python3 python3-pip python3-dev wget \
    && pip3 install --no-cache-dir Flask \
    && rm -rf /var/lib/apt/lists/* 

#Copying flask file into directory
COPY app.py /srv/

#Expose port docker should listen on 
EXPOSE 5000

ENV FLASK_APP=/srv/app.py

#Setting work directory
WORKDIR /srv/

#https://www.reddit.com/r/docker/comments/xwfm08/why_do_i_need_to_specify_host0000_when_running_a/
CMD ["flask", "run", "--host", "0.0.0.0"]


#How to run and see output
#Allows to interact with container 
#-i == interactivate
#-t == TTY session 
#docker run -it hr_autonmous

#How to run deattachable
#docker run -d hr_autonmous
