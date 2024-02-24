# Twitch Stream Downloader and Notifier

This project consists of a script for automatically downloading live streams from a specified Twitch user and notifying a user via Telegram when a new stream is available. It utilizes `yt-dlp` for downloading streams and the Telegram API for sending notifications.

## Features

- **Automatic Stream Download**: Automatically detects and downloads live streams from a specified Twitch user.
- **Telegram Notifications**: Sends a notification via Telegram when a new stream is downloaded and available.

## Prerequisites

- Docker and Docker Compose
- A Telegram Bot Token and a Chat ID where notifications will be sent

## Setup

Configure the docker-compose.yml

```yml
version: '3.8'
services:
  twitch-downloader:
    build: .
    environment:
      - TWITCH_USERNAME=melkey
      - DOWNLOAD_DIR=/usr/src/app/downloads
      - MOUNTED_DRIVE=/mnt/mounted_drive
      - CHECK_INTERVAL=300

    volumes:
      - /Volumes/Media/other/incomplete:/downloads
      - /Volumes/Media/other/twitch:/mnt/mounted_drive


```