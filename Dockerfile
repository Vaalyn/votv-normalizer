FROM python:3.13-alpine AS base

FROM base AS builder
RUN mkdir /ffmpeg
WORKDIR /ffmpeg

ARG TARGETARCH
RUN wget https://johnvansickle.com/ffmpeg/releases/ffmpeg-release-${TARGETARCH}-static.tar.xz
RUN tar -xf ffmpeg-release-${TARGETARCH}-static.tar.xz -C /ffmpeg --strip-components=1

FROM base
COPY --from=builder /ffmpeg/ffmpeg /usr/local/bin
COPY --from=builder /ffmpeg/ffprobe /usr/local/bin
RUN pip3 install ffmpeg-normalize
RUN chmod +x /usr/local/bin/ffmpeg /usr/local/bin/ffprobe

RUN apk update && apk add parallel

ENTRYPOINT ["ffmpeg-normalize"]
