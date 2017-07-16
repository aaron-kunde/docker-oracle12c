#! /bin/sh

set -e

su oracle -c "$INSTALL_PATH/database/runInstaller -silent -showProgress -ignorePrereq -waitforcompletion -responseFile /response/db_install.rsp"
/opt/oraInventory/orainstRoot.sh
/opt/oracle/product/12.1.0.2/dbhome_1/root.sh

