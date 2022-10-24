$inputNum
$switch1 = $true
$switch2 = $true
$check = $true
$sw = [Diagnostics.Stopwatch]::StartNew()
$r = 1
while ($check) {
    clear-host
    if($sw.elapsed.totalseconds -gt 1) {
        $r = Get-Random -Minimum 1 -Maximum 4
        $sw = [Diagnostics.Stopwatch]::StartNew()
    }

    "There are three doors and you only have one key. Behind one of them is a murderer. Use your key wisely!"
    ""
    if ($switch1) {
        " ---------   ---------   --------- "
        $switch1 = !$switch1
    }
    else {
        " ^^^^^^^^^   ^^^^^^^^^   ^^^^^^^^^ "
        $switch1 = !$switch1
    }
    
    "|         | |         | |         |"
    switch($r) {
        1 {"|   ^ ^   | |         | |         |"}
        2 {"|         | |   ^ ^   | |         |"}
        3 {"|         | |         | |   ^ ^   |"}
    }
    "|         | |         | |         |"
    "|         | |         | |         |"
    "|         | |         | |         |"
    "|         | |         | |         |"
    
    if ($switch2) {
        " ---------   ---------   --------- "
        $switch2 = !$switch2
    }
    else {
        " ^^^^^^^^^   ^^^^^^^^^   ^^^^^^^^^ "
        $switch2 = !$switch2
    }
    $inputNum = 4
    if ([console]::KeyAvailable) {
        $inputRead = [System.Console]::ReadKey()
        switch ($inputRead.Key) {
            D1 {$inputNum = 1}
            D2 {$inputNum = 2}
            D3 {$inputNum = 3}
            Enter {$check = $false}
        }
    }
    if($inputNum -eq $r) {break}
    start-sleep -Milliseconds 50
}
if($check)
{
    "YOU WON!!"
}
else {
    "no..."
}