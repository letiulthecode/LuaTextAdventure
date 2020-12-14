local Color = {
    start = '\27',
    --Styles
    sty = {
    reset = '[0m',
    bold = '[1m',
    underline = '[4m',
    inverse = '[7m',
    },
    --Foreground colors
    frg = {
    black = '[30m',
    red = '[31m',
    green = '[32m',
    yellow = '[33m',
    blue = '[34m',
    magenta = '[35m',
    cyan = '[36m',
    white = '[37m',
    },
    --Bright foreground colors
    brg = {
    black = '[90m',
    red = '[91m',
    green = '[92m',
    yellow = '[93m',
    blue = '[94m',
    magenta = '[95m',
    cyan = '[96m',
    white = '[97m',
    },
    --Background colors
    bkg = {
    black = '[100m',
    red = '[101m',
    green = '[102m',
    yellow = '[103m',
    blue = '[104m',
    magenta = '[105m',
    cyan = '[106m',
    white = '[107m',
    }
 }
 
 function Color.print(a)
     print(Color.start.."n"..a..Color.sty.reset..Color.start)
 end

return Color