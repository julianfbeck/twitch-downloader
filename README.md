# Twitch Stream Downloader and Notifier

This project consists of a script for automatically downloading live streams from a specified Twitch user and notifying a user via Telegram when a new stream is available. It utilizes `yt-dlp` for downloading streams and the Telegram API for sending notifications.

## Features

- **Automatic Stream Download**: Automatically detects and downloads live streams from a specified Twitch user.
- **Telegram Notifications**: Sends a notification via Telegram when a new stream is downloaded and available.

## Prerequisites

- Docker and Docker Compose
- A Telegram Bot Token and a Chat ID where notifications will be sent

## Setup

## Configuration
1. Copy the `.env.sample` file to a new file named `.env`.
2. Open the `.env` file and replace the placeholder values with your actual data.
   - `TWITCH_USERNAME`: The Twitch username of the streamer you're interested in.
   - `BOT_TOKEN` and `CHAT_ID`: Your Telegram bot's token and the chat ID where you want to send notifications.
   - Adjust other settings as necessary.
3. Save the `.env` file. The application will use these environment variables when running.
