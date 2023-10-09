import os
import sys

# Import the SCons Environment
env = Environment()

# Specify the source directory
env.Append(CPPPATH=["src/"])
sources = Glob("src/*.cpp")

# Check the platform and set the library extension accordingly
if env["platform"] == "windows":
    library_extension = "dll"
elif env["platform"] == "posix":
    library_extension = "so"
else:
    library_extension = "dylib"

# Define the shared library target
library = env.SharedLibrary(
    target="demoproject/bin/helloWorld.{}.{}.framework/helloWorld.{}.{}".format(
        env["platform"], env["target"], env["platform"], library_extension
    ),
    source=sources,
)

Default(library)