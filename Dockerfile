FROM python:3.9-alpine3.17
LABEL maintainer = "pythonbasics"

ENV PYTHONUNBUFFERED 1 

# copy requirements from local to docker container 
COPY ./requirements.txt /tmp/requirements.txt
COPY ./requirements.dev.txt /tmp/requirements.dev.txt
COPY ./app /app 
WORKDIR /app
EXPOSE 8000 

# By default set dev to false and leave it to be decided by docker-compose file 
ARG DEV=false
RUN python -m venv /py && \
	/py/bin/pip install --upgrade pip && \
	/py/bin/pip install -r /tmp/requirements.txt && \
	
	if [ $DEV = "true" ]; \ 
		then /py/bin/pip install -r /tmp/requirements.dev.txt ; \
	fi && \

	rm -rf /tmp && \
	adduser \
		--disabled-password \
		--no-create-home \
		django-user 

# update PATH env variable
ENV PATH="/py/bin:$PATH"

# create user namd django-user
USER django-user