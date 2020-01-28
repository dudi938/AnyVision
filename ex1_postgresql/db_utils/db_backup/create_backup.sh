#!/bin/bash
set -e


pg_dump anyVision --username=postgres -W -F t > /backup/anyVisionDbbackup_$(date +%Y%m%d).rar
