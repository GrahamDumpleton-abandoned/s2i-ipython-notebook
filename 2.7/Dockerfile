FROM grahamdumpleton/mod-wsgi-docker:python-2.7

RUN apt-get update && apt-get install -y libfreetype6 libfreetype6-dev \
    libpng++ libpng++-dev liblapack-dev libatlas-dev gfortran && \
    rm -r /var/lib/apt/lists/*

RUN pip install --no-cache-dir jupyter ipython[notebook] matplotlib \
    sympy ipyparallel scipy

USER 1001

COPY start.sh /app/.whiskey/action_hooks/start

COPY profile /home/whiskey/ipython/profile_default
COPY config.py /home/whiskey/jupyter/jupyter_notebook_config.py

EXPOSE 8080

EXPOSE 10000-10011

CMD [ "mod_wsgi-docker-start" ]
