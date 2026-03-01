FROM node:20-slim
RUN apt-get update && apt-get install -y python3 python3-pip python3-venv git --no-install-recommends && rm -rf /var/lib/apt/lists/*
WORKDIR /app
RUN python3 -m venv /opt/venv
RUN /opt/venv/bin/pip install --no-cache-dir git+https://github.com/HaroldLeo/google-flights-mcp.git
RUN npm install -g supergateway
EXPOSE 8101
CMD ["supergateway", "--stdio", "/opt/venv/bin/mcp-server-google-flights", "--port", "8101"]
