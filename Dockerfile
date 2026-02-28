FROM node:20-slim

# Install supergateway (STDIO to SSE bridge)
RUN npm install -g supergateway

# Install the pre-built MCP Google Flights server from Docker Hub's source
# We clone and install directly from the working repo
RUN apt-get update && \
    apt-get install -y python3 python3-pip python3-venv git && \
    rm -rf /var/lib/apt/lists/*

RUN python3 -m venv /opt/venv && \
    /opt/venv/bin/pip install --upgrade pip && \
    /opt/venv/bin/pip install google-flights-mcp

EXPOSE 8101

CMD ["supergateway", "--stdio", "/opt/venv/bin/google-flights-mcp", "--port", "8101"]
