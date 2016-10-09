package com.calender;
import java.time.YearMonth;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.Scanner;

public class MyCalender {

    public static void main(String[] args)
    {
    	Calendar now = Calendar.getInstance();
    	Scanner sc = new Scanner(System.in);
    	System.out.println("Enter Year : ");
    	String k = sc.nextLine();
    	sc.close();
    	if (k.equals("cal")) {
			System.out.println("current month");
			int year =  now.get(Calendar.YEAR);
		    int month = now.get(Calendar.MONTH);
		    int date = now.get(Calendar.DATE);
		    Calendar mycal = new GregorianCalendar(year, month, date);
		    int daysInMonth = mycal.getActualMaximum(Calendar.DAY_OF_MONTH);
		    YearMonth ym = YearMonth.of(year, month+1);
		    String firstDay = ym.atDay(1).getDayOfWeek().name();
		    System.out.println(firstDay);
		    printDates(firstDay, daysInMonth);
		}else {
			System.out.println("complete year");
			k = k.substring(k.lastIndexOf(' ')+1, k.length());
			int selectedYear = Integer.parseInt(k);
			Calendar cal = new GregorianCalendar();
			for (int j = 0; j < 12; j++) {
				cal.set(selectedYear, j, 1);
				YearMonth ym = YearMonth.of(selectedYear, j+1);
			    String firstDay = ym.atDay(1).getDayOfWeek().name();
			    int daysInMonth = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
			    printDates(firstDay, daysInMonth);
			    System.out.println();
			    System.out.println();
			}
		}
    }

	public  static void printDates(String firstDay, int daysInMonth) {
		System.out.println("Su Mo Tu We Th Fr Sa");
	    for (int i = 1; i <= daysInMonth; i++) {
			if (firstDay.equals("MONDAY")) {
				if (i == 1) {
					System.out.print("  ");
				}
				if (i<=9) {
					System.out.print("  "+i);
				}else {
					System.out.print(" "+i);
				}
				if (i<=7) {
					if (i%6 == 0) {
						System.out.println();
					}
				} else {
					if (i%7 == 6) {
						System.out.println();
					}
				}
				
			} else if (firstDay.equals("TUESDAY")) {
				if (i == 1) {
					System.out.print("    ");
				}
				if (i<=9) {
					System.out.print("  "+i);
				}else {
					System.out.print(" "+i);
				}
				
				if (i<=7) {
					if (i%5 == 0) {
						System.out.println();
					}
				} else {
					if (i%7 == 5) {
						System.out.println();
					}
				}
			}else if (firstDay.equals("WEDNESDAY")) {
				if (i == 1) {
					System.out.print("        ");
				}
				if (i<=9) {
					System.out.print("  "+i);
				}else {
					System.out.print(" "+i);
				}
				
				if (i<=7) {
					if (i%4 == 0) {
						System.out.println();
					}
				} else {
					if (i%7 == 4) {
						System.out.println();
					}
				}
			}else if (firstDay.equals("THURSDAY")) {
				if (i == 1) {
					System.out.print("           ");
				}
				if (i<=9) {
					System.out.print("  "+i);
				}else {
					System.out.print(" "+i);
				}
				
				if (i<=7) {
					if ((i%3 == 0) && (i != 6) ) {
						
						System.out.println();
					}
				} else {
					if (i%7 == 3) {
						System.out.println();
					}
				}
			}else if (firstDay.equals("FRIDAY")) {
				if (i == 1) {
					System.out.print("             ");
				}
				if (i<=9) {
					System.out.print("  "+i);
				}else {
					System.out.print(" "+i);
				}
				
				if (i<=7) {
					if ((i%2 == 0) && (i!= 4) && (i!=6)) {
						System.out.println();
					}
				} else {
					if (i%7 == 2) {
						System.out.println();
					}
				}
			}else if (firstDay.equals("SATURDAY")) {
				if (i == 1) {
					System.out.print("                 ");
				}
				if (i<=9) {
					System.out.print("  "+i);
				}else {
					System.out.print(" "+i);
				}
				
				if (i<=7) {
					if ((i%1 == 0)&&(i!=2)&&(i!=3)&&(i!=4)&&(i!=5)&&(i!=6)&&(i!=7)&&(i!=8)) {
						System.out.println();
					}
				} else {
					if (i%7 == 1) {
						System.out.println();
					}
				}
			} else {
				if (i == 1) {
					System.out.print("");
				}
				if (i<=9) {
					System.out.print("  "+i);
				}else {
					System.out.print(" "+i);
				}
				
				if (i<7) {
				} else {
					if (i%7 == 0) {
						System.out.println();
					}
				}
			}
		}
	}
}
