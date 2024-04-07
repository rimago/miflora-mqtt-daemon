##Miflora-mqtt-daemon  Docker image
#Builds compact image to run as an alternative to installing the modules/service.  

FROM python:3.10.7-slim 
RUN apt-get update && apt-get install bluez gcc libglib2.0-dev build-essential git -y && apt-get clean
COPY requirements.txt /app/requirements.txt
WORKDIR /app/
RUN pip install -r requirements.txt
COPY . /app

ENV PATH=/root/.local/bin:$PATH

CMD [ "python3", "./miflora-mqtt-daemon.py", "--config_dir", "/config" ]
