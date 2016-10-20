#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>
#include <assert.h>
#include "../inc/main.h"
static double diff_in_second(struct timespec t1, struct timespec t2)
{
    struct timespec diff;
    if (t2.tv_nsec-t1.tv_nsec < 0) {
        diff.tv_sec  = t2.tv_sec - t1.tv_sec - 1;
        diff.tv_nsec = t2.tv_nsec - t1.tv_nsec + 1000000000;
    } else {
        diff.tv_sec  = t2.tv_sec - t1.tv_sec;
        diff.tv_nsec = t2.tv_nsec - t1.tv_nsec;
    }
    return (diff.tv_sec + diff.tv_nsec / 1000000000.0);
}

int main(int argc, char *argv[])
{
    struct timespec totalStart,totalEnd,perStart,perEnd;
    char dest[]="output/clz_"FUNC".csv";
    FILE *output=fopen(dest,"w");
    clock_gettime(CLOCK_REALTIME,&totalStart);
    for(uint32_t i=0;i<10000;i++){
        clock_gettime(CLOCK_REALTIME,&perStart);
	clz(i);
	clock_gettime(CLOCK_REALTIME,&perEnd);
	fprintf(output,"%u,%lf\n",i,diff_in_second(perStart,perEnd)*1000000);
    }
    clock_gettime(CLOCK_REALTIME,&totalEnd);
    fclose(output);
    printf("total execution time:%lf sec\n",diff_in_second(totalStart,totalEnd));
}
