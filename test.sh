export BLAH=blahblahblah

shift 4
for arg; do
    printf 'Something with "%s"\n' "$arg"
done
