from subprocess import Popen, PIPE


def get_stash():
    cmd = Popen(['git', 'rev-parse', '--git-dir'], stdout=PIPE, stderr=PIPE)
    so, se = cmd.communicate()
    stash_file = '%s%s' % (so.decode('utf-8').rstrip(), '/logs/refs/stash')

    try:
        with open(stash_file) as f:
            return sum(1 for _ in f)
    except IOError:
        return 0


print(get_stash())
