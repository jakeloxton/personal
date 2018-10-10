TMP_FILE=outputfile
RC=0

echo "" > $TMP_FILE

for line in $(find . -type f -iname '*docker-compose*'); do
        echo -n "Validating: $line..."
        if docker-compose -f $line config -q 2>&1 >/dev/null | grep -v swarm | grep -v Defaulting; then
                RC=1
        else
                echo "OK"
        fi
done

exit $RC
