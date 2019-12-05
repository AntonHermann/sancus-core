# TODO repo overview and list of things that still need migration from DE1 to DE10-Standard
Maybe we can use this as a repo overview file after migration is done

| Entity | Description/ What has to be done |
| ------ | -------------------------------- |
| [doc](doc) | add board documentation |
| [rtl](rtl) | seems to contain a sample project from openMSP430, modified for Altera DE1 -> change to DE10 |
| [sim](sim) | contains simulation files. Check what we can use/keep ([sim/rtl_sim/bin/omsp_config.sh](sim/rtl_sim/bin/omsp_config.sh) seems to contain a broken link) |
| [software](software) | contains a tool to produce .mif-files, apparently something quartus can open - find out whether we could use that as well? |
| [synthesis](synthesis) | contains the quartus project, this is most likely the directory we have to focus on the most |
| [README](README) | update README to reflect changes made to the repository |
