FROM python:3.11-slim

WORKDIR /app

RUN pip install --no-cache-dir google-flights-mcp

EXPOSE 8101

CMD ["google-flights-mcp", "serve", "--transport", "http", "--host", "0.0.0.0", "--port", "8101"]
