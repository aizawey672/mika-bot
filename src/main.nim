import global, std/[asyncdispatch, os], dimscord

# Load Discord token from enviroment
let auth = getEnv("DISCORD_AUTH")
if auth.len == 0: raise newException(KeyError, "`DISCORD_AUTH` env not found")

# Create Discord client
client = newDiscordClient(auth)

import command
client.events.message_create = msgCommandCreate

proc onReady(s: Shard, r: Ready) {.event(client).} =
    echo "Login as: ", r.user

waitFor client.startSession()
