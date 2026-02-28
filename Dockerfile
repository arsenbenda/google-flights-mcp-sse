FROM python:3.11-slim

# Install Node.js for supergateway
RUN apt-get update && \
    apt-get install -y nodejs npm && \
    rm -rf /var/lib/apt/lists/*

# Install supergateway
RUN npm install -g supergateway

# Install the Google Flights MCP server
RUN pip install --no-cache-dir google-flights-mcp

EXPOSE 8101

CMD ["supergateway", "--stdio", "google-flights-mcp serve", "--port", "8101"]
