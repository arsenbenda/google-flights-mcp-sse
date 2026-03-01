FROM python:3.11-slim
RUN apt-get update && apt-get install -y git --no-install-recommends && rm -rf /var/lib/apt/lists/*
WORKDIR /app
RUN pip install --no-cache-dir git+https://github.com/HaroldLeo/google-flights-mcp.git
RUN pip install --no-cache-dir fastmcp
EXPOSE 8101
CMD ["python", "-c", "from mcp_server_google_flights.server import mcp; mcp.run(transport='http', host='0.0.0.0', port=8101)"]
