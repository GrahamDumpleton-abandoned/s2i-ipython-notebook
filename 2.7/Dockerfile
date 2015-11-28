FROM grahamdumpleton/mod-wsgi-docker:python-2.7

RUN apt-get update && apt-get install -y libfreetype6 libfreetype6-dev \
    libpng++ libpng++-dev && rm -r /var/lib/apt/lists/*

RUN pip install jupyter
RUN pip install ipython[notebook]
RUN pip install matplotlib
RUN pip install sympy
RUN pip install ipyparallel

RUN chmod 1777 /app

USER 33

COPY start.sh /app/.whiskey/action_hooks/start

COPY profile /.whiskey/ipython/profile_default

EXPOSE 8080

EXPOSE 10000-10011

CMD [ "mod_wsgi-docker-start" ]
