FROM node:20-slim

# Install Python and pip (needed for mcp-server-google-flights)
RUN apt-get update && \
    apt-get install -y python3 python3-pip python3-venv && \
    rm -rf /var/lib/apt/lists/*

# Install supergateway (STDIO to SSE bridge)
RUN npm install -g supergateway

# Install the Google Flights MCP server
RUN python3 -m venv /opt/venv && \
    /opt/venv/bin/pip install mcp-server-google-flights

# Expose the SSE port
EXPOSE 8101

# Run: supergateway bridges the STDIO MCP server to SSE on port 8101
CMD ["supergateway", "--stdio", "/opt/venv/bin/mcp-server-google-flights", "--port", "8101"]
