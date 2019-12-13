package com.example.myproject;

import static org.junit.Assert.assertEquals;

import org.junit.Before;
import org.junit.Test;

import java.io.ByteArrayOutputStream;
import java.io.PrintStream;
import java.nio.charset.StandardCharsets;

/**
 * Test the Greeter's ability to say Hello
 */
public class TestHello {

  ByteArrayOutputStream out = new ByteArrayOutputStream();

  @Before
  public void setUp() {
    Greeter.out = new PrintStream(out);
  }

  private String mainOutput() {
    return new String(out.toByteArray(), StandardCharsets.UTF_8);
  }

  @Test
  public void testNoArgument() throws Exception {
    Greeter.main();
    assertEquals("Hello worlds" + System.lineSeparator(),
        this.mainOutput());
  }

  @Test
  public void testOneWorld() throws Exception {
    Greeter.main("world");
    assertEquals("Hello world" + System.lineSeparator(),
        this.mainOutput());
  }

  @Test
  public void testTwoWorlds() throws Exception {
    Greeter.main("world", "world");
    assertEquals("Hello worlds" + System.lineSeparator(),
        this.mainOutput());
  }

  @Test
  public void testWrongWorlds() throws Exception {
    Greeter.main("what ever"); // 0 worlds
    assertEquals("Hello worlds" + System.lineSeparator(),
        this.mainOutput());
  }
}
