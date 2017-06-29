<?php
$backupEmail = "contacto.dexmate@gmail.com";
$projectEmail = "backup@dexmate.es";
$projectName = "Dexmate";

$host = "localhost";
$username = "root";
$password = "ruedalarueda";
$dbName = "dexmate";

$backup_file = "/root/dexmate" . date("Y-m-d-H-i-s") . ".sql.gz";
$command = "mysqldump --opt -h $host -u $username -p$password $dbName | gzip > $backup_file";
system($command,$output);

sleep(30);

$to = $backupEmail;
$from = $projectEmail;
$subject = "Backup $projectName " . date("Y-m-d-H-i-s");
$separator = md5(time());
$filename = "dexmate".date("Y-m-d-H-i-s") . '.sql.gz';
$attachment = chunk_split(base64_encode(file_get_contents($backup_file)));
 
$headers  = "From: ".$from.PHP_EOL;
$headers .= "MIME-Version: 1.0".PHP_EOL;
$headers .= "Content-Type: multipart/mixed; boundary=\"".$separator."\"";

$body="";
$body .= "--".$separator.PHP_EOL;
$body .= "Content-Type: application/octet-stream; name=\"".$filename."\"".PHP_EOL;
$body .= "Content-Transfer-Encoding: base64".PHP_EOL;
$body .= "Content-Disposition: attachment".PHP_EOL.PHP_EOL;
$body .= $attachment.PHP_EOL;
$body .= "--".$separator."--";
 
if (mail($to, $subject, $body, $headers)) {
    unlink($backup_file);
}


?>
