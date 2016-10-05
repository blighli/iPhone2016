/*
 * date.c
 *
 * implementation of date.h
 *
 */
#include <string.h>
#include <stdlib.h>
#include <ctype.h>
#include <time.h>
#include "date.h"

int is_leap_year(int year)
{
	if (year < 0)
		return -1;
	if ( ((year % 4 == 0) && (year % 100 != 0)) || (year % 400 == 0))
		return 1;
	return 0;
}

int days_of_year(int year)
{
	if (year < 0)
		return -1;
	if (((year % 4 == 0) && (year % 100 != 0)) || (year % 400 == 0))
		return 366;
	return 365;
}

int days_of_year_month(int year, int month)
{
	if (month == 4 || month == 6 || month == 9 || month == 11)
		return 30;
	else if (month == 1 || month == 3 || month == 5 || month == 7 || month == 8 || month == 10 || month == 12)
		return 31;
	else if (((year % 4 == 0) && (year % 100 != 0)) || (year % 400 == 0)) // 闰年2月29天
		return 29;
	return 28;
}

/*
基姆拉尔森计算公式
W = (d + 2 * m + 3 * (m + 1) / 5 + y + y / 4 - y / 100 + y / 400) % 7, 其中y是年，m是月，d是日，
有两点要注意：当m是一月或2月时，算作上一年的13月或14月，例如：2013 - 1 - 1应记作2012 - 13 - 1
此公式算出来的星期从0开始
*/
int week_of_year_month_day(int y, int m, int d)
{

	if (m == 1 || m == 2) {
		m += 12; y--;
	}
	int week = (d + 2 * m + 3 * (m + 1) / 5 + y + y / 4 - y / 100 + y / 400) % 7;
	return week + 1;
}

void print_cal_year_month(int year, int month)
{
	time_t now; //实例化time_t结构
	struct tm *timenow; //实例化tm结构指针
	time(&now);
	//time函数读取现在的时间(国际标准时间非北京时间)，然后传值给now
	timenow = localtime(&now);
	int now_year = timenow->tm_year + 1900;
	int now_month = timenow->tm_mon + 1;
	int now_day = timenow->tm_mday;

	// 居中显示 月份 和 年
	char monthen[][100] = {
		"",
		"January",
		"February",
		"March",
		"April",
		"May",
		"June",
		"July",
		"August",
		"September",
		"October",
		"November",
		"December",
	};

	char s[100];
	sprintf(s, "%s %d", monthen[month], year);
	int blackAdd = (7 * 3 + 2 - (int)strlen(s)) / 2;
	while (blackAdd--)
		printf(" ");
	printf("%s\n", s);

	// 显示这个月的日历
	int i, j;
	char weeks[][3] = { "Su", "Mo", "Tu", "We", "Th", "Fr", "Sa" };
	for (j = 0; j <= 6; j++)
	{
		if (j == 6)
			printf("%s\n", weeks[j]);
		else
			printf("%s ", weeks[j]);
	}

	int days = days_of_year_month(year, month); //
	int week = week_of_year_month_day(year, month, 1); //

	int blankNum = 0;
	if (week == 7)
		blankNum = 0;
	else{
		blankNum = week;
	}

	for (i = 0; i < blankNum; i++)
		printf("   ");// 3个空格

	for (i = 1; i <= days; i++)
	{
		if (i == days)
		{
			if(year == now_year && month == now_month && now_day == i)
				printf("\033[47;30m%2d\n\033[0m",i);
			else
				printf("%2d\n", i);
			break;
		}
		blankNum++;
		if (blankNum < 7)
			if(year == now_year && month == now_month && now_day == i)
				printf("\033[47;30m%2d \033[0m",i);
			else
				printf("%2d ", i);
		else{
			if(year == now_year && month == now_month && now_day == i)
				printf("\033[47;30m%2d\n\033[0m",i);
			else
				printf("%2d\n", i);
			blankNum = 0;
		}
	}
}

