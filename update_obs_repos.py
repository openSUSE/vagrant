#!/usr/bin/python3

import os
import shutil
import shlex
import subprocess
from typing import List


#: Names of the supported distributions
DISTRIBUTION_NAMES = [
    "15.0",
    "15.1",
    "15.2",
    "Tumbleweed",
]


#: repository root directory
ROOT_DIR = os.path.dirname(os.path.realpath(__file__))

#: root of the kiwi descriptions
KIWI_ROOT = os.path.abspath(os.path.join(ROOT_DIR, "kiwi"))


def get_file_list(distro_name: str) -> List[str]:
    """ Return the list of files for the distribution """
    if distro_name not in DISTRIBUTION_NAMES:
        raise ValueError(f"Invalid distribution name: {distro_name}")

    files = ["config.sh", f"{distro_name}.kiwi", "_multibuild", "_constraints", "aarch64_vagrantfile"]

    return files


def check_if_files_unmodified(file_list: List[str], directory: str) -> bool:
    """
    Check all files in the list file_list whether they are unmodified in
    the OBS repository in the given directory.
    """
    for fname in file_list:
        osc_res = subprocess.run(
            shlex.split(f"osc st {fname}"),
            stdout=subprocess.PIPE,
            stderr=subprocess.PIPE,
            cwd=directory,
        )

        if osc_res.returncode != 0:
            err_msg = f"""osc: '{fname}' is not under version control
"""
            # file is not under version control => consider it unmodified
            if osc_res.stderr == bytes(err_msg, encoding="ascii"):
                continue
            else:
                raise IOError(
                    f"osc failed with return value {osc_res.returncode}, "
                    f"stdout: {osc_res.stdout}, stderr: {osc_res.stderr}"
                )

        if osc_res.stdout != b"":
            return False

    return True


if __name__ == "__main__":

    import argparse
    import sys

    PARSER = argparse.ArgumentParser(
        description="Copy the kiwi files from this git repository into a obs "
        "repository"
    )
    PARSER.add_argument(
        "-f",
        "--force",
        action="store_true",
        help="overwrite files that have uncommitted changes in the obs repository",
    )
    PARSER.add_argument(
        "distro_name",
        nargs=1,
        type=str,
        help="Name of the distribution which config file will be copied",
    )
    PARSER.add_argument(
        "obs_repo_dir",
        nargs=1,
        type=str,
        help="Directory where the obs repository is checked out",
    )

    ARGS = PARSER.parse_args()
    DISTRO = ARGS.distro_name[0]
    OBS_REPO = ARGS.obs_repo_dir[0]

    FLIST = get_file_list(DISTRO)

    if not ARGS.force:
        # don't check anything in a subdirectory, osc cannot do that
        CHECK_FILE_LIST = [elem for elem in FLIST if os.path.sep not in elem]
        if not check_if_files_unmodified(CHECK_FILE_LIST, OBS_REPO):
            print(
                f"Warning unmodified files present in {OBS_REPO}",
                file=sys.stderr,
            )
            exit(1)

    for fname in FLIST:
        fdir = os.path.join(OBS_REPO, os.path.dirname(fname))
        if not os.path.exists(fdir):
            os.makedirs(fdir)

        destination = os.path.join(OBS_REPO, fname)

        if fname == "_multibuild":
            fname = "_multibuild_with_arm"
        shutil.copy(os.path.join(KIWI_ROOT, fname), destination)
