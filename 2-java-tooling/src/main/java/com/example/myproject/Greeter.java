package com.example.myproject;

import java.io.PrintStream;

import com.google.common.collect.HashMultiset;
import com.google.common.collect.Multiset;

/**
 * Prints a greeting based on how many worlds were mentioned in the command line
 * args.
 */
public class Greeter {
  static PrintStream out = System.out;

  public void greet(String subject) throws Exception {
    String greeting = "Hello";
    out.println(greeting + " " + subject);
  }

  public static void main(String... args) throws Exception {
    Multiset<String> myMultiset = HashMultiset.create();
    for (String arg : args) {
      myMultiset.add(arg);
    }
    Greeter g = new Greeter();
    String subject = myMultiset.count("world") == 1 ? "world"
        : "worlds";
    g.greet(subject);
  }
};
