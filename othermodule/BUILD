load("@io_bazel_rules_scala//scala:scala.bzl", "scala_library", "scala_test")
load("@rules_intellij_generate//:def.bzl", "intellij_module")

scala_library(
    name = "othermodule",
    srcs = glob(["src/main/scala/othermodule/*.scala"]),
    visibility = ["//bazeltest:__pkg__", "//:__pkg__"],
    deps = [],
)

scala_test(
    name = "tests",
    srcs = ["src/test/scala/othermodule/WorkerSpec.scala"],
    deps = [":othermodule"],
    visibility = ["//visibility:public"],
)

intellij_module(
    name="othermodule_iml",
    iml_type="scala-simple",
    visibility = ["//visibility:public"],
)
