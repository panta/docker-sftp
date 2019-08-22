SFTP Server
===========


# Running

Just use this command to start the container.

```bash
$ mkdir uploads
$ docker run --name sftp -v $(pwd)/uploads:/data/uploads -p 2222:22 --rm -it panta/docker-sftp
```

# Persistent Pubkeys

If you want to store the keys (so your fingerprint doesn't change) persistent, you can run it like that:

```bash
$ mkdir uploads
$ mkdir ssh
$ docker run --name sftp -v $(pwd)/uploads:/data/uploads -v $(pwd)/ssh:/ssh -p 2222:22 --rm -it panta/docker-sftp
```

# Configuration

These options can be set: (hint: it is even possible to use '33' as gid/uid)

- **USER**: Sets the username. (Default: "sftp", Possible Values: "<string>")
- **PASS**: Sets the password of the User (Default: "VWqy62GNqYpHAL", Possible Values: "<string>")
- **GROUP_ID**: Sets GID of the user (Default: "1000", Possible Values: "<integer>")
- **USER_ID**: Sets UID of the user (Default: "1000", Possible Values: "<integer>")
- **PUBKEY**: Sets PUBKEY of the user (Possible Values: "<string>")
