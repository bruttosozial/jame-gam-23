$global:kitchen = Get-Content (Join-Path $PSScriptRoot "kitchen.txt" ) -Encoding UTF8
$stove = 10
$workspace = 12
$sink = 11
$dryingplace = 9
$square = 10
function checkSection($number) {
    if($number -eq $r) {
        editSection -number $number -symbol "O"
        break
    }
    else {
        editSection -number $number -symbol "X"
    }
}

function editSection($number, $symbol) {
    switch($number) {
        1 {
            $newkitchen = $global:kitchen
            for($i = 0; $i -lt $newkitchen.Length; $i++) {
                if( $i -ne 0 -and
                    $i -ne $newkitchen.Length -1 -and 
                    $i -ne $newkitchen.Length -2) {

                    $newkitchen[$i] = "".PadRight($stove, $symbol) + $global:kitchen[$i].Substring($stove)
                }
            }
            $global:kitchen = $newkitchen
        }
        2 {
            $newkitchen = $global:kitchen
            for($i = 0; $i -lt $newkitchen.Length; $i++) {
                if( $i -ne 0 -and 
                    $i -ne $newkitchen.Length -1 -and 
                    $i -ne $newkitchen.Length -2) {

                    $newkitchen[$i] = $newkitchen[$i].Substring(0, $stove) +  "".PadRight(($workspace), $symbol) + $global:kitchen[$i].Substring($stove + $workspace)
                }
            }
            $global:kitchen = $newkitchen
        }
        3 {
            $newkitchen = $global:kitchen
            for($i = 0; $i -lt $newkitchen.Length; $i++) {
                if( $i -ne 0 -and
                    $i -ne $newkitchen.Length -1 -and 
                    $i -ne $newkitchen.Length -2) {

                    $newkitchen[$i] = $newkitchen[$i].Substring(0, $stove + $workspace) + "".PadRight($sink, $symbol) + $global:kitchen[$i].Substring($stove + $workspace + $sink)
                }
            }
            $global:kitchen = $newkitchen
        }
        4 {
            $newkitchen = $global:kitchen
            for($i = 0; $i -lt $newkitchen.Length; $i++) {
                if( $i -ne 0 -and 
                    $i -ne $newkitchen.Length -1 -and 
                    $i -ne $newkitchen.Length -2) {

                    $newkitchen[$i] = $newkitchen[$i].Substring(0, $stove + $workspace + $sink) + "".PadRight($dryingplace, $symbol) + $global:kitchen[$i].Substring($stove + $workspace + $sink + $dryingplace)
                }
            }
            $global:kitchen = $newkitchen
        }
        5 {
            $newkitchen = $global:kitchen
            for($i = 0; $i -lt $newkitchen.Length; $i++) {
                if( $i -ne 0 -and 
                    $i -ne $newkitchen.Length -1 -and 
                    $i -ne $newkitchen.Length -2) {

                    $newkitchen[$i] = $newkitchen[$i].Substring(0, $stove + $workspace + $sink + $dryingplace) + "".PadRight($square, $symbol)
                }
            }
            $global:kitchen = $newkitchen
        }
    }
}
$sw = [Diagnostics.Stopwatch]::StartNew()
$r = Get-Random -Minimum 1 -Maximum 6
$global:break = $true
Clear-Host
while ($break) {
    [System.Console]::SetCursorPosition(0,0)
    "The death lost their key while cooking :( Try to find it in the sections! You have 10 seconds uwu"
    $sw.elapsed.totalseconds
    foreach($line in $global:kitchen) {
        $line
    }
    if($sw.elapsed.totalseconds -gt 10) {
        "oh noooo owo"
        exit
    }
    if ([console]::KeyAvailable) {
        $inputRead = [System.Console]::ReadKey()
        switch ($inputRead.Key) {
            D1 {$inputNum = 1}
            D2 {$inputNum = 2}
            D3 {$inputNum = 3}
            D4 {$inputNum = 4}
            D5 {$inputNum = 5}
            Enter {break}
        }

        checkSection -number $inputNum
    }

    start-sleep -Milliseconds 20
}
Clear-Host
foreach($line in $global:kitchen) {
    $line
}
"You won! Now death can continue to do their job owo :3"