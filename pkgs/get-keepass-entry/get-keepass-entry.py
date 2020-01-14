#!/usr/bin/env python
"""
Retrieve a password from a KeePass database
"""

import sys
import argparse
from getpass import getpass
from pykeepass import PyKeePass

parser = argparse.ArgumentParser(
    description='Retrieve a password from a KeePass database.')

parser.add_argument("kdb", type=str, help="path to a KeePass database file")
parser.add_argument("entry",
                    type=str,
                    help="path to the entry in the given KeePass database")

args = parser.parse_args()

kbd_passwd = getpass('Enter KeePass master password: ')
kp = PyKeePass(args.kdb, password=kbd_passwd)

entry = kp.find_entries(path=args.entry)

if not entry:
    sys.stderr.write('No KeePass entry found at path "{}"'.format(args.entry))
    sys.exit(1)

print(entry.password)
