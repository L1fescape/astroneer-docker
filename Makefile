.DEFAULT_GOAL := start

STEAM_DIR=${HOME}/.wine/drive_c/steamcmd
ASTRONEER_DIR=${STEAM_DIR}/games/astroneer
ASTRONEER_APP_ID=728470

.PHONY: install
install:
	@mkdir -p ${ASTRONEER_DIR}
	wine C:\\steamcmd\\steamcmd.exe
		+login anonymous \
		+force_install_dir ${ASTRONEER_DIR} \
		+app_update ${ASTRONERR_APP_ID} validate \
		+quit