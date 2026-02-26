FROM alpine:latest AS alpine
FROM n8nio/n8n:latest

# Copy apk and its dependencies from the temporary Alpine image
COPY --from=alpine /sbin/apk /sbin/apk
COPY --from=alpine /usr/lib/libapk.so* /usr/lib/

USER root
RUN apk add --no-cache ffmpeg
USER node
