FROM grahamdumpleton/mod-wsgi-docker:python-2.7

RUN apt-get update && apt-get install -y libfreetype6 libfreetype6-dev \
    libpng++ libpng++-dev && rm -r /var/lib/apt/lists/*

RUN pip install jupyter
RUN pip install ipython[notebook]
RUN pip install matplotlib
RUN pip install sympy

RUN chmod 1777 /app

USER 33

COPY start.sh /app/.whiskey/action_hooks/start

EXPOSE 80

CMD [ "/usr/local/s2i/bin/usage" ]
