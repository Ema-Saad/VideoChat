FROM python:3.12-slim

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

ENV PYTHONUNBUFFERED=1
ENV PORT=8080

CMD ["sh", "-c", "python manage.py migrate && gunicorn videoChat.wsgi --bind 0.0.0.0:$PORT --workers 4"]