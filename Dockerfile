FROM python:3.11-slim
RUN apt-get update && apt-get install -y git --no-install-recommends && rm -rf /var/lib/apt/lists/*
WORKDIR /app
RUN pip install --no-cache-dir git+https://github.com/HaroldLeo/google-flights-mcp.git
RUN pip install --no-cache-dir "fastmcp>=2.0"
EXPOSE 8101
ENV FASTMCP_PORT=8101
ENV FASTMCP_HOST=0.0.0.0
CMD ["python", "-c", "import os; os.environ['FASTMCP_PORT']='8101'; os.environ['FASTMCP_HOST']='0.0.0.0'; from mcp_server_google_flights.server import mcp; mcp.run(transport='sse')"]
