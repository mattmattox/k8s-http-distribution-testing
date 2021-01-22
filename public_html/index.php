<?php
$dbhost = getenv('DB_HOST');
$dbname = getenv('DB_NAME');
$dbuser = getenv('DB_USER');
$dbpass = getenv('DB_PASS');

$nodename = getenv('NODE_NAME');
$podname  = getenv('POD_NAME');
$podip    = getenv('POD_IP');

// Create connection
$conn = new mysqli($dbhost, $dbuser, $dbpass, $dbname);

// Check connection
if ($conn->connect_error)
{
  die("Connection failed: " . $conn->connect_error);
}

$sql = "INSERT INTO Connections (nodename, podname) VALUES ('{$nodename}', '{$podname}')";

if ($conn->query($sql) === TRUE)
{
  echo "New record created successfully";
}
else
{
  echo "Error: " . $sql . "<br>" . $conn->error;
}

$conn->close();
?>
