# Package
version          = "0.1.0"
author           = "Aiz"
description      = "Mika - Blue Archive discord bot written in Nim"
license          = "MIT"
srcDir           = "src"
binDir           = "nim-out"
namedBin["main"] = "mika-bot"


# Dependencies
requires "nim >= 1.4.8"
requires "dimscord#HEAD"     # Wait for 1.3.0
requires "jsony#HEAD"        # For strspeed implementation
