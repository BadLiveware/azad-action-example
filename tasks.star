"""Two tasks in an image: one counts the words of the README, and one checks the count."""

ALPINE = image("alpine:3.24@sha256:be2656061b536c1883c4034790e21d0a09c5aaaf51968b89368a3c0371ea2c9a")

words = task(
    name = "words",
    cmd = "mkdir -p out && wc -w < README.md > out/words",
    sources = ["README.md"],
    generates = ["out"],
    image = ALPINE,
    doc = "Count the words of the README",
)

check = task(
    name = "check",
    cmd = "test \"$(cat out/words)\" -gt 0",
    deps = [words],
    image = ALPINE,
    doc = "Check that the README has words",
)

goal("ci", require = [check], doc = "What CI checks")
