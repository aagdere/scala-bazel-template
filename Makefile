clean-intellij:
	# Deleting intellij files
	find . | grep .idea/ | grep -v misc | xargs rm -rf
	find . | grep -e ".iml$$" | xargs rm -rf
	rm .rig_sha1

clean:
	make clean-bazel
	make clean-intellij

clean-bazel:
	# Deleting bazel files
	rm -rf ./bazel-*

clean-3rdparty:
	# Deleting third party libraries
	rm -rf ./3rdparty

build:
	bazel build //...

intellij:
	bazel build :intellij
	python2 ./bazel-bin/install_intellij_files_script

build-deps:
	cd ../bazel-deps && \
	bazel run //:parse -- generate -r /home/aris/Development/scala-play-bazel-template -s ../scala-play-bazel-template/3rdparty/workspace.bzl -d dependencies.yaml