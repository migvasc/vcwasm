#include <sstream>
#include <string.h>
#include <memory.h>
#include <stdlib.h>
#include <emscripten/html5.h>
#include <emscripten/fetch.h>
#include <emscripten/threading.h>
#include <emscripten/emscripten.h>
#include <math.h>
#include <stdio.h>
#include <time.h>

void downloadSucceededPost(emscripten_fetch_t *fetch) {
	printf("\nPOST REQUEST WAS SENT!\n");
	emscripten_fetch_close(fetch); // Free data associated with the fetch.	
}
void downloadFailed(emscripten_fetch_t *fetch) {
	printf("Downloading %s failed, HTTP failure status code: %d.\n", fetch->url, fetch->status);
	emscripten_fetch_close(fetch); // Also free data on failure.	
}
void downloadSucceeded(emscripten_fetch_t *fetch) {
    printf("Finished downloading %llu bytes from URL %s.\n", fetch->numBytes, fetch->url);
    //  printf("Text of the file: %s", (char *) fetch->data);
    // The data is now available at fetch->data[0] through fetch->data[fetch->numBytes-1];	
	emscripten_fetch_attr_t attr;
	emscripten_fetch_attr_init(&attr);
	strcpy(attr.requestMethod, "POST");
	attr.attributes = EMSCRIPTEN_FETCH_LOAD_TO_MEMORY;
	
	// If non-zero, specified a pointer to the data that is to be passed as the body (payload) of the request
	// that is being performed. Leave as zero if no request body needs to be sent.
	// The memory pointed to by this field is provided by the user, and needs to be valid only until the call to
	// emscripten_fetch() returns.
	
	char buffer [fetch->numBytes];
	sprintf(buffer,"%s",  fetch->data);
	int x = atoi(buffer);
	char * bs ="";
	sprintf(bs,"%s%d","https://vcwasm-migvasc.c9users.io/tasks/",x);
	
	static const char* custom_headers[3] = {"task_id", bs, nullptr};	
	attr.requestDataSize = sizeof(buffer);	
	attr.requestData=buffer;
	// Specifies the length of the buffer pointed by 'requestData'. Leave as 0 if no request body needs to be sent.  
	attr.requestHeaders =custom_headers;  
	attr.onsuccess = downloadSucceededPost;
	attr.onerror = downloadFailed;
	emscripten_fetch(&attr,bs );	
	emscripten_fetch_close(fetch); // Free data associated with the fetch.  
	
}

int main() {

    emscripten_fetch_attr_t attr;
    emscripten_fetch_attr_init(&attr);
    strcpy(attr.requestMethod, "GET");
    attr.attributes = EMSCRIPTEN_FETCH_LOAD_TO_MEMORY;   
    // If non-zero, specified a pointer to the data that is to be passed as the body (payload) of the request
    // that is being performed. Leave as zero if no request body needs to be sent.
    // The memory pointed to by this field is provided by the user, and needs to be valid only until the call to
    // emscripten_fetch() returns.  
    // Specifies the length of the buffer pointed by 'requestData'. Leave as 0 if no request body needs to be sent.  
    attr.onsuccess = downloadSucceeded;
    attr.onerror = downloadFailed;
    emscripten_fetch(&attr, "https://vcwasm-migvasc.c9users.io/projects/6.dat");  
	
}