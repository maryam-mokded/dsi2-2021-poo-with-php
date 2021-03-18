<?php
include 'classes/client.class.php';

$client = new Client();
$clientsList = $client->getAllClients()->fetchAll(PDO::FETCH_ASSOC);
// echo ('<pre>');
// var_dump($clientsList);
// echo ('</pre>');

include 'index.phtml';
