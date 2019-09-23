#include "iostream"
#include "string"

using namespace std;

#define targetnum_start 5
#define targetnum_end   15
#define targetnum_max   15
string ele={"abcdefghijklmnopqrstuvwxyz1234567890~!@#$%^&*()_+{}|:\"<>?`-=[]\\;',./ "};
int num_ele = ele.length();
int targetnum;
char tmp[targetnum_max];

FILE *f = NULL;
void fun_search1(char *ans ,int num);
int main()
{
	printf("start\n");
	f = fopen("/home/eglym/Documents/aircrack/test","w");
	char a[targetnum_max];
	for(targetnum = targetnum_start;targetnum<=targetnum_end;targetnum++)
	{
        fun_search1(a,0);
	}
	fclose(f);
	printf("finished\n");
}

void fun_search1(char *ans ,int num)
{
	if(num >= targetnum)
	{
		for(int i = 0;i< targetnum;i++)
		{
			fprintf(f,"%c",ans[i]);
		}
		fprintf(f,"\n");
		return;
	}
	int next = num + 1;
	for(int i = 0;i <num_ele;i++)
	{
		ans[num] = ele[i];
		fun_search1(ans,next);
	}
	return ;
}

