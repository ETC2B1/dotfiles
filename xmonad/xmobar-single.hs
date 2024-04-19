Config {
    position = TopP 0 0,
    font = "xft:Flexi IBM VGA True",
    bgColor = "#cccccc",
    fgColor = "#000000",
    lowerOnStart = False,
    overrideRedirect = False,
    allDesktops = True,
    persistent = True,
    commands = [
        Run Weather "KPAO" ["-t","<tempF>F <skyCondition>","-L","64","-H","77","-n","#ff0000","-h","#FFB6B0","-l","#96CBFE"] 36000,
        Run MultiCpu ["-t","Cpu:<total0>%","-L","30","-H","60","-h","#0000ff","-l","#ff0000","-n","#FFFFCC","-w","3"] 10,
        Run Memory ["-t","Mem: <usedratio>%","-H","8192","-L","4096","-h","#0000FF","-l","#FF0000","-n","#000000"] 10,
        Run Swap ["-t","Swap: <usedratio>%","-H","1024","-L","512","-h","#0000FF","-l","#ff0000","-n","#FFFFCC"] 10,
        Run Network "enp0s25" ["-t","Net: <rx>, <tx>","-H","200","-L","10","-h","#0000FF","-l","#ff0000","-n","#FFFFCC"] 10,
        Run Date "%Y.%m.%d_%Hh%Mm%Ss" "date" 10,
        Run Com "getMasterVolume" [] "volumelevel" 10,
        Run StdinReader
    ],
    sepChar = "%",
    alignSep = "}{",
    template = "%StdinReader% }{ %multicpu%   %memory%   %swap%   <fc=#0000cc>%date%</fc>"
}