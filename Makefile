CFLAGS_LEAKS=-Wall -Werror -Wextra
CFLAGS_SANITIZED=${CFLAGS_LEAKS} -fsanitize=address -g

FOR_LEAKS_BUILD_FOLDER=for_leaks_build
SANITIZED_BUILD_FOLDER=sanitized_build
LIB_NAME=libcodamio.a
CURENT_FOLDER=codam-io-test

all: test_sanitized test_leaks

lib_sanitized:
	make -C .. BUILD_FOLDER=${CURENT_FOLDER}/${SANITIZED_BUILD_FOLDER} CFLAGS="${CFLAGS_SANITIZED}"

lib_leaks:
	make -C .. BUILD_FOLDER=${CURENT_FOLDER}/${FOR_LEAKS_BUILD_FOLDER} CFLAGS=${CFLAGS_LEAKS}

test_sanitized: sanitized_main.c lib_sanitized
	${CC} ${CFLAGS_SANITIZED} $< ${SANITIZED_BUILD_FOLDER}/${LIB_NAME} -I../include -o $@

test_leaks: leaks_main.c lib_leaks
	${CC} ${CFLAGS_LEAKS} $< ${FOR_LEAKS_BUILD_FOLDER}/${LIB_NAME} -I../include -o $@

clean:
	rm -rf ${SANITIZED_BUILD_FOLDER} ${FOR_LEAKS_BUILD_FOLDER}

fclean: clean
	rm -f test_leaks test_sanitized

re: fclean all

.PHONY: all clean fclean lib_leaks lib_sanitized re
