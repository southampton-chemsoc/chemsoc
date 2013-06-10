chemsoc
=======

Our website, hosted at http://www.southampton.ac.uk/~chemsoc/


Setup
-----

* Make sure you can ssh into chemsoc@ssh.soton.ac.uk fine
* You should probably generate an SSH key and add to server to avoid typing password

```bash
ssh-keygen -t rsa # use default options
ssh-copy-id chemsoc@ssh.soton.ac.uk

# If you used a password for your key, once at the beginning of every session, run:
ssh-add # after this, SSH shouldn't require any sort of manual authentification

# You may want to disallow past users login by removing them from .ssh/authorized_keys on the server
```

* Do whatever to get the site root into _site/


Deploying site
--------------

* You can test locally by opening file:///path/to/chemsoc/_site/ in your browser
* You should then deploy to the [beta site](http://www.southampton.ac.uk/~chemsoc/beta/):

```bash
./deploy.sh beta
```

* Only when you are **perfectly happy**, and **do not care about the existing live site**, you may run:

```bash
./deploy.sh production
```

Authors
------

[Ben Eills](https://github.com/beneills)
