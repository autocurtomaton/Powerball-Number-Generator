Clear-Host

$LogFileTime = Get-Date –f "yyyy-MM-dd--HHmmss"
$file = "PowerballNumbers_$LogFileTime.log"

$j=$winnings=0
$pool = @()
$pbpool = @()

for ($i=1; $i -le 69; $i++) {$pool+= $i}
for ($i=1; $i -le 26; $i++) {$pbpool += $i}

$tickcount = Read-Host 'Number of plays ($2 per ticket)';
write-host 'Any winnings to reinvest (enter dollar amount of previous winnings, "0" for none): $' -NoNewline
$winnings = Read-Host
write-host "" 

do{
    $white = $pool | Get-Random -Count 5 | Sort-Object
    $pb = $pbpool | Get-Random
    write-host -BackgroundColor Black "$white " -NoNewline; write-host -BackgroundColor Black -ForegroundColor Red "$pb" 
    "$white $pb" | Out-File $file -Append
    $j++
} while ($j -lt $tickcount)

write-host ""
$subcost = "{0:C2}" -f (2 * $tickcount)
$cost = "{0:C2}" -f ((2 * $tickcount)-$winnings)
$winamt = "{0:C2}" -f (1 * $winnings)

Write-Host -ForegroundColor Gray "Subtotal is $subcost"
Write-Host -ForegroundColor Cyan "Less previous winnings of $winamt..."
write-host ""
write-host -ForegroundColor Green "Total Cost: $cost"

read-host "Press Enter to exit"
