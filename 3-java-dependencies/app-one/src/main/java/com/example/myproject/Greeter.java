package com.example.myproject;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.PrintStream;
import java.util.Scanner;

import com.google.devtools.build.runfiles.Runfiles;

/**
 * Prints a greeting which can be customized by building with data and/or
 * passing in command- line arguments.
 */
public class Greeter {
  static PrintStream out = System.out;

  public static String readFile(String fn)
      throws FileNotFoundException {
    Scanner s = new Scanner(new File(fn));
    try {
      return s.hasNextLine() ? s.nextLine() : "";
    } finally {
      s.close();
    }
  }

  public void greet(String subject) throws Exception {
    String greeting = "Hello";
    try {
      Runfiles r = Runfiles.create();
      greeting = readFile(r.rlocation(
          "java_dependencies/app-one/src/main/resources/greeting.txt"));
    } catch (NullPointerException e) {
      // use default.
    } catch (FileNotFoundException e) {
      // use default.
    }
    out.println(greeting + " " + subject);
  }

  public static void main(String... args) throws Exception {
    Greeter g = new Greeter();
    String subject = args.length > 0 ? args[0] : "world";
    g.greet(subject);
  }
};
