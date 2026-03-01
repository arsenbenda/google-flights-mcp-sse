FROM python:3.11-slim
RUN apt-get update && apt-get install -y git nodejs npm && rm -rf /var/lib/apt/lists/*
WORKDIR /app
RUN pip install --no-cache-dir git+https://github.com/HaroldLeo/google-flights-mcp.git
RUN npm install -g supergateway
EXPOSE 8101
CMD ["supergateway", "--stdio", "mcp-server-google-flights", "--port", "8101"]
