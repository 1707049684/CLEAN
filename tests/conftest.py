"""Pytest setup: put the CLEAN package dir on sys.path.

The experiment scripts import the model as ``from core.model import GNCDM``
after inserting the CLEAN/ directory into sys.path. Tests mirror that so they
can import the same way without installing the project as a package.
"""
import os
import sys

REPO_ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
GNCDM_DIR = os.path.join(REPO_ROOT, "CLEAN")

if GNCDM_DIR not in sys.path:
    sys.path.insert(0, GNCDM_DIR)
