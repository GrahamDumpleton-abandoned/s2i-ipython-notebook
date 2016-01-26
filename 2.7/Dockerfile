FROM grahamdumpleton/warp0-python27-debian8

USER 0

RUN apt-get update && apt-get install -y libfreetype6 libfreetype6-dev \
    libpng++ libpng++-dev liblapack-dev libatlas-dev gfortran && \
    rm -r /var/lib/apt/lists/*

USER 1001

RUN pip install --no-cache-dir jupyter ipython[notebook] matplotlib \
    sympy ipyparallel scipy

COPY ipython/ /home/warpdrive/ipython/
COPY jupyter/ /home/warpdrive/jupyter/

COPY app.sh /home/warpdrive/app.sh

ENV WARPDRIVE_SHELL_FILE=/home/warpdrive/app.sh

EXPOSE 8080

EXPOSE 10000-10011
