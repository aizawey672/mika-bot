import util, std/asyncdispatch, dimscord

# Message command list
import commands/[
    help,
]

# Handle message command
proc msgCommandCreate*(s: Shard, m: Message) {.async.} =
    # Early out if author is bot
    if m.author.bot: return

    # Early out if message is not message command
    let msg = m.content
    if not isMsgCommand(msg): return

    # Handle command
    case getCommandHash(msg):
        # `help` command
        of help.CmdHash:
            await help.execute(s, m)

        # command not found
        else:
            discard
