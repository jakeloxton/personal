$code = 0

Get-ChildItem -File -Filter "*docker-compose*" -Recurse | ForEach {

    docker-compose -f $_.fullname config -q 
    if ($LASTEXITCODE -eq 1) {
        $code = $LASTEXITCODE
    }
}

exit $code
