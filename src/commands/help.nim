import ../global, std/hashes

# Command attributes
const
  CmdName* = MsgCmdPrefix & "help"
  CmdHash* = hashIgnoreStyle(CmdName)


###============================================================================
import std/asyncdispatch, dimscord

# Entry for calling command
proc execute*(s: Shard, m: Message) {.async.} =
    discard
