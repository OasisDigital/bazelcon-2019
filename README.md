# Oasis Digital "Building with Bazel" case studies / examples

## Notes


bazel query 'attr(visibility, "//visibility:public", ...)'


## Thing to do, here and in the outline

Have a crisp definition of toolchain, though we won't get to defining our own in this class.

Add C++

https://docs.bazel.build/versions/1.1.0/bazel-and-cpp.html

Rework what goes in each case study

Defer when JS comes up. It is complex and brings up messy things.

Probably add another increment from the smallest to something that
combines JS with other tech, because there are so many complexity.

Bring in a complex Java thing, to the  migrationg step ?

add the all_srcs thing to one of the steps.

Workspace is stuff consumed by the build. BUILD is stuff produced by the build.

add a commands_to_try.sh to each one. Call it from CI to verify OK.
