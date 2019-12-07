# "Macro" to combine several Protobuf/GRPC rules.

# This macro/rule encapsulates how a fictional Acme company,
# coudl have a standardized way of using GRPC rules.

load("@rules_proto//proto:defs.bzl", "proto_library")
load("@io_bazel_rules_go//proto:def.bzl", "go_proto_library")
load("@rules_java//java:defs.bzl", "java_proto_library")
load("@io_grpc_grpc_java//:java_grpc_library.bzl", "java_grpc_library")

def acme_grpc(name, srcs, go_import_path, visibility = ["//visibility:public"]):
    proto_library(
        name = name,
        srcs = srcs,
        visibility = visibility,
    )

    go_proto_library(
        name = "%s_go" % name,
        compilers = ["@io_bazel_rules_go//proto:go_grpc"],
        importpath = go_import_path,
        proto = ":%s" % name,
        visibility = visibility,
    )

    java_proto_library(
        name = "%s_java" % name,
        deps = [":%s" % name],
        visibility = visibility,
    )

    java_grpc_library(
        name = "%s_java_lib" % name,
        srcs = [":%s" % name],
        deps = [":%s_java" % name],
        visibility = visibility,
    )
