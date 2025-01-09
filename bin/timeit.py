import subprocess

p = subprocess.Popen(
    ["ssh", "", "/bin/cat"], stdin=subprocess.PIPE, stdout=subprocess.PIPE, bufsize=0
)

if p is not None:
    p.stdin.write('b"z"')
	assert p.stdout.read(1) == 'b"z"'
