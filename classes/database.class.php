<?php

class Database
{
    private $host = 'localhost';
    private $dbname = 'gestioncb';
    private $user = 'root';
    private $pwd = '';

    public $connection = null;

    public function __construct()
    {
        try {
            $this->connection = new PDO(
                'mysql:host=' . $this->host . ';dbname=' . $this->dbname,
                $this->user,
                $this->pwd
            );
        } catch (PDOException $e) {
            echo $e->getMessage();
        }
    }

    public function getConnection()
    {
        return $this->connection;
    }
}
