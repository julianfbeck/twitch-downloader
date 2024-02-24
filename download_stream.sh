#!/bin/bash

# Twitch streamer's username
USERNAME="${TWITCH_USERNAME}"

# Mounted drive directory
MOUNTED_DRIVE="${MOUNTED_DRIVE}"

# Define and create a download directory within the container
DOWNLOAD_DIR="/downloads"
# mkdir -p "${DOWNLOAD_DIR}"

CHECK_INTERVAL="${CHECK_INTERVAL:-300}" # Default to 300 seconds (5 minutes) if not set

BOT_TOKEN="${TELEGRAM_BOT_TOKEN}"
CHAT_ID="${TELEGRAM_CHAT_ID}"

# Function to send a message via Telegram
send_telegram_notification() {
    local message="$1"
    curl -s -X POST "https://api.telegram.org/bot$BOT_TOKEN/sendMessage" -d chat_id="$CHAT_ID" -d text="$message" -d parse_mode="Markdown"
}

send_telegram_notification "Twitch Downloader started"

while true; do
    echo "$(date): Checking for ${USERNAME}'s stream..."

    # Twitch URL
    URL="https://www.twitch.tv/$USERNAME"

    # Filename for the downloaded video
    FILENAME="$(date +%Y%m%d_%H%M%S)_${USERNAME}.mp4"

    # Check if the user is streaming and download using yt-dlp
    yt-dlp -o "${DOWNLOAD_DIR}/${FILENAME}" "$URL" && {

        echo "$(date): Download completed, moving to mounted drive..."

        # Move the downloaded file to the mounted drive
        mv "${DOWNLOAD_DIR}/${FILENAME}" "${MOUNTED_DRIVE}/"

        if [ $? -eq 0 ]; then
            echo "$(date): Successfully moved the stream to the mounted drive."
			send_telegram_notification "🎉 A new stream by $USERNAME is now available! Check it out in the mounted drive."

        else
            echo "$(date): Failed to move the file. Please check the directories and permissions."
        fi
    } || {
        echo "$(date): The user is not streaming at the moment or an error occurred."
    }

    # Wait for the specified interval before checking again
    echo "$(date): Waiting ${CHECK_INTERVAL} seconds before the next check..."
    sleep $CHECK_INTERVAL
done
