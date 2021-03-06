# IoTE Sentinel

> An automated governance helper for IoTE Masternodes.

Sentinel is an autonomous agent for persisting, processing and automating IoTE governance objects and tasks. It is a Python application which runs alongside the IoTECore instance on each IoTE Masternode.

## Table of Contents
- [Install](#install)
  - [Dependencies](#dependencies)
- [Usage](#usage)
- [Configuration](#configuration)
- [Troubleshooting](#troubleshooting)
- [License](#license)

## Install

These instructions cover installing Sentinel on Ubuntu 16.04 / 18.04.

### Dependencies

Make sure Python version 2.7.x or above is installed:

    python --version

Update system packages and ensure virtualenv is installed:

    $ sudo apt-get update
    $ sudo apt-get -y install python-virtualenv

Make sure the local IoTECore daemon running is at least version 1.31

    $ iote-cli getinfo | grep version

### Install Sentinel

Clone the Sentinel repo and install Python dependencies.

    $ git clone https://github.com/IoTEChain/sentinel.git && cd sentinel
    $ virtualenv ./venv
    $ ./venv/bin/pip install -r requirements.txt

## Usage

Sentinel is "used" as a script called from cron every minute.

### Set up Cron

Set up a crontab entry to call Sentinel every minute:

    $ crontab -e

In the crontab editor, add the lines below, replacing '/path/to/sentinel' to the path where you cloned sentinel to:

    * * * * * cd /path/to/sentinel && ./venv/bin/python bin/sentinel.py >/dev/null 2>&1

### Test Configuration

Test the config by running tests:

    $ ./venv/bin/py.test ./test

With all tests passing and crontab setup, Sentinel will stay in sync with ioted and the installation is complete

## Configuration

An alternative (non-default) path to the `iote.conf` file can be specified in `sentinel.conf`:

    iote_conf=/path/to/iote.conf

## Troubleshooting

To view debug output, set the `SENTINEL_DEBUG` environment variable to anything non-zero, then run the script manually:

    $ SENTINEL_DEBUG=1 ./venv/bin/python bin/sentinel.py


## License

Released under the MIT license, under the same terms as IoTECore itself. See [LICENSE](LICENSE) for more info.
