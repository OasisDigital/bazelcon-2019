package com.oasisdigital.myproject;

import static spark.Spark.*;
import java.util.Date;

public class Server {
    public static void main(String[] args) {
        get("/hello", (req, res) -> new Date().toString());
    }
}
