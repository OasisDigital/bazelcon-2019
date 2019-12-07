package com.oasisdigital.grocery;

import io.grpc.*;
import com.oasisdigital.grocery.api.*;

import java.io.IOException;

/**
 * Prints a greeting which can be customized by building with data and/or
 * passing in command-line arguments.
 */
public class GroceryListServer {
  public static void main(String[] args) {
    Server server = ServerBuilder.forPort(8500).addService(new Impl())
        .build();

    try {
      server.start();
      server.awaitTermination();
    } catch (IOException | InterruptedException e) {
      e.printStackTrace();
    }
  }
};

class Impl extends GroceryListGrpc.GroceryListImplBase {
  @Override
  public void addEntry(Entry request,
      io.grpc.stub.StreamObserver<Empty> responseObserver) {
    // This example is about Bazel, not GRPC, Java, or Go, so don't bother to
    // edit/keep state.
    responseObserver.onNext(Empty.newBuilder().build());
    responseObserver.onCompleted();
  }

  @Override
  public void getList(Empty request,
      io.grpc.stub.StreamObserver<List> responseObserver) {
    Entry apples = Entry.newBuilder().setDescription("Apples")
        .setQty(6).build();
    Entry bananas = Entry.newBuilder().setDescription("Bananas")
        .setQty(12).build();
    Entry basil = Entry.newBuilder().setDescription("Basil")
        .setQty(16).build();

    List l = List.newBuilder().addEntry(apples).addEntry(bananas)
        .addEntry(basil).setOccasion("Weekly Shopping").build();
    responseObserver.onNext(l);
    responseObserver.onCompleted();
  }
}
