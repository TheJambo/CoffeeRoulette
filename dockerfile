FROM python:3.9

# set working directory as app
WORKDIR /CoffeeRoulette

COPY requirements.txt requirements.txt

RUN pip3 install colette

ENV PYTHONPATH "${PYTHONPATH}:/CoffeeRoulette"

RUN pip3 install markupsafe==2.0.1

COPY . .

COPY __init__.py /usr/local/lib/python3.9/site-packages/colette/__init__.py

COPY __main__.py /usr/local/lib/python3.9/site-packages/colette/__main__.py

CMD python ../CoffeeRoulette --path "/CoffeeRoulette/data" new; python ../CoffeeRoulette --path "/CoffeeRoulette/data" email
