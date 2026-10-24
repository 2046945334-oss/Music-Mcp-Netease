FROM python:3.11-slim
# ffmpeg + numpy：给 server/analyze_song.py 用（解码 mp3、算听感曲线）。没有它们分析会报 No module named 'numpy'
RUN apt-get update && apt-get install -y --no-install-recommends ffmpeg && rm -rf /var/lib/apt/lists/* \
 && pip install --no-cache-dir numpy==2.1.3
WORKDIR /app
COPY . .
ENV PORT=8080
EXPOSE 8080
CMD ["python3", "server/music.py"]