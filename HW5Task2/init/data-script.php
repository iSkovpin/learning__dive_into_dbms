<?php

$set = [];
$setLength = rand(5, 15) * 2 + 1;

for ($i = 0; $i < $setLength; $i++) {
    while (true) {
        $nextVal = rand(1, 100);
        if (array_search($nextVal, $set) === false) {
            $set[] = $nextVal;
            break;
        }
    }
}

foreach ($set as $i => $item) {
    $id = ++$i * 10;
    echo "INSERT INTO T VALUES ({$id}, {$item});\n";
}
