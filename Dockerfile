FROM python:3.11-slim
RUN apt-get update && apt-get install -y git --no-install-recommends && rm -rf /var/lib/apt/lists/*
WORKDIR /app
RUN pip install --no-cache-dir git+https://github.com/HaroldLeo/google-flights-mcp.git
RUN pip install --no-cache-dir "fastmcp>=2.0"
EXPOSE 8101
CMD ["python", "-c", "from mcp_server_google_flights.server import mcp; mcp.settings.port=8101; mcp.settings.host='0.0.0.0'; mcp.run(transport='sse')"]
