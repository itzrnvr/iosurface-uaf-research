// macOS command-line wrapper for the CVE-2026-112477 IOSurface UAF harness.
// Defines the log callback the harness expects and invokes the entry point.
#import <Foundation/Foundation.h>
#include <stdio.h>

extern int nj_entry_isurf_uaf(void);
void (*g_log_cb)(const char *s) = NULL;

static void logcb(const char *s) { printf("%s\n", s); fflush(stdout); }

int main(void) {
    g_log_cb = logcb;
    printf("[main] macOS IOSurface UAF harness start\n"); fflush(stdout);
    int r = nj_entry_isurf_uaf();
    printf("[main] entry returned %d\n", r); fflush(stdout);
    return 0;
}