FROM python:3.12-slim
# Install GCC build dependency
RUN apt-get update && \
    apt-get install -y gcc g++

WORKDIR /sentiments-analysis-docker

COPY requirements.txt /sentiments-analysis-docker

RUN pip install --no-cache-dir -r requirements.txt
RUN python -m spacy download en_core_web_sm

COPY *.py /sentiments-analysis-docker
COPY entrypoint.sh /sentiments-analysis-docker
RUN chmod +x /sentiments-analysis-docker/entrypoint.sh
ENTRYPOINT ["/sentiments-analysis-docker/entrypoint.sh"]