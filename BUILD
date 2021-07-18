package(default_visibility = ["//:__subpackages__"])

load("@io_bazel_rules_scala//scala:scala.bzl", "scala_binary")
load("@rules_intellij_generate//:def.bzl", "intellij_module")
load("@rules_intellij_generate//:def.bzl", "intellij_project")

scala_binary(
    name = "App",
    main_class = "bazeltest.Main",
    deps = [
        "//bazeltest",
    ],
)

exports_files(["iml_types.xml"])

filegroup(
    name="automatically_placed_intellij_project_files",
    srcs=glob(["intellij_project_files/**/*.xml"])
)

intellij_module(
    name="iml",
    iml_type="root",
    module_name_override = "template",
    visibility = ["//visibility:public"],
)

intellij_project(
    name="intellij",
    deps=[
        "//bazeltest:tests",
        "//othermodule:tests",
    ],
    test_lib_label_matchlist=['{"label_name":"bazeltest"}'],
    iml_types_file="//:iml_types.xml",
    project_root_filegroup="//:automatically_placed_intellij_project_files",
    project_root_filegroup_ignore_prefix="intellij_project_files",
    modules=[
        "//:iml",
        "//bazeltest:bazeltest_iml",
        "//othermodule:othermodule_iml",
    ],
    testonly=True,
)
