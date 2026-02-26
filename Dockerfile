FROM alpine:latest AS alpine
FROM n8nio/n8n:latest

# Copy apk and its dependencies from the temporary Alpine image
COPY --from=alpine /sbin/apk /sbin/apk
COPY --from=alpine /usr/lib/libapk.so* /usr/lib/

USER root
# Install ffmpeg, python3, and wget
RUN apk add --no-cache ffmpeg python3 wget

# Download the absolute newest yt-dlp directly from the source and make it executable
RUN wget https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp -O /usr/local/bin/yt-dlp
RUN chmod a+rx /usr/local/bin/yt-dlp

USER node
