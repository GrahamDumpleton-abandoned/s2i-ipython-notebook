FROM grahamdumpleton/warp0-python27-debian8

USER 0

RUN apt-get update && apt-get install -y libfreetype6 libfreetype6-dev \
    libpng++ libpng++-dev liblapack-dev libatlas-dev gfortran && \
    rm -r /var/lib/apt/lists/*

USER 1001

RUN pip install --no-cache-dir jupyter ipython[notebook] matplotlib \
    sympy ipyparallel scipy

COPY profile /home/warpdrive/ipython/profile_default
COPY config.py /home/warpdrive/jupyter/jupyter_notebook_config.py

COPY start.sh /home/warpdrive/action_hooks/start

ENV WARPDRIVE_SHELL_FILE=/home/warpdrive/action_hooks/start

EXPOSE 8080

EXPOSE 10000-10011
