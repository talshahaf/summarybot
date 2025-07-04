FROM ubuntu:24.04

USER root
WORKDIR /app

ENV TZ=Asia/Jerusalem
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt update && apt install -y --no-install-recommends \
    python3 \
    python3-pip \
    && rm -rf /var/lib/apt/lists/*

RUN python3 -m pip install --upgrade python-dateutil openai tiktoken python-telegram-bot --break-system-packages

COPY bot.py creds.json .
CMD ["python3", "bot.py"]
