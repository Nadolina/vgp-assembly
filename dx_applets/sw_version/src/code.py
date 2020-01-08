#!/usr/bin/env python
# cloud_workstation 1.0.0
# Generated by dx-app-wizard.
#
# Basic execution pattern: Your app will run on a single machine from
# beginning to end.
#
# See https://wiki.dnanexus.com/Developer-Portal for documentation and
# tutorials on how to modify this file.
#
# DNAnexus Python Bindings (dxpy) documentation:
#   http://autodoc.dnanexus.com/bindings/python/current/

import subprocess
import datetime
import asset_builder_tools

import dxpy
import dx_utils


@dxpy.entry_point('main')
def main(**job_inputs):
    #dx_utils.run_cmd('dx-su-contrib')
    dx_utils.run_cmd('ls')
    dx_utils.run_cmd('python sw_version.py')
    dx_utils.run_cmd('python sw_version.py > version.txt')

    output = {}
    output["logfile"] = dxpy.dxlink("version.txt")
    return output

dxpy.run()