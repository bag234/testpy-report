
FROM python:3.11-alpine

RUN apk update && apk add --no-cache build-base linux-headers pkgconfig && rm -rf /var/cache/apk/*
WORKDIR /app

COPY src/requirements.txt .

RUN pip install --no-cache-dir --upgrade pip && pip install --no-cache-dir -r requirements.txt

COPY src/ .

RUN adduser -D dockeruser
USER dockeruser

EXPOSE 5000

CMD ["python", "run.py"]