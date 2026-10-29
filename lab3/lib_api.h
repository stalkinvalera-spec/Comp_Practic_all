#ifdef _WIN32
//Сборка под Windows
#define EXPORT __declspec(dllexport)
#else
//Сборка под Linux
#define EXPORT
#endif

EXPORT void run(void);
