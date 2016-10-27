//
//  main.cpp
//  pat 1002
//
//  Created by 李阳 on 2016/10/17.
//  Copyright © 2016年 Xcode. All rights reserved.
//

#include <iostream>
using namespace std;
void Change(int num)
{
    switch (num) {
        case 0:
            cout<<"ling";
            break;
        case 1:
            cout<<"yi";
            break;
        case 2:
            cout<<"er";
            break;
        case 3:
            cout<<"san";
            break;
        case 4:
            cout<<"si";
            break;
        case 5:
            cout<<"wu";
            break;
        case 6:
            cout<<"liu";
            break;
        case 7:
            cout<<"qi";
            break;
        case 8:
            cout<<"ba";
            break;
        case 9:
            cout<<"jiu";
            break;
    }
}
int main(int argc, const char * argv[]) {
    string s;
    int m;
    cin>>s;
    int sum=0;
    int a[100]={0};
    int b[100]={0};
    for(int i=0;i<s.length();i++)
    {
        a[i]=(int)(s[i]-'0');
    }
    for(int i=0;i<s.length();i++)
    {
        sum=sum+a[i];
    }
    while(sum!=0)
    {
        b[m++]=sum%10;
        sum=sum/10;
    }
    for(int i=m-1;i>0;i--)
    {
        Change(b[i]);
        cout<<" ";
    }
    Change(b[0]);
    cout<<endl;
    return 0;
}
