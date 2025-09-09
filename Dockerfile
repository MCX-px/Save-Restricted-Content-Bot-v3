FROM python:3.10-slim

# Update apt and install only required packages
RUN apt-get update && apt-get install -y \
    git \
    curl \
    ffmpeg \
    python3-pip \
    wget \
    bash \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY requirements.txt .
RUN pip3 install wheel
RUN pip3 install --no-cache-dir -r requirements.txt

COPY . .

EXPOSE 5000

CMD flask run -h 0.0.0.0 -p 5000 & python3 main.py