void print_cal_three_month(int monthdays1, int monthdays2, int monthdays3, int firstWeek, int index)
{
	int i, j, k;

	int week1 = firstWeek;
	int week2 = (monthdays1 % 7 + week1) % 7;  // 0 1 - 6,星期日记成0
	int week3 = (monthdays2 % 7 + week2) % 7;

	int month[3] = { monthdays1, monthdays2, monthdays3 }; // 每个月的天数
	int week[3] = { week1, week2, week3 };// 每个月开始时 是第星期几

	/*	char monthen[][] = { "",
	"January", "February", "March",
	"April", "May", "June",
	"July", "August", "September",
	"October", "November", "December" };
	*/
	char monthen[][100] = {
		"      January               February               March",
		"       April                  May                   June",
		"        July                 August              September",
		"      October               November              December"
	};

	printf("%s\n", monthen[index]);

	char weeks[][3] = { "Su", "Mo", "Tu", "We", "Th", "Fr", "Sa" };

	for (i = 0; i <= 2; i++)
	{
		for (j = 0; j <= 6; j++)
		{
			if (j == 6)
				printf("%s", weeks[j]);
			else
				printf("%s ", weeks[j]);
		}
		if (i != 2) // 每个月中间隔两个空格
			printf("  ");
	}
	printf("\n");

	int b[3] = { 0, 0, 0 }; // 判断是否一个月份已经打印完成
	int days[3] = { 1, 1, 1 };	// 每个月开始日

	for (i = 1; i <= 6; i++) // 最多6行
	{
		for (j = 0; j < 3; j++) // 3个月一次打印
		{
			int startday = days[j];
			int l = 0;

			for (l = 0; l < week[j]; l++)
				printf("   "); // 3个空格

			for (k = week[j]; k <= 6; k++)
			{
				if (startday <= month[j]) // 小于当前月的总天数
				{
					if (k == 6)// || startday == month[j])
						printf("%2d", startday++);
					else
						printf("%2d ", startday++);
				}
				else{ // 超过日期了 多于的空格需要打印出来
					if (k == 6)
						printf("  ");
					else
						printf("   ");


				}
				week[j] = (week[j] + 1) % 7;
			}
			// 上面week[j] 加的时候多加了1 ,这里做减去的处理
			int tmp = week[j] - 1;
			if (tmp < 0)
				tmp = 6;

			for (l = tmp; l < 6; l++)
				printf("   "); // 3个空格

			days[j] = startday; // 改变startday
			if (days[j] > month[j])
				b[j] = 1;
			if (j != 2) // 每个月 隔两个空格
				printf("  ");
		}
		printf("\n"); // 每一行结束
		//最多6行，若都结束了就可以退出了
		if (b[0] == 1 && b[1] == 1 && b[2] == 1)
			break;
	}// end for

}

void print_cal_year(int year)
{
	int i;
	printf("                            %d\n", year);
	int month[13];
	for (i = 1; i <= 12; i++)
	{
		month[i] = days_of_year_month(year, i);
	}

	int startweeks[] = {
		week_of_year_month_day(year, 1, 1),
		week_of_year_month_day(year, 4, 1),
		week_of_year_month_day(year, 7, 1),
		week_of_year_month_day(year, 10, 1) };

	for (i = 0; i < 4; i++)
	{
		print_cal_three_month(month[i * 3 + 1], month[i * 3 + 2], month[i * 3 + 3], startweeks[i], i);
		if (i != 3)
			printf("\n");
	}
}

int check_valid_year(char* year)
{
	int i;
	int len = strlen(year);
	for (i = 0; i < len; i++)
	{
		if (!(year[i] >= '0' && year[i] <= '9'))
			return -1;
	}
	int y = atoi(year);
	if (y >= 1 && y <= 9999)
		return y;
	return -2;
}


int check_valid_month(char* month)
{
	int i;
	int len = strlen(month);
	int y = atoi(month);
	if (y >= 1 && y <= 12)
		return y;

	if (len < 3)
		return -1;

	char s[4];
	for (i = 0; i < 3; i++)
	{
		if (isalpha(month[i])){
			if (i == 0)
				s[i] = toupper(month[i]);
			else
				s[i] = tolower(month[i]);
		}
		else{
			return -2;
		}
	}
	s[3] = '\0';
	char monthen[][100] = {
		"Jan",
		"Feb",
		"Mar",
		"Apr",
		"May",
		"Jun",
		"Jul",
		"Aug",
		"Sep",
		"Oct",
		"Nov",
		"Dec",
	};
	for (i = 0; i < 12; i++){
		if ((int)strcmp(s, monthen[i]) == 0)
			return i + 1;
	}
	return -2;
}
