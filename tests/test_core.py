"""Tests standard tap features using the built-in SDK tests library."""

import datetime
import os

from singer_sdk.testing import get_tap_test_class

from tap_clientsuccess.tap import TapClientSuccess

SAMPLE_CONFIG = {
    "start_date": datetime.datetime.now(datetime.timezone.utc).strftime("%Y-%m-%d"),
    "username": os.environ.get("TAP_CLIENTSUCCESS_USERNAME", "api_user@example.com"),
    "password": os.environ.get("TAP_CLIENTSUCCESS_PASSWORD", "password")
}


# Run standard built-in tap tests from the SDK:
TestTapClientSuccess = get_tap_test_class(
    tap_class=TapClientSuccess,
    config=SAMPLE_CONFIG,
)
