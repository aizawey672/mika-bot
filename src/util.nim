import global, commands/help
import std/[strutils, hashes]

# Check if message content is command
func isMsgCommand*(s: string): bool =
    if s.len < MsgCmdPrefix.len: return false
    for i, c in MsgCmdPrefix:
        if c != toLowerAscii(s[i]): return false
    result = true

# Get command name with prefix
func getFullCommandName*(s: string): string =
    let splitPos = s.find(' ', MsgCmdPrefix.len)
    result = s[0 ..< splitPos]

    # If command itself equals `MsgCmdPrefix`
    # the `help` command is called
    if result.len == MsgCmdPrefix.len:
        result = help.CmdName

# Get command name only
func getCommandName*(s: string): string =
    let splitPos = s.find(' ', MsgCmdPrefix.len)
    result = s[MsgCmdPrefix.len ..< splitPos]

    # If command itself equals `MsgCmdPrefix`
    # the `help` command is called
    if result.len == 0:
        result = help.CmdName[MsgCmdPrefix.len .. ^1]

# Get hash from command name with prefix
func getCommandHash*(s: string): Hash =
    result = getFullCommandName(s).hashIgnoreStyle()

# Strip command out of message
func getMsgStripped*(cmdFullName, s: string): string =
    result = s[cmdFullName.len .. ^1]
