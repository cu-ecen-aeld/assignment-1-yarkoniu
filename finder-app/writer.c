#include <errno.h>
#include <stdio.h>
#include <syslog.h>

int main(int argc, char* argv[]) {

	// Open syslog
	openlog("writer", LOG_PID, LOG_USER);
	
	// Check arguments
	if (argc != 3) {
		syslog(LOG_ERR, "Writer expects 2 argument, %i provided", argc - 1);
		closelog();
		return 1;
	}
	FILE *f;
	f = fopen(argv[1], "w");
	if (f == NULL) {
		syslog(LOG_ERR, "Failed to open destination file %s with error %i", argv[1], errno);
		closelog();
		return 1;
	}

	// Write text to file
	fprintf(f, "%s", argv[2]);
	syslog(LOG_DEBUG, "Writing %s to %s", argv[2], argv[1]);
	closelog();
	return 0;
}
		
