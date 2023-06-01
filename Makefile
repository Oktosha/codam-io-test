CFLAGS_LEAKS=-Wall -Werror -Wextra
CFLAGS_SANITIZED=${CFLAGS_LEAKS} -fsanitize=address -g

BUILD_FOLDER_LEAKS=leaks_build
BUILD_FOLDER_SANITIZED=sanitized_build
LIB_NAME=libcodamio.a
LIB_INCLUDE=../include
CURENT_FOLDER=codam-io-test

TEST_SRCS=test_basic.c test_all_lines.c

SRCS_SANITIZED=${TEST_SRCS} main_sanitized.c
OBJS_SANITIZED=${addprefix ${BUILD_FOLDER_SANITIZED}/bin/,${SRCS_SANITIZED:.c=.o}}
MAIN_OBJ_SANITIZED=${BUILD_FOLDER_SANITIZED}/bin/main_sanitized.o
BINS_SANITIZED=${addprefix ${BUILD_FOLDER_SANITIZED}/,${TEST_SRCS:.c=.exe}}

SRCS_LEAKS=${TEST_SRCS} main_leaks.c
OBJS_LEAKS=${addprefix ${BUILS_FOLDER_LEAKS}/bin/,${SRCS_LEAKS:.c=.o}}
MAIN_OBJ_LEAKS=${BUILD_FOLDER_LEAKS}/bin/main_leaks.o
BINS_LEAKS=${addprefix ${BUILD_FOLDER_LEAKS}/,${TEST_SRCS:.c=.exe}}

all: lib_sanitized lib_leaks ${BINS_SANITIZED} ${BINS_LEAKS}

lib_sanitized:
	make -C .. BUILD_FOLDER=${CURENT_FOLDER}/${BUILD_FOLDER_SANITIZED} CFLAGS="${CFLAGS_SANITIZED}"

${OBJS_SANITIZED}: ${BUILD_FOLDER_SANITIZED}/bin/%.o: %.c
	${CC} ${CFLAGS_SANITIZED} $< -I${LIB_INCLUDE} -o $@ -c

${BINS_SANITIZED}: ${BUILD_FOLDER_SANITIZED}/%.exe: ${BUILD_FOLDER_SANITIZED}/bin/%.o ${BUILD_FOLDER_SANITIZED}/${LIB_NAME} ${MAIN_OBJ_SANITIZED}
	mkdir -p $(@D)
	${CC} ${CFLAGS_SANITIZED} $^ -o $@

lib_leaks:
	make -C .. BUILD_FOLDER=${CURENT_FOLDER}/${BUILD_FOLDER_LEAKS} CFLAGS=${CFLAGS_LEAKS}

${OBJS_LEAKS}: ${BUILD_FOLDER_LEAKS}/bin/%.o: %.c
	${CC} ${CFLAGS_LEAKS} $< -I${LIB_INCLUDE} -o $@ -c

${BINS_LEAKS}: ${BUILD_FOLDER_LEAKS}/%.exe: ${BUILD_FOLDER_LEAKS}/bin/%.o ${BUILD_FOLDER_LEAKS}/${LIB_NAME} ${MAIN_OBJ_LEAKS}
	mkdir -p $(@D)
	${CC} ${CFLAGS_LEAKS} $^ -o $@

clean:
	rm -rf ${BUILD_FOLDER_LEAKS}/bin ${BUILD_FOLDER_LEAKS_SANITIZED}/bin

fclean: clean
	rm -f ${BUILD_FOLDER_LEAKS} ${BUILD_FOLDER_SANITIZED}

re: fclean all

.PHONY: all clean fclean lib_leaks lib_sanitized re
