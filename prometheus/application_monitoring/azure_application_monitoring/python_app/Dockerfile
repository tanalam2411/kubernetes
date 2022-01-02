#FROM python:alpine
FROM python:3.8
WORKDIR /app
COPY main.py /app
COPY requirements.txt /app
RUN cd /app && pip install -r requirements.txt
EXPOSE 8000 8001
CMD ["python", "/app/main.py"]