"""
@file __init__.py
@author Rushil Shah
@author_email rushils4@illinois.edu
@maintainer Rushil Shah
@maintainer_email shahrushil520@gmail.com

@desc Module for custom exceptions for eeg_connect Library
"""
from channel_exceptions import *
from headset_exceptions import *

__all__ = ["channel_exceptions", "headset_exceptions"]