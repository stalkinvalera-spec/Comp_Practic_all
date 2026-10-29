#include <stdio.h>
#include "load.h"

#ifdef _WIN32
#include <windows.h>
#else
#include <dlfcn.h>
#endif

void load_run(const char *name)
{
    void (*fun)(void);

#ifdef _WIN32
    HMODULE lib = LoadLibraryA(name);                    /* загрузка в память */
    if (lib == NULL) {
        printf("Не удалось загрузить библиотеку '%s'\n", name);
        return;
    }
    fun = (void (*)(void))GetProcAddress(lib, "run");    /* поиск функции */
#else
    void *lib = dlopen(name, RTLD_LAZY);                 /* загрузка в память */
    if (lib == NULL) {
        printf("Не удалось загрузить библиотеку '%s': %s\n", name, dlerror());
        return;
    }
    fun = (void (*)(void))dlsym(lib, "run");             /* поиск функции */
#endif

    if (fun == NULL)
        printf("В библиотеке '%s' нет функции run\n", name);
    else
        fun();

#ifdef _WIN32
    FreeLibrary(lib);                                    /* выгрузка */
#else
    dlclose(lib);
#endif
}
