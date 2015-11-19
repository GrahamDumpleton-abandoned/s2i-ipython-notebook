#!/bin/sh

exec ipython notebook --no-browser --debug --log-level=DEBUG --notebook-dir=/app --ip=0.0.0.0 --port=8080
