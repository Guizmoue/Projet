#1/bin/bash/env

ligne=1
while read -r URL
do
    response=$(curl -s -I -L -W "%{http_code}" -o /dev/nul $URL)
    encoding=$(curl -s -I -L -W "%{content_type}" -o /dev/nul $URL | grep -P -o "charset=\S=" | cut -d'=' -f2 tail -n 1)
    echo "<tr>
        <td>$ligne</td>
        <td>$URL</td>
        <td>$response</td>
        <td>$encoding</td>
    </tr>"
    ligne=$(expr $ligne + 1)
done < "$URL"
